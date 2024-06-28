	opt	l+,c+,d+



	XDEF InitDecruBuffer	;a1=(a0/a1)
				;BufferLenght=(BufferStart,BufferEnd)

	XDEF Decruncher		;d0=(a0) DestFileEnd(SourceFileStart)




	;-----         Example :              -----
	;----- define labels for BufferStruct -----
	;( 32 Bytes <= decrunch buffer < 32KB und LongWord-Aligned ! )

	;	BSS
	;BufferStart:		DS.L	256
	;BufferEnd:
	;BufferLenght:	equ BufferEnd-BufferStart
	;	CODE


	;	lea	BufferStart,a0
	;	lea	BufferEnd,a0
	;	bsr	InitDecruBuffer

	;	lea	CrunchedFile,a0
	;	bsr	Decruncher







	;==================== Decruncher Routines ====================




	;------- Decru Buffer Structure -------

	BSS
BufferStart:		DS.L	1
BufferEnd:		DS.L	1
BufferLenght:		DS.L	1
	CODE







InitDecruBuffer:	;a1=(a0/a1)	BufferLenght=(BufferStart,BufferEnd)

		move.l	a0,BufferStart
		move.l	a1,BufferEnd
		sub.l	a0,a1
		move.l	a1,BufferLenght
		rts






Decruncher:	;	DestFileEnd = DeCruncher(SourceFileStart)
		;	     d0				a0


	;Nur diese Routine muss zum Decrunchen angesprungen werden !
	;Die Verteilung erfolgt automatisch.


	;Die Buffer-Structure muss ausgefüllt sein !

	;BufferLenght >= 32 Byte



			moveq	#0,d0
			move.b	(a0),d0			;Get CruncherNr
			beq.s	.NoDecrunching		;No Cruncher => Exit
			bmi.s	.SeqDecrunching		;More than One

.GoDecruncher:		cmp.b	#1,d0			;MultiCruncher ?
			beq	MultiDecruncher		;Yes => Decrunch
			cmp.b	#4,d0			;FlexCruncher ?
			bls	.GoFlexCodeDecru	;Yes => Decrunch

.NoDecrunching:		rts





.SeqDecrunching:				;more than one cruncher
			bclr	#7,d0
			bsr	.GoDecruncher	;start decruncher first time
			bra	Decruncher	;start for the second time


.GoFlexCodeDecru:	subq.l	#2,d0		;transfers Cruncher Typ
						;to CodeCruncher Mode
			bra	FlexibleCodeDecruncher
						;starts CodeDecruncher











	;============ Multi Decruncher ==============================



	;	DestFileEnd = DeCruncher(BufferMemStart)
	;	     d0				a0







MultiDecruncher:
		movem.l	d1-d7/a0-a6,-(a7)

		clr.b	(a0)			;Clr Cruncher Nr

		move.l	0(a0),a1		;get Cru File Len
		lea	(a0,a1.L),a1		;Cru File End

		move.l	4(a0),a2		;get Dest File Len
		lea	(a0,a2.L),a2		;Dest File End
		move.l	a2,-(a7)

		move.l	8(a0),-(a7)		;Save CruFrameLen/CruFrameNr






		move.l	12(a0),StartBuffer	;Save first 12 Bytes
		move.l	16(a0),StartBuffer+4
		move.l	20(a0),StartBuffer+8

		lea	12(a0),a0		;Low End of Range
						;for decrunched File
						;(Start + 12 Bytes uncrunched)




		move.l	a1,a5			;Copy CodeFile End
		move.l	BufferEnd,a1		;to external Buffer
		move.l	a1,a6			;DecrunchBuffer

		move.l	BufferLenght,d0		;BufferLenght
		lsr.l	#2,d0			; / 4
		subq.l	#1,d0			; - 1

.CopyLoop:	move.l	-(a5),-(a6)
		dbra	d0,.CopyLoop





NextByte:	move.b	-(a1),d0		;Get mask Byte
		move.b	-(a5),(a1)		;refill Buffer
		cmp.l	a6,a1			;BufferStart < ReadPointer
		bhi.s	.NoBufferStart		;Yes => Ok
		move.l	BufferEnd,a1		;No => ReadPointer = BufferEnd
.NoBufferStart:

		tst.b	d0
		bmi	NonFilterCruncher
		beq	EqualBytesCruncher






FilterCruncher:
		moveq	#6,d1			;7 Bits

.Loop:		btst	d1,d0			;Bit in Mask ?
		beq.s	.SetZeroByte		;0 =>
