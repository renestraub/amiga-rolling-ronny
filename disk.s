
		XDEF	WriteData,ReadData
		XREF	_SysBase

		INCDIR	h:
		INCLUDE	"MyExec.i"

;-----------Daten schreiben/a0=quelle----------------------------

WriteData:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	#10000*2,d0
		SYSCALL	AllocClearMem
		move.l	d0,MFMBuffer
		move.l	d0,DiskStr

		move	#$4000,$dff09a			;ints. sperren
		move.l	a0,DiskStr+4			;QuellAdresse setzen
		bsr	DeSeldf1			;Laufwerk 0
		bsr	DeSeldf0			;+1 deselektieren
		bsr	MotorOn				;Motor einschalten
		bsr	Seldf0				;Laufwerk 0 selektieren
		bsr	Bump				;auf Track 0 setzen
		bsr	Hd1				;rueckseite
		bsr	Goto79
		bsr	CodeTrack			;Track kodieren
		bsr	WriteSTrack			;Track schreiben
		bsr	DeSeldf0			;Laufwerk deselektieren
		bsr	MotorOff			;Motor aus
		move	#$000a,$dff09c
		move	#$c000,$dff09a			;ints. an

		move.l	MFMBuffer,a1
		SYSCALL	FreeMem
		movem.l	(sp)+,d0-d7/a0-a6
		rts

;------------Daten lesen / a0=ziel ----------------------------------
 
ReadData:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	#10000*2,d0
		SYSCALL	AllocClearMem
		move.l	d0,DiskStr
		move.l	d0,MFMBuffer

		move	#$4000,$dff09a			;ints. sperren
		move.l	a0,DiskStr+4			;ZielAdresse setzen
		bsr	DeSeldf1			;Laufwerk 0
		bsr	DeSeldf0			;+1 deselektieren
		bsr	MotorOn				;Motor einschalten
		bsr	Seldf0				;Laufwerk 0 selektieren
		bsr	Bump				;auf Track 0 setzen
		bsr	Hd1				;rueckseite
		bsr	Goto79
		bsr.s	ReadSTrack			;Track lesen
		bsr	DeCodeTrack			;Track dekodieren
		bsr	MotorOff			;Motor aus
		move	#$000a,$dff09c
		move	#$c000,$dff09a			;ints. an

		move.l	MFMBuffer,a1
		SYSCALL	FreeMem
		movem.l	(sp)+,d0-d7/a0-a6
		rts

ReadSTrack:	movem.l	d1-d7/a0-a6,-(SP)
		bsr	WaitReady
		lea	$dff000,a0
		lea	DiskStr,a1
		move.l	(A1),$20(A0)		;disptr
		move	#$7fff,$9e(A0)
		move	#$9500,$9e(A0)		;adcon
		move	#$4489,$7e(A0)		;sync
		move	#$4000,$24(A0)
		move	#2,$9c(A0)
		move	#$8000+4000,$24(A0)
		move	#$8000+4000,$24(A0)
		clr.l	d0

		move.l	#100000,d7

WaitBlockRead:	btst	#1,$1f(a0)
		bne.s	EndReadTrack

		move.w	$dff01e,d0
		sub.l	#1,d7
		bne.s	WaitBlockRead
		moveq	#-1,d0

EndReadTrack:	move	#$4000,$24(A0)
		movem.l	(SP)+,d1-d7/a0-a6
		rts

WriteSTrack:	movem.l	d7/a0/a1,-(SP)
		bsr	WaitReady
		lea	$dff000,a0
		lea	DiskStr,a1
		move	#$8010,$96(A0)
		move.l	(A1),$20(A0)		;disptr
		move	#$7fff,$9e(A0)
		move	#$9100,$9e(A0)		;adcon
		move	#$4489,$7e(A0)		;sync
		move	#$4000,$24(A0)
		move	#2,$9c(A0)
		move	#$c000+7170,$24(A0)
		move	#$c000+7170,$24(A0)
		clr.l	d0
		move.l	#100000,d7

WaitBlockWrite:	btst	#1,$1f(a0)
		bne.s	EndWriteTrack

		move.w	$dff01e,d0
		sub.l	#1,d7
		bne.s	WaitBlockWrite
		moveq	#-1,d0

EndWriteTrack:	move	#$4000,$24(A0)
		movem.l	(SP)+,d7/a0/a1
		rts


MotorOn:	bclr	#7,$bfd100
		rts
MotorOff:	bset	#7,$bfd100
		rts
Seldf0:		bclr	#3,$bfd100
		rts
Seldf1:		bclr	#4,$bfd100
		rts
Seldf2:		bclr	#5,$bfd100
		rts
Seldf3:		bclr	#6,$bfd100
		rts
DeSeldf0:	bset	#3,$bfd100
		rts
DeSeldf1:	bset	#4,$bfd100
		rts
DeSeldf2:	bset	#5,$bfd100
		rts
DeSeldf3:	bset	#6,$bfd100
		rts

Hd1:		bclr	#2,$bfd100
		bsr	WaitReady
		rts

