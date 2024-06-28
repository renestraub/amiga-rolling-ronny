
		XDEF	GetJoy,WaitJoy,CheckJoy
		XDEF	JoyStick,JoyMove,JoyMem,ButtonMove,ButtonMem
		XDEF	StickCnt,ButtonCnt

		XREF	RasterDelay,_SysBase
		
		INCLUDE "myexec.i"
		INCLUDE "relcustom.i"			* AmigaCustomChips
		INCLUDE "definitions.i"

;FREEZE
;DEMOONE

**************************************************************************

		SECTION	JoyStick,Code

GetJoy:		movem.l	d2-d6/a0-a6,-(sp)

	IFD	FREEZE
		moveq	#0,d5
		moveq	#0,d6
	ENDC

		move.w	joy1dat(A5),d2			* Normal Port 1
		tst.w	JoyStick			* Joy 2
		beq.s	7$				* No -->
	
		move.w	joy0dat(A5),d2			* Port 0 (Mouse Port)

7$:		moveq	#0,d0
		moveq	#0,d1

		btst	#9,d2
		bne.s	1$				* LINKS

		btst	#1,d2
		bne.s	2$				* RECHTS

6$:		move	d2,d3
		move	d3,d4
		lsr	#1,d3
		and	#$100,d3
		and	#$100,d4
		eor	d3,d4
		bne.s	3$				* OBEN

		move	d2,d3
		move	d3,d4
		lsr	#1,d3
		and	#1,d3
		and	#1,d4
		eor	d3,d4
		bne.s	4$				* UNTEN
		bra.s	5$

1$:		moveq	#-1,d0
	IFD	FREEZE
		moveq	#-2,d5
	ENDC
		bra.s	6$

2$:		moveq	#1,d0
	IFD	FREEZE
		moveq	#2,d5
	ENDC
		bra.s	6$

3$:		moveq	#-1,d1
	IFD	FREEZE
		moveq	#-6,d6
	ENDC
		bra.s	5$

4$:		moveq	#1,d1
	IFD	FREEZE
		moveq	#6,d6
	ENDC
5$:
	IFD	FREEZE
		SYSGET.B CheatFlag,d4
		beq.s	.NoFreeze

		addq.w	#1,StickCnt

		add.w	d6,d5
		cmp.w	LastStick,d5
		beq.s	.Same

		move.l	JoyMem(pc),a0
		move.w	StickCnt,(a0)+
		move.w	d5,(A0)+
		move.w	d5,LastStick
		move.l	a0,JoyMem

		cmp.l	#$c40000+3000,a0
		ble.s	.NoFreeze

		MSG	<"Buffer full">
.Same:
	ENDC

	IFND	FREEZE
		tst.b	DemoFlag(A6)
		beq.s	.NoFreeze

		addq.w	#1,StickCnt

		move.l	JoyMem(pc),a0

		move.w	(a0),d2
		cmp.w	#-1,d2
		beq.s	11$
		cmp.w	StickCnt,d2
		bne.s	.Ok

		move.w	2(A0),LastStick
		addq.l	#4,JoyMem

		cmp.l	#JoyMove+2900,a0
		ble.s	.Ok

11$:		move.b	#DEMO_END,EndFlag(A6)
		moveq	#0,d2

.Ok:		lea	JoyTab(pc),a0
		move.w	LastStick,d2
		move.b	(a0,d2.w),d0
		move.b	1(a0,d2.w),d1
		ext.w	d0
		ext.w	d1
		ext.l	d0
		ext.l	d1
	ENDC

.NoFreeze:	movem.l	(sp)+,d2-d6/a0-a6
		rts

****************************************************************************

WaitJoy:
.WaitJoy1:	move.l	d0,-(sp)
		SYSCALL	GetKey
		move.l	(sp)+,d0

		bsr	CheckJoy
		bne.s	.WaitJoy1			* Gedrückt nein -->

		moveq	#127,d0
		bsr	RasterDelay

.WaitJoy2:	move.l	d0,-(sp)
		SYSCALL	GetKey
		move.l	(sp)+,d0

		bsr	CheckJoy
		beq.s	.WaitJoy2			* Gedrückt ja -->

		rts


****************************************************************************

CheckJoy:
	IFD	FREEZE
		movem.l	d6-d7/a0,-(sp)
		tst.w	JoyStick
		bne.s	.MousePort

		btst	#7,$bfe001			* JoyStickPort
		bra	.Freeze

.MousePort:	btst	#6,$bfe001			* MousePort

.Freeze:	bne.s	1$
		moveq	#0,d7
		bra	2$
1$:		moveq	#1,d7

2$:		SYSGET.B CheatFlag,d6
		beq.s	3$

		addq.w	#1,ButtonCnt

		cmp.w	LastButton,d7
		beq.s	4$

		move.l	ButtonMem(pc),a0

		move.w	ButtonCnt,(A0)+
		move.w	d7,(A0)+
		move.w	d7,LastButton
		move.l	a0,ButtonMem

		cmp.l	#$c40000+4000+3000,a0
		ble.s	4$

		MSG	<"Buffer2 full">
4$:
3$:		move.w	d7,d7
		movem.l	(sp)+,d6-d7/a0
		rts
	ENDC

	IFND	FREEZE
		movem.l	d2/a0,-(sp)
		tst.b	DemoFlag(A6)
		beq.s	.NoFreeze

		btst	#6,$bfe001
		beq.s	5$
		btst	#7,$bfe001
		bne.s	6$

5$:		move.b	#DEMO_END,EndFlag(A6)
		bra.s	.NoFreeze

6$:		move.l	ButtonMem(pc),a0
		addq.w	#1,ButtonCnt

		move.w	ButtonCnt,d2
		cmp.w	(a0),d2
		bne.s	1$

		move.w	2(A0),LastButton
		addq.l	#4,ButtonMem

1$:		move.w	LastButton,d2
		tst.w	d2
		movem.l	(sp)+,d2/a0
		rts

.NoFreeze:	movem.l	(sp)+,d2/a0
		tst.w	JoyStick
		bne.s	.MousePort

		btst	#7,$bfe001			* JoyStickPort
		rts

.MousePort:	btst	#6,$bfe001			* MousePort
		rts
	ENDC

**************************************************************************

JoyStick:	dc.w	0				* JoyStick to use

StickCnt:	dc.w	0				* 0 = JoyPort
ButtonCnt:	dc.w	0

LastStick:	dc.w	-1
LastButton:	dc.w	-1
							* 1 = MousePort
JoyMem:		dc.l	$c40000
ButtonMem:	dc.l	$c40000+4000

;			X , Y
		dc.b	-1,-1
		dc.b	 0,-1
		dc.b	 1,-1
		dc.b	-1, 0
JoyTab:		dc.b	 0, 0
		dc.b	 1, 0
		dc.b	-1, 1
		dc.b	 0, 1
		dc.b	 1, 1
		
		CNOP	0,2

	IFD	DEMOONE
JoyMove:	INCLUDE	"sjoymove.i"
ButtonMove:	INCLUDE	"sbuttonmove.i"
	ELSEIF
JoyMove:	INCLUDE	"joymove.i"
ButtonMove:	INCLUDE	"buttonmove.i"
	ENDC
