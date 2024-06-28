
		IDNT	FastFileSystem
		SECTION	text,CODE

	IFD RAMVERSION

		INCLUDE	"MyExec.i"

		XDEF	ProcessFFSPacket

***************************************************************************

	*** A0: CDisk-Packet

ProcessFFSPacket:
		movem.l	d0-d7/a0-a6,-(SP)
		movea.l	a0,a2			; A2 :  Packet
		movea.l	dp_FileName(a2),a4	; A4 :  Name
		movea.l	dp_Address(a2),a5	; A5 :  Ziel-Adresse
		bsr.s	StraubFile
		movem.l	(SP)+,d0-d7/a0-a6
		rts

***************************************************************************

StraubFile:	bsr	ReadDir
		move.l	a4,a1			; Filename
		bsr	CalcHash		; Setzt Z falls Error
		beq	.FileNotFound

                lea	Buffer,a0
		move.l	0(a0,d0.w),d6		; FileHeaderBlock
		beq	.FileNotFound		; Kein Eintrag --->

1$:		lea	Buffer,a0
		bsr	ReadOneBlock		; FileHeaderBlock lesen

		move.l	a4,a1
		lea	Buffer+432,a6		; Filename im Header-Block
		move.b	#$df,d2			; ToUpper-Maske
		moveq	#0,d7
		move.b	(a6)+,d7		; String-Länge
		subq.w	#1,d7			; Für dbf
2$:		move.b	(a6)+,d0
		move.b	(a1)+,d1
		and.b	d2,d0
		and.b	d2,d1
		cmp.b	d0,d1
		bne	.CheckNextHash		; Falscher Name --->
		dbf	d7,2$

		moveq	#-3,d0			; BlockTyp FILE
		cmp.l	Buffer+508,d0		; Ist's ein File ?
		bne	.NotAFile		; nein --->

		move.l	Buffer+324,d3		; File-Länge in Bytes

		btst.b	#DPB_ALLOCMEM,dp_Flags(a2) ; CHIP-Alloc gewünscht ?
		beq.s	.NoChipAlloc		; nein --->
		move.l	d3,d0			; File-Länge
		jsr	AllocMem
		bra.s	.AllocCont		; --->
.NoChipAlloc:
		btst.b	#DPB_ALLOCFASTMEM,dp_Flags(a2) ; FAST-Alloc gewünscht?
		beq.s	.NoFastAlloc		; nein --->
		move.l	d3,d0			; File-Länge
		jsr	AllocFastMem
.AllocCont:	move.l	d0,dp_Address(a2)	; Adresse ins Packet
		movea.l	d0,a5
.NoFastAlloc:
		andi.l	#511,d3			; Länge des letzten Blockes
		bne.s	3$			; Geht nicht auf durch 512 -->
		move.l	#512,d3			; Sonst volle Blocklänge
3$:
4$:		lea	Buffer+312,a3		; Ende der Blocktabelle

.ReadBlockLoop:	cmp.l	#Buffer+24,a3		; Anfang der Tabelle erreicht?
		beq	.ReadExtension		; ja ---> Extension suchen

		move.l	#512,d7
		move.l	-(a3),d6		; Nächste Blocknummer
		tst.l	-4(a3)			; Ist's der letzte Block ?
		beq	.ReadLastBlock		; ja --->
		tst.l	d6
		beq	.End			; Keine Blöcke mehr (?!)

		move.l	a3,a6
		move.l	d6,d5			; zu lesender Block

11$:		addq.l	#1,d5			; Nächste Blocknummer
		tst.l	-8(a6)			; Letzter Block ?
		beq	13$			; ja ---> nicht lesen
		cmp.l	-(a6),d5		; Aufeinanderfolgender Block ?
		bne.s	12$			; nein --->

		add.l	#512,d7			; Read-Len += blocksize
		bra	11$			; ---> weiter suchen
12$:
		addq.l	#4,a6
13$:
		move.l	a6,a3			; Korrigierter Block-Ptr
10$:
		move.l	a5,a0			; Destination for ReadBlocks()
		bsr	ReadBlocks
		add.l	d7,a5			; Dest += len
		bra	.ReadBlockLoop		; ---> Loop

.ReadExtension:	move.l	Buffer+504,d6
		lea	Buffer,a0
		bsr	ReadOneBlock		; Extension laden
		bra	4$			; weiter laden

.ReadLastBlock:	lea	Buffer,a0
		bsr	ReadOneBlock		; Letzten Block lesen

		lea	Buffer,a0
		bra.s	100$
15$:		move.b	(a0)+,(a5)+		; Letzten Block kopieren
100$:		dbf	d3,15$
		bra	.End

.CheckNextHash:	move.l	Buffer+496,d6		; Next block in hash chain
		bne	1$			; nicht 0 ---> lesen

.FileNotFound:	ALERT	AN_FILENOTFOUND
		jmp	ABORT

.NotAFile:	ALERT	AN_NOTAFILE
		jmp	ABORT

.End:		rts

***************************************************************************

CalcHash:	tst.b	(a1)
		beq	.Error

                move.l	a1,a6			; Hash := strlen(name)
		moveq.l	#-1,d0
1$:		addq.l	#1,d0
		tst.b	(a6)+
		bne.s	1$

		move.l	d0,d7
		subq.l	#1,d7
2$:
		mulu.w	#13,d0                  ; Hash *= 13
		moveq	#0,d1
		move.b	(a1)+,d1		; Nächstes Zeichen
		cmpi.w	#'a',d1
		blo.s	3$
		cmpi.w	#'z',d1
		bhi.s	3$
		andi.b	#$df,d1			; toupper
3$:
		add.l	d1,d0                   ; Hash := chr$(char)
		andi.l	#$7ff,d0		; Hash &= $7FF
		dbf	d7,2$

                divu	#72,d0			; Hash %= 72
		swap	d0
                ext.l	d0
		addq.l	#6,d0			; Hash += 6
		lsl.l	#2,d0			; Hash *= 4, clear Z bit
99$:		rts

.Error:        	moveq	#0,d0			; Hash := 0, set Z bit
		bra	99$

***************************************************************************

ReadDir:        lea     Buffer,a0
		move.l	RAMDiskSize,d6
		lsr.l	#5,d6			; / 512 / 2 gibt Mitte
		lsr.l	#5,d6
		bsr	ReadOneBlock
		rts

***************************************************************************

ReadOneBlock:	move.l	#512,d7			; Länge eines Blocks
ReadBlocks:	lsl.l	#8,d6			; Blocknr. *512 = Offset
		lsl.l	#1,d6
		movem.l	d0/a0-a1,-(SP)
		move.l	a0,a1			; Destination
		movea.l	d6,a0			; Offset
		add.l	RAMDiskBase,a0
		move.l	d7,d0			; Länge
		jsr	CopyMem
		movem.l	(SP)+,d0/a0-a1
		rts

***************************************************************************

		SECTION	bss,BSS

Buffer:		ds.b	512

	ENDC
		END
