
		XDEF	PlaySound,WaitLines,PlaySound2
		XDEF	EmptySample

		SECTION	text,CODE

		INCLUDE "relcustom.i"

;a0-sound
PlaySound2:	move.w	d0,-(SP)
		move.w	10(a0),d0
		bsr	PlaySound
		move.w	(Sp)+,d0
		rts

	
;a0-sound/d0=channel
PlaySound:
		movem.l	d0-d7/a0-a6,-(SP)
		lea	custom,a5
		lea	aud(A5),a4
		moveq	#0,d1
		bset	d0,d1				;maske fuer dmacon bilden
		mulu	#$10,d0
		add.w	d0,a4
		move	d1,dmacon(A5)			;dma sperren
		move.l	0(a0),audlc(a4)
		move.w	4(A0),d0
		and	#$7fff,d0
		move.w	d0,audlen(A4)
		move	6(A0),audvol(A4)
		move	8(a0),audper(A4)
		bsr	SoundDelay
		or	#$8000,d1
		move	d1,dmacon(A5)			;dma zulassen
		bsr	SoundDelay
		btst	#7,4(A0)			;LoopBit gesetzt ?
		bne	1$				;ja ->
		clr.l	EmptySample
		move.l	#EmptySample,audlc(a4)
		move.w	#1,audlen(A4)
1$:		movem.l	(SP)+,d0-d7/a0-a6

		rts


SoundDelay:
		moveq	#5,d0
WaitLines:
		movem.l	d0-d3,-(SP)
		move.l	d0,d1
WaitLinesLoop:
		bsr	GetLine
		move	d0,d2
	
l1:		bsr	GetLine
		cmp	d0,d2
		beq	l1
		dbf	d1,WaitLinesLoop
		movem.l	(SP)+,d0-d3
		rts
	
	
GetLine:	move.l	$dff004,d0
		and.l	#$1ffff,d0
		lsr.l	#8,d0
		tst.w	d0
		beq	GetLine
		rts

		SECTION	chipbss,BSS_C

EmptySample:	ds.l	1