.SetNonZeroByte:
		move.b	-(a1),-(a2)		;Bit was set =
		move.b	-(a5),(a1)		;refill Buffer
		cmp.l	a6,a1			;BufferStart < ReadPointer
		bhi.s	.NoBufferStart		;Yes => Ok
		move.l	BufferEnd,a1		;No => ReadPointer = BufferEnd
.NoBufferStart:
		dbra	d1,.Loop		;Byte was copied
		bra.s	DestStepFinished	;to comp file

.SetZeroByte:	clr.b	-(a2)			;Bit was cleared =
		dbra	d1,.Loop		;Byte was left out








DestStepFinished:
	;;	move	d0,$dff180		;Mark decrunch time
		cmp.l	a0,a2			;End Adr of Dest
		bhi.s	NextByte		;reached ?   No =>




		lea	StartBuffer+12,a1
		move.l	-(a1),-(a0)		;First 12 Bytes
		move.l	-(a1),-(a0)		;uncrunched
		move.l	-(a1),-(a0)






DePreCruncher:	move	(a7)+,d1		;get CruFrameLen
		move	(a7)+,d2		;get CruFrameNr
		move.l	(a7)+,d0		;get DestEnd

		tst	d1			;CruFrameLen = 0
		beq.s	.NoPreDecruncher	;=> Exit De-PreCruncher

		subq.l	#2,d2			;CruFrameLen-2 (1 für dbra)
		subq.l	#1,d1			;CruFrameNr -1 (für dbra)


.FrameGroupLoop:lea	1(a0,d1.w),a1		;FrameEnd

		move	d2,d4			;double Hi-Level Counter

.FrameLoop:	move	d1,d3			;double Lo-Level Counter

.ByteLoop:	move.b	(a0)+,d5		;EOR one Frame
		eor.b	d5,(a1)+
		dbra	d3,.ByteLoop		;No End Of Frame => Loop

		dbra	d4,.FrameLoop		;No End Of Frames => Loop

		move.l	a1,a0			;Next FrameStart

		cmp.l	a0,d0			;End Of File reached ?
		bhi.s	.FrameGroupLoop		;No => Loop

.NoPreDecruncher:
		movem.l	(a7)+,d1-d7/a0-a6
		rts









	;Verteiler    Data / Zero Decrunching


NonFilterCruncher:
		btst	#6,d0
		beq.s	ZeroRangeDecruncher





	;Decrunched DataRange ( different Bytes <> 0 )

DataRangeDecruncher:
		and	#63,d0			;Clear ModeFlags
		addq.l	#6,d0			;Counter + 7 - 1(dbra)

.Loop:		move.b	-(a1),-(a2)		;Copy uncompacted Bytes
		move.b	-(a5),(a1)		;refill Buffer
		cmp.l	a6,a1			;BufferStart < ReadPointer
		bhi.s	.NoBufferStart		;Yes => Ok
		move.l	BufferEnd,a1		;No => ReadPointer = BufferEnd
.NoBufferStart:
		dbra	d0,.Loop
		bra.s	DestStepFinished






	;Decrunched Zero-Range


ZeroRangeDecruncher:
		and	#63,d0			;Clear ModeFlags
		addq.l	#6,d0			;Counter + 7 - 1(dbra)
		moveq	#0,d3			;DataByte = 0

.Loop:		move.b	d3,-(a2)		;Clear DataRange
		dbra	d0,.Loop
		bra.s	DestStepFinished






	;Decrunch Datarange  (equal Bytes <> 0)


EqualBytesCruncher:
		move.b	-(a1),d3		;Get Data Byte
		move.b	-(a5),(a1)		;refill Buffer
		cmp.l	a6,a1			;BufferStart < ReadPointer
		bhi.s	.NoPreExpStart		;Yes => Ok
		move.l	BufferEnd,a1		;No => ReadPointer = BufferEnd
.NoPreExpStart:
		moveq	#0,d0
		move.b	-(a1),d0		;Get Counter
		move.b	-(a5),(a1)		;refill Buffer
		cmp.l	a6,a1			;BufferStart < ReadPointer
		bhi.s	.NoBufferStart		;Yes => Ok
		move.l	BufferEnd,a1		;No => ReadPointer = BufferEnd
.NoBufferStart:
		addq.l	#6,d0			;Counter + 7 - 1(dbra)