Hd0:		bset	#2,$bfd100
		bsr	WaitReady
		rts

Goto79:		movem.l	d0-d7/a0-a6,-(sp)
		moveq	#79-1,d4
1$:		bsr	Delay1
		bsr	StepUp
		dbf	d4,1$
		movem.l	(sp)+,d0-d7/a0-a6
		rts


StepUp:		bsr	WaitReady
		bclr	#1,$bfd100
		bclr	#0,$bfd100
		nop
		nop
		bset	#0,$bfd100
		bsr.s	Delay
		bsr	WaitReady
		rts

StepDown:	bsr	WaitReady
		bset	#1,$bfd100
		bclr	#0,$bfd100
		nop
		nop
		bset	#0,$bfd100
		bsr.s	Delay
		bsr	WaitReady
		rts
	
Bump:		bsr	Delay
		btst	#4,$bfe001
		beq.s	EndBump
		bsr.s	StepDown
		bra.s	Bump
EndBump:	rts

Delay:		movem.l	d6/d7,-(SP)
		move.w	#2000,d7
.DelayLoop:
		move.w	$dff01e,d0
		mulu	d6,d6
		dbf	d7,.DelayLoop
		movem.l	(SP)+,d7/d6
		rts

Delay1:		movem.l	d6/d7,-(SP)
		move.w	#1000,d7
.DelayLoop:
		move.w	$dff01e,d0
		mulu	d6,d6
		dbf	d7,.DelayLoop
		movem.l	(SP)+,d7/d6
		rts
	
CodeTrack:	movem.l	d0-d7/a0-a6,-(SP)
		lea	DiskStr,a2
		move.l	(a2),a0
		move.l	4(A2),a1
		move.l	#$aaaaaaaa,d0
		move	#16384/4-1,d1

GapLoop:	move.l	d0,(A0)+
		dbf	d1,GapLoop
		move.l	(A2),a0
		add.w	#2048,a0
		move.l	#$44894489,(A0)+
		move.b	#$fe,d0			;Chris Format 1.0
		lsl.l	#8,d0
		move.b	TrackNumber,d0		;track
		lsl.l	#8,d0
		lsl.l	#8,d0
		move	ID,d0			;id
		bsr.s	EncodeMFM
		move	#(512/4)-1,d1		;Bytes

EncodeLoop:	move.l	(A1)+,d0
		bsr.s	EncodeMFM
		dbf	d1,EncodeLoop
		clr.l	d0
		bsr.s	EncodeMFM
		movem.l	(SP)+,d0-d7/a0-a6
		rts


EncodeMFM:				;codiert d0 nach a0
		movem.l	d1-d4,-(SP)
		moveq	#31,d4
		move.l	d0,d3
		lsr.l	#1,d0
		bsr.s	EncodeLong
		move.l	d3,d0
		bsr.s	EncodeLong
		bsr.s	CheckMFM
		movem.l	(SP)+,d1-d4
		rts

EncodeLong:	and.l	#$55555555,d0
		move.l	d0,d2
		eor.l	#$55555555,d2
		move.l	d2,d1
		lsl.l	#1,d2
		lsr.l	#1,d1
		bset	d4,d1
		and.l	d2,d1
		or.l	d1,d0
		btst	#0,-1(A0)
		beq.s	MFM1
		bclr	d4,d0
MFM1:		move.l	d0,(A0)+
		move.l	#$aaaaaaaa,(a0)
		rts

CheckMFM:	move.b	(A0),d0
		btst	#0,-1(A0)
		bne.s	MFM2
		btst	#6,d0
		bne.s	MFM3
		bset	#7,d0
		bra.s	MFM4
MFM2:		bclr	#7,d0
MFM4:		move.b	d0,(A0)
MFM3:		rts


DeCodeTrack:	movem.l	d0-d7/a0-a6,-(SP)
		lea	DiskStr,a2
		move.l	(A2),a0
		add.l	#10,a0
		move.l	4(A2),a1
		
		move.l	(A0)+,d0
		move.l	(A0)+,d1
		and.l	#$55555555,d0
		and.l	#$55555555,d1
		lsl.l	#1,d0
		or.l	d1,d0

		cmp.l	#12345678,d0
		bne.s	.NotFound

		move.l	d0,(a1)+

		move.w	#(120/4)-1,d2

.DecodeLoop:	move.l	(A0)+,d0
		move.l	(A0)+,d1
		and.l	#$55555555,d0
		and.l	#$55555555,d1
		lsl.l	#1,d0
		or.l	d1,d0
		move.l	d0,(A1)+
		dbf	d2,.DecodeLoop
.NotFound:	movem.l	(SP)+,d0-d7/a0-a6
		rts
	
		
WaitReady:	btst	#5,$bfe001
		bne.s	WaitReady
		rts	


MFMBuffer:	dc.l	0
DiskStr:	dc.l	0			;mfmbuffer
		dc.l	0			;binbuffer
ID:		dc.b	'CH'
TrackNumber:	dc.b	0
end:

		SECTION	test,BSS_C