.Loop:		move.b	d3,-(a2)		;Fill DataRange
		dbra	d0,.Loop
		bra	DestStepFinished






	;-------- Local Buffer for first 12 Bytes -----------------

	BSS
StartBuffer:		DS.L	3
	CODE
























;================== Flexible Code Decruncher ===========================


;OrgFileEnd = Decruncher(FileMemStart/DecrunchMode)

;	d0			a0		d0


;CruncherModes: 0/1/2 = Flex/Sound1/Sound2



FlexibleCodeDecruncher:

		movem.l	d1-d7/a0-a6,-(a7)
		bsr.s	SetAdr
		bsr.s	CopyDecodeTab
		bsr.s	CopyBuffer
		bsr	Decrunchen
		movem.l	(a7)+,d1-d7/a0-a6
		rts




	;------ BereichsAdressen merken ------

SetAdr:		move.l	a0,a4			;=== DestStart ===

		clr.b	(a0)			;Clr CruncherNr
		move.l	(a0),d1			;Get CodedFile Len
		lea	(a0,d1.L),a5		; + SourceFile Start
						;=== SourceEnd ===

		move.l	4(a0),d1		;Get OrgFile Len
		lea	(a0,d1.L),a6		; + SourceFile Start
						;=== DestEnd ====

		subq.l	#1,d0			;Test DecrunchMode
		beq.s	.CrunchMode1
		subq.l	#1,d0
		beq.s	.CrunchMode2

.CrunchMode0:	lea	Ableitung0,a2		;Set Routine Pointer
		rts
.CrunchMode1:	lea	Ableitung1,a2
		rts
.CrunchMode2:	lea	Ableitung2,a2
		rts
		rts





		;------ Copy CodeListe -------


CopyDecodeTab:	move.l	a5,a0			;Source End
		lea	DecodeTabEnd,a1

		moveq	#63,d0			;64*4 = 256 Bytes

.CopyLoop:	move.l	-(a0),-(a1)		;Copy from CodeFile
		dbra	d0,.CopyLoop		;to Tab Buffer
		rts





	;-------- Copy Higher Part of CodeFile ----------

CopyBuffer:	lea	-256(a5),a5		;SourceEnd
		move.l	BufferEnd,a1


		move.l	BufferLenght,d0
		lsr.l	#2,d0
		subq.l	#1,d0

.CopyLoop:	move.l	-(a5),-(a1)		;copy CodeFile End
		dbra	d0,.CopyLoop		;to external Buffer


		rts			;a5 is now BufferRefillPointer






	;------- Hauptroutine Decruncher --------------



Decrunchen:	move.l	a6,-(a7)		;a6 = DestEnd

		move.l	BufferStart,a1		;Start of Exp Mem
		lea	DecodeTabStart,a3	;List of OrgBytes for
						;each CodeNr

						;a4 = DestStart

		move.l	BufferEnd,a0		;Buffer Read Pointer


		move	-(a0),-(a6)		;2 Bytes uncrunched
		move	-(a5),(a0)		;refill Buffer

		move.l	-(a0),d7		;Get BitQueue
		move.l	-(a5),(a0)		;refill Buffer

		moveq	#16,d4			;16 Bits ready
						;lesbar sind 32 Bits,
						;(immer mind. 16 Bits)


.NextCode:	btst	#0,d7			;Code         xx0
		beq	.Range0
		btst	#1,d7			;Code       xxx01
		beq.s	.Range1
		btst	#2,d7			;Code    xxxxx011
		beq.s	.Range2
		btst	#3,d7			;Code  xxxxxx0111
		beq.s	.Range3

		move	d7,d0
		lsr	#4,d0
		and	#%1111111,d0
		cmp	#%1111110,d0
		blo.s	.Range4			;Code xxxxxxx1111

	btst	#0,d0	;????? unnoetig ?????

		bne.s	.Range5	  		;Code xxxxx11111111111




.Range6:	moveq	#11,d1	    		;Direct Data Code
		bsr	GetBits			;Throw 11 Bits away
		move	d7,d0			;Get DataWord
		and	#%0000001111111111,d0	;only 10 Bits valid
		btst	#9,d0			;extend Signum to 16 Bits
		beq.s	.NoNegExtend
		or	#%1111110000000000,d0
.NoNegExtend:	moveq	#10,d1			;10 Bits used
		bra.s	.SaveExByte		;One Word! finished


.Range5:	move	d7,d0			;Get Word
		rol	#16-11,d0		;get Part with Data
		and	#%11111,d0		;mask 5 Data Bits
		add	#224,d0			;code offset
		move.b	0(a3,d0.w),d0		;get uncoded Byte
		moveq	#16,d1			;16 Bits used
		bra.s	.SaveByte		;One Byte! finished


.Range4:	;d0 is Data Part of d6 !
		move.b	108(a3,d0.w),d0		;get uncodes Byte
		moveq	#11,d1			;11 Bits used
		bra.s	.SaveByte		;Byte finished


.Range3:	move	d7,d0
		lsr	#4,d0			;get Part with Data
		and	#%111111,d0		;mask 6 Data Bits
		move.b	44(a3,d0.w),d0		;get uncoded Byte
		moveq	#10,d1			;10 Bits used
		bra.s	.SaveByte		;Byte finished


.Range2:	move	d7,d0
		lsr	#3,d0			;get Part with Data
		and	#%11111,d0		;mask 5 Data Bits
		move.b	12(a3,d0.w),d0		;get uncoded Byte
		moveq	#8,d1			;8 Bits used
		bra.s	.SaveByte		;Byte finished


.Range1:	move	d7,d0
		lsr	#2,d0			;get Part with Data
		and	#%111,d0		;mask 3 Data Bits
		move.b	4(a3,d0.w),d0		;get uncoded Byte
		moveq	#5,d1			;5 Bits used
		bra.s	.SaveByte		;Byte finished


.Range0:	move	d7,d0
		lsr	#1,d0			;get Part with Data
		and	#%11,d0			;mask 2 Data Bits
		move.b	(a3,d0.w),d0		;get uncodes Byte
		moveq	#3,d1			;3 Bits used


.SaveByte:	ext	d0			;expand Byte to Word
.SaveExByte:	bsr.s	GetBits			;Get New Bits
						;throw away invalid Bits

		jsr	(a2)			;derivation backwards

	;;	move.b	d0,$dff180

		move.b	d0,-(a6)		;save Byte
		cmp.l	a4,a6
		bhi	.NextCode

		move.l	(a7)+,d0		;End of OrgFile
		rts





	;------- Derivation Backwards + Signum correction -----


Ableitung1:	move.b	(a6),d1			;test previous byte
		tst.b	d1			;if positiv,
		bmi	.NoChange		; neg actual Byte
		neg	d0			;(like it was before)
.NoChange:
		ext	d1			;get previous byte
		add	d1,d0			;add it to actual Byte
Ableitung0:	rts





Ableitung2:	move.b	(a6),d1			;get previous byte
		tst.b	d1			;if positiv,
		bmi	.NoChange		; neg actual Byte
		neg	d0			;(like it was before)
.NoChange:
		ext	d1
		add	d1,d0			;add it two times
		add	d1,d0			;add it two times

		move.b	1(a6),d1		;sub last previous byte
		ext	d1
		sub	d1,d0
		rts





	;---- Bitschlange d7 um d1 Anzahl Bits weiterrotieren -----
		;d4 = schon bereitgestellte Bits
		;lesbar sind immer d4+16 Bits, d.h. mindestens 16

GetBits:	cmp	d1,d4			;more bytes given
		bhi.s	.Ok			;then to rotate =>

		sub	d4,d1			;how much too less ?

	;Rotate all valid Bits, then get 16 New
		lsr.l	d4,d7			;insert all valid bits
		swap	d7			;empty Word to LO-Word
		move	-(a0),d7		;get new Word
		swap	d7			;New Word to Hi-Word
		moveq	#16,d4			;16 new Bits ready

		move	-(a5),(a0)		;refill Buffer
		cmp.l	a1,a0			;if ReadPointer = BufferStart
		bne.s	.NoBufferRestart	;then
		move.l	BufferEnd,a0		;reset Pointer to BufferEnd
.NoBufferRestart:

	;Rotate d1 Bits
.Ok:		lsr.l	d1,d7			;insert rest of bits
		sub	d1,d4			;calc new Nr of free bits
		rts





 	;dc.w 0,4,12,44,108,244,256			;Begin CodeNr of next Range
 	;dc.w %0,%01,%011,%0111,%1111,%11111111111	;Range Flags
 	;dc.w 1,2,3,4,4,11				;Lenght of RangeFlags
 	;dc.w 2,3,5,6,7,5				;Lenght of RestCode



	BSS
DecodeTabStart:	DS.L	64			;OrgBytes for each
						;Codebyte
DecodeTabEnd:
	CODE













CodeEnd:




