COPPER_S:

		XDEF	BlackCopper
		XDEF	CopperList,CopperSprites,SetPointers
		XDEF	CopperColor,CopperColor2
		XDEF	BitMapPtrs,c_bplcon1
		XDEF	PanelColors,PanelPtrs
		XDEF	CopyColorMap,SetColors
		XDEF	cpr_Cloud1bpl,cpr_Cloud1bpt
		XDEF	cpr_Cloud2bpl,cpr_Cloud2bpt
		XDEF	cpr_Cloud3bpl,cpr_Cloud3bpt
		XDEF	FadeOutCopper,FadeInCopper
		XDEF	Level1ColorMap,Level2ColorMap,Level3ColorMap
		XDEF	Level4ColorMap,Level5ColorMap
		XDEF	FadeOutCopp,FadeInCopp

		XREF	RasterDelay

		INCLUDE	"MyExec.i"
		INCLUDE	"copper.i"
		INCLUDE	"relcustom.i"
		INCLUDE	"definitions.i"

Modulo:		EQU	ScrWidth-42

		SECTION	Program,CODE



*****************************************************************************
* a0 = colormap
CopyColorMap:	lea	ColorTab,a1		* ColorMap
1$:		move.w	(A0)+,d0		* Color
		cmp.w	#-1,d0			* End
		beq.s	2$			* yes -->
		move.w	d0,(A1)+		* set color
		bra.s	1$			* loop -->
2$:		rts

*****************************************************************************

SetColors:	movem.l	d0/a0-a1,-(sp)
		bra.s	2$
1$:		move.w	(A0)+,(A1)+
2$:		dbf	d0,1$
		movem.l	(sp)+,d0/a0-a1
		rts

*****************************************************************************

SetPointers:	; A0=Picture  A1=Copper  D0=PlaneSize D1=NumPlanes
		movem.l	d0-d2/a0-a1,-(sp)
		move.w	d1,d2
1$:		move.l	a0,d1
		move.w	d1,6(A1)
		swap	d1
		move.w	d1,2(A1)
		add.l	d0,a0
		addq	#8,a1
		dbf	d2,1$
		movem.l	(sp)+,d0-d2/a0-a1
		rts

*****************************************************************************

FadeOutCopper:	movem.l	d0-d7/a0-a6,-(sp)
		lea	FadeOutCopp(pc),a1
		bra.s	FadeIt

*****************************************************************************

FadeInCopper:	movem.l	d0-d7/a0-a6,-(sp)
		lea	FadeInCopp(pc),a1

FadeIt:		moveq	#16,d1
.FadeOut:	moveq	#30,d0				* Speed
		lsl.l	#2,d0				* = 120 RasterLines
		bsr	RasterDelay			* Delay()

		jsr	(A1)
		dbf	d1,.FadeOut

		movem.l	(sp)+,d0-d7/a0-a6
		rts

*****************************************************************************

FadeOutCopp:	movem.l	d0-d7/a0-a6,-(SP)
		lea	CopperList,a2

.Loop:		move.w	(A2)+,d0
		cmp.w	#$FFFF,d0
		beq.s	.Ende

		btst	#0,d0
		bne.s	.NoCMove

		cmp.w	#$180,d0
		blt.s	.NoColor
		cmp.w	#$180+64,d0
		bgt.s	.NoColor

		moveq.l	#0,d1			; ZielRegister
		move.w	(a2),d2			; SourceFarbe
		moveq.l	#0,d3			; ZielFarbe

		bsr	FadeSub

		move.w	d1,(A2)+
		bra.s	.Loop

.NoColor:
.NoCMove:	addq.l	#2,a2
		bra.s	.Loop

.Ende:		movem.l	(sp)+,d0-d7/a0-a6
		rts


*****************************************************************************

FadeInCopp:	movem.l	d0-d7/a0-a6,-(SP)
		lea	CopperList,a2
		lea	ColorTab,a3

.Loop:		move.w	(A2)+,d0
		cmp.w	#$FFFF,d0
		beq.s	.Ende

		btst	#0,d0
		bne.s	.NoCMove

		cmp.w	#$180,d0
		blt.s	.NoColor
		cmp.w	#$180+64,d0
		bgt.s	.NoColor

		moveq.l	#0,d1			; ZielRegister
		move.w	(a2),d2			; SourceFarbe
		move.w	(a3)+,d3		; ZielFarbe

		bsr	FadeSub

		move.w	d1,(A2)+
		bra.s	.Loop

.NoColor:
.NoCMove:	addq.l	#2,a2
		bra.s	.Loop

.Ende:		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************

FadeSub:	moveq.l	#3-1,d4			; je 3 Nibbles

.FadeLoop:	move.w	d2,d5
		move.w	d3,d6
		and.w	#$F,d5			; SourceNibble
		and.w	#$F,d6			; DestNibble
		bsr.s	NibbleFade
		ror.w	#4,d5
		or.w	d5,d1
		lsr.w	#4,d1
		lsr.w	#4,d2
		lsr.w	#4,d3
		dbf	d4,.FadeLoop
		rts

NibbleFade:	cmp.b	d5,d6
		beq.s	2$
		bhi.s	1$
		subq.b	#1,d5
		bra.s	2$
1$:		addq.b	#1,d5
2$:		rts

****************************************************************************

Level1ColorMap:	dc.w	$000,$F80,$E60,$FA0,$FCB,$FDD,$FFF,$B7D ; Wolken

		dc.w	$B55,$8A0,$680,$460,$FD0,$FA0,$F70,$006
		dc.w	$006,$FA9,$D75,$B53,$931,$800,$C00,$F20
		dc.w	$FFF,$BBB,$777,$444,$111,$0BF,$08F,$06C ; Upper 24 Colors

		dc.w	$008d,$008c,$008d,$008e,$008d,$008e,$008f,$008e
		dc.w	$008f,$038f,$008f,$038f,$048f,$038f,$048f

		dc.w	$000,$FDC,$C98,$A76,$865,$543,$D77,$C66 ; Lower 8 Colors

		dc.w	$058f,$048f,$058f,$068f,$058f,$068f,$078f,$068f
		dc.w	$078f,$088f,$078f,$088f,$098f,$088f,$098f,$0a8f
		dc.w	$098f,$0a8f,$0b8f,$0a8f,$0b8f,$0b8e,$0b8f,$0b8e
		dc.w	$0b8d,$0b8e,$0b8d,$0b8c,$0b8d,$0b8c,$0b8b,$0b8c
		dc.w	$0b8b,$0b8a,$0b8b,$0b8a,$0b89,$0b8a,$0b89,$0b88
		dc.w	$0b89,$0b88,$0b87,$0b88,$0b87,$0b86,$0b87,$0b86
		dc.w	$0b85,$0b86,$0b85,$0c84,$0b85,$0c84,$0d83,$0c84
		dc.w	$0d83,$0e83,$0d83,$0e83,$0f84,$0e83,$0f84,$0f86
		dc.w	$0f84,$0f86,$0f87,$0f86,$0f87,$0f88,$0f87,$0f88
		dc.w	$0000

		dc.w	-1


Level2ColorMap:	dc.w	$000,$F79,$F48,$F9C,$FAE,$FCF,$FEF,$B7D ; Wolken

		dc.w	$B55,$8A0,$680,$460,$FD0,$FA0,$F70,$006
		dc.w	$000,$FA9,$D75,$B53,$931,$800,$C00,$F20
		dc.w	$FFF,$BBB,$777,$444,$111,$0BF,$08F,$06C ; Upper 24 Colors

		dc.w	$0F65,$0E65,$0F65,$0F66,$0F65,$0F66,$0F78,$0F66
		dc.w	$0F78,$0F79,$0F78,$0F79,$0F7A,$0F79,$0F7A

		dc.w	$000,$FDC,$C98,$A76,$865,$543,$D77,$C66 ; Lower 8 Colors

		dc.w	$0F7B,$0F7A,$0F7B,$0F7C,$0F7B,$0F7C,$0F7D,$0F7C
		dc.w	$0F7D,$0F7E,$0F7D,$0F7E,$0F7F,$0F7E,$0F7F,$0E8E
		dc.w	$0F7F,$0E8E,$0D8E,$0E8E,$0D8E,$0C8E,$0D8E,$0C8E
		dc.w	$0B8E,$0C8E,$0B8E,$0A8E,$0B8E,$0A8E,$098E,$0A8E
		dc.w	$098E,$088E,$098E,$088E,$078E,$088E,$078E,$068E
		dc.w	$078E,$068E,$058E,$068E,$058E,$048E,$058E,$048E
		dc.w	$038E,$048E,$038E,$067F,$038E,$067F,$077F,$067F
		dc.w	$077F,$087F,$077F,$087F,$097F,$087F,$097F,$0A7F
		dc.w	$097F,$0A7F,$0B7F,$0A7F,$0B7F,$0C7F,$0B7F,$0C7F
		dc.w	$0000

		dc.w	-1

Level3ColorMap:	dc.w	$000,$F79,$F48,$F9C,$FAE,$FCF,$FEF,$B7D ; Wolken

		dc.w	$B55,$8A0,$680,$460,$FD0,$FA0,$F70,$006
		dc.w	$000,$FA9,$D75,$B53,$931,$800,$C00,$F20
		dc.w	$FFF,$BBB,$777,$444,$111,$0BF,$08F,$06C ; Upper 24 Colors

		dc.w	$008d,$008c,$008d,$008e,$008d,$008e,$008f,$008e
		dc.w	$008f,$038f,$008f,$038f,$048f,$038f,$048f

		dc.w	$000,$FDC,$C98,$A76,$865,$543,$D77,$C66 ; Lower 8 Colors

		dc.w	$058f,$048f,$058f,$068f,$058f,$068f,$078f,$068f
		dc.w	$078f,$088f,$078f,$088f,$098f,$088f,$098f,$0a8f
		dc.w	$098f,$0a8f,$0b8f,$0a8f,$0b8f,$0b8e,$0b8f,$0b8e
		dc.w	$0b8d,$0b8e,$0b8d,$0b8c,$0b8d,$0b8c,$0b8b,$0b8c
		dc.w	$0b8b,$0b8a,$0b8b,$0b8a,$0b89,$0b8a,$0b89,$0b88
		dc.w	$0b89,$0b88,$0b87,$0b88,$0b87,$0b86,$0b87,$0b86
		dc.w	$0b85,$0b86,$0b85,$0c84,$0b85,$0c84,$0d83,$0c84
		dc.w	$0d83,$0e83,$0d83,$0e83,$0f84,$0e83,$0f84,$0f86
		dc.w	$0f84,$0f86,$0f87,$0f86,$0f87,$0f88,$0f87,$0f88
		dc.w	$0000

		dc.w	-1

Level4ColorMap:
		dc.w	$000,$FFF,$FE0,$EC0,$999,$DDD,$BBB,$976 ; Wolken

		dc.w	$B55,$8A0,$680,$460,$FD0,$FA0,$F70,$006
		dc.w	$b7d,$FA9,$D75,$B53,$931,$800,$C00,$F20
		dc.w	$FFF,$BBB,$777,$444,$111,$0BF,$08F,$06C ; Upper 24 Colors

		dc.w	$976,$976,$976,$976,$976,$976,$976,$976
		dc.w	$976,$976,$976,$976,$976,$976,$976

		dc.w	$000,$FDC,$C98,$A76,$865,$543,$D77,$C66 ; Lower 8 Colors

		dc.w	$0F7B,$0F7A,$0F7B,$0F7C,$0F7B,$0F7C,$0F7D,$0F7C
		dc.w	$0F7D,$0F7E,$0F7D,$0F7E,$0F7F,$0F7E,$0F7F,$0E8E
		dc.w	$0F7F,$0E8E,$0D8E,$0E8E,$0D8E,$0C8E,$0D8E,$0C8E
		dc.w	$0B8E,$0C8E,$0B8E,$0A8E,$0B8E,$0A8E,$098E,$0A8E
		dc.w	$098E,$088E,$098E,$088E,$078E,$088E,$078E,$068E
		dc.w	$078E,$068E,$058E,$068E,$058E,$048E,$058E,$048E
		dc.w	$038E,$048E,$038E,$067F,$038E,$067F,$077F,$067F
		dc.w	$077F,$087F,$077F,$087F,$097F,$087F,$097F,$0A7F
		dc.w	$097F,$0A7F,$0B7F,$0A7F,$0B7F,$0C7F,$0B7F,$0C7F
		dc.w	$0000

		dc.w	-1

Level5ColorMap:	dc.w	$000,$FDC,$C98,$A76,$865,$543,$432,$321

		dc.w	$B55,$8A0,$680,$460,$FD0,$FA0,$F70,$006
		dc.w	$b7d,$FA9,$D75,$B53,$931,$800,$C00,$F20
		dc.w	$FFF,$BBB,$777,$444,$111,$0BF,$08F,$06C ; Upper 24 Colors

		dc.w	$0321,$0321,$0321,$0321,$0321,$0321,$0321,$0321
		dc.w	$0321,$0321,$0321,$0321,$0321,$0321,$0321

		dc.w	$000,$FDC,$C98,$A76,$865,$543,$D77,$C66 ; Lower 8 Colors

		dc.w	$0420,$0410,$0420,$0320,$0420,$0320,$0220,$0320
		dc.w	$0220,$0122,$0220,$0122,$0022,$0122,$0022,$0023
		dc.w	$0022,$0023,$0024,$0023,$0024,$0025,$0024,$0025
		dc.w	$0026,$0025,$0026,$0027,$0026,$0027,$0027,$0027

		dc.w	$0027,$0027,$0027,$0027,$0027,$0027,$0027,$0027
		dc.w	$0027

		dc.w	$0027,$0027,$0027,$0027,$0027,$0027,$0027,$0126
		dc.w	$0027,$0126,$0125,$0126,$0125,$0124,$0125,$0124
		dc.w	$0123,$0124,$0123,$0122,$0123,$0122,$0121,$0122
		dc.w	$0121,$0025,$0121,$0025,$0027,$0025,$0027,$0000

		dc.w	-1

****************************************************************************

		SECTION	__MERGED,DATA

CopperList:	ccwait	$0221,$fffe

		cmove	$0200,bplcon0

CopperSprites:	cmovel	$0000,sprpt+00
		cmovel	$0000,sprpt+04
		cmovel	$0000,sprpt+08
		cmovel	$0000,sprpt+12
		cmovel	$0000,sprpt+16
		cmovel	$0000,sprpt+20
		cmovel	$0000,sprpt+24
		cmovel	$0000,sprpt+28

		cmove	$0581,diwstrt
		cmove	$2CC1,diwstop
		cmove	$0038-8,ddfstrt
		cmove	$00D0,ddfstop

CloudColor:	cmove	$0000,color+00
		cmove	$0000,color+02
		cmove	$0000,color+04
		cmove	$0000,color+06
		cmove	$0000,color+08
		cmove	$0000,color+10
		cmove	$0000,color+12
		cmove	$0000,color+14

		cmove	$0000,color+16
		cmove	$0000,color+18
		cmove	$0000,color+20
		cmove	$0000,color+22
		cmove	$0000,color+24
		cmove	$0000,color+26
		cmove	$0000,color+28
		cmove	$0000,color+30

		cmove	$0000,color+34
		cmove	$0000,color+34
		cmove	$0000,color+36
		cmove	$0000,color+38
		cmove	$0000,color+40
		cmove	$0000,color+42
		cmove	$0000,color+44
		cmove	$0000,color+46
		cmove	$0000,color+48
		cmove	$0000,color+50
		cmove	$0000,color+52
		cmove	$0000,color+54
		cmove	$0000,color+56
		cmove	$0000,color+58
		cmove	$0000,color+60
		cmove	$0000,color+62

		ccwait	$2921,$FFFE

cpr_Cloud1bpl:	cmove	$0000,bplcon1
		cmove	$0024,bplcon2
		cmove	38,bpl1mod
		cmove	38,bpl2mod
cpr_Cloud1bpt:	cmovel	$0000,bpl1pt				* Pointers to BitMap
		cmovel	$0000,bpl2pt
		cmovel	$0000,bpl3pt

		ccwait	$2421,$FFFE
		cmove	$0000,color+14
		ccwait	$2521,$FFFE
		cmove	$0000,color+14
		ccwait	$2621,$FFFE
		cmove	$0000,color+14

		ccwait	$2B01,$FFFE
		cmove	$3200,bplcon0				* WOLKE 1

		ccwait	$2C21,$FFFE
		cmove	$0000,color+14
		ccwait	$2D21,$FFFE
		cmove	$0000,color+14
		ccwait	$2E21,$FFFE
		cmove	$0000,color+14

		ccwait	$3421,$FFFE
		cmove	$0000,color+14
		ccwait	$3521,$FFFE
		cmove	$0000,color+14
		ccwait	$3621,$FFFE
		cmove	$0000,color+14

		ccwait	$3B01,$FFFE
cpr_Cloud2bpl:	cmove	$0000,bplcon1
cpr_Cloud2bpt:	cmovel	$0000,bpl1pt				* Pointers to BitMap
		cmovel	$0000,bpl2pt
		cmovel	$0000,bpl3pt

		ccwait	$3C21,$FFFE
		cmove	$0000,color+14
		ccwait	$3D21,$FFFE
		cmove	$0000,color+14
		ccwait	$3E21,$FFFE
		cmove	$0000,color+14

		ccwait	$4401,$FFFE
cpr_Cloud3bpl:	cmove	$0000,bplcon1
cpr_Cloud3bpt:	cmovel	$0000,bpl1pt				* Pointers to BitMap
		cmovel	$0000,bpl2pt
		cmovel	$0000,bpl3pt

		cmove	$0000,color+14
		ccwait	$4521,$FFFE
		cmove	$0000,color+14
		ccwait	$4621,$FFFE
		cmove	$0000,color+32

;		ccwait	$4A01,$FFFE
		ccwait	$49D7,$FFFE

BitMapPtrs:	cmovel	$0000,bpl1pt				* Pointers to BitMap
		cmovel	$0000,bpl2pt
		cmovel	$0000,bpl3pt
		cmovel	$0000,bpl4pt
		cmovel	$0000,bpl5pt

		cmove	$5200,bplcon0

c_bplcon1:	cmove	$0000,bplcon1
		cmove	Modulo,bpl1mod
		cmove	Modulo,bpl2mod

		cmove	$0000,color+00				* ColorMap
		cmove	$0000,color+02
		cmove	$0000,color+04
		cmove	$0000,color+06
		cmove	$0000,color+08
		cmove	$0000,color+10
		cmove	$0000,color+12
		cmove	$0000,color+14

;		ccwait	$4B01,$FFFE
;		cmove	$5200,bplcon0

		ccwait	$4C21,$FFFE
		cmove	$0000,color+32
		ccwait	$4D21,$FFFE
		cmove	$0000,color+32
		ccwait	$4E21,$FFFE
		cmove	$0000,color+32

		ccwait	$5421,$FFFE
		cmove	$0000,color+32
		ccwait	$5521,$FFFE
		cmove	$0000,color+32
		ccwait	$5621,$FFFE
		cmove	$0000,color+32

		ccwait	$5C21,$FFFE
		cmove	$0000,color+32
		ccwait	$5D21,$FFFE
		cmove	$0000,color+32
		ccwait	$5E21,$FFFE
		cmove	$0000,color+32

		ccwait	$6421,$FFFE
		cmove	$0000,color+32
		ccwait	$6521,$FFFE
		cmove	$0000,color+32
		ccwait	$6621,$FFFE
		cmove	$0000,color+32

		ccwait	$6C21,$FFFE
		cmove	$0000,color+32
		ccwait	$6D21,$FFFE
		cmove	$0000,color+32
		ccwait	$6E21,$FFFE
		cmove	$0000,color+32

		ccwait	$7421,$FFFE
		cmove	$0000,color+32
		ccwait	$7521,$FFFE
		cmove	$0000,color+32
		ccwait	$7621,$FFFE
		cmove	$0000,color+32

		ccwait	$7C21,$FFFE
		cmove	$0000,color+32
		ccwait	$7D21,$FFFE
		cmove	$0000,color+32
		ccwait	$7E21,$FFFE
		cmove	$0000,color+32

		ccwait	$8421,$FFFE
		cmove	$0000,color+32
		ccwait	$8521,$FFFE
		cmove	$0000,color+32
		ccwait	$8621,$FFFE
		cmove	$0000,color+32

		ccwait	$8C21,$FFFE
		cmove	$0000,color+32
		ccwait	$8D21,$FFFE
		cmove	$0000,color+32
		ccwait	$8E21,$FFFE
		cmove	$0000,color+32

		ccwait	$9421,$FFFE
		cmove	$0000,color+32
		ccwait	$9521,$FFFE
		cmove	$0000,color+32
		ccwait	$9621,$FFFE
		cmove	$0000,color+32

		ccwait	$9C21,$FFFE
		cmove	$0000,color+32
		ccwait	$9D21,$FFFE
		cmove	$0000,color+32
		ccwait	$9E21,$FFFE
		cmove	$0000,color+32

		ccwait	$A421,$FFFE
		cmove	$0000,color+32
		ccwait	$A521,$FFFE
		cmove	$0000,color+32
		ccwait	$A621,$FFFE
		cmove	$0000,color+32

		ccwait	$AC21,$FFFE
		cmove	$0000,color+32
		ccwait	$AD21,$FFFE
		cmove	$0000,color+32
		ccwait	$AE21,$FFFE
		cmove	$0000,color+32

		ccwait	$B421,$FFFE
		cmove	$0000,color+32
		ccwait	$B521,$FFFE
		cmove	$0000,color+32
		ccwait	$B621,$FFFE
		cmove	$0000,color+32

		ccwait	$BC21,$FFFE
		cmove	$0000,color+32
		ccwait	$BD21,$FFFE
		cmove	$0000,color+32
		ccwait	$BE21,$FFFE
		cmove	$0000,color+32

		ccwait	$C421,$FFFE
		cmove	$0000,color+32
		ccwait	$C521,$FFFE
		cmove	$0000,color+32
		ccwait	$C621,$FFFE
		cmove	$0000,color+32

		ccwait	$CC21,$FFFE
		cmove	$0000,color+32
		ccwait	$CD21,$FFFE
		cmove	$0000,color+32
		ccwait	$CE21,$FFFE
		cmove	$0000,color+32

		ccwait	$D421,$FFFE
		cmove	$0000,color+32
		ccwait	$D521,$FFFE
		cmove	$0000,color+32
		ccwait	$D621,$FFFE
		cmove	$0000,color+32

		ccwait	$DC21,$FFFE
		cmove	$0000,color+32
		ccwait	$DD21,$FFFE
		cmove	$0000,color+32
		ccwait	$DE21,$FFFE
		cmove	$0000,color+32

		ccwait	$E421,$FFFE
		cmove	$0000,color+32
		ccwait	$E521,$FFFE
		cmove	$0000,color+32
		ccwait	$E621,$FFFE
		cmove	$0000,color+32

		ccwait	$EC21,$FFFE
		cmove	$0000,color+32
		ccwait	$ED21,$FFFE
		cmove	$0000,color+32
		ccwait	$EE21,$FFFE
		cmove	$0000,color+32

		ccwait	$F421,$FFFE
		cmove	$0000,color+32
		ccwait	$F521,$FFFE
		cmove	$0000,color+32
		ccwait	$F621,$FFFE
		cmove	$0000,color+32

		ccwait	$FC21,$FFFE
		cmove	$0000,color+32
		ccwait	$FD21,$FFFE
		cmove	$0000,color+32
		ccwait	$FE21,$FFFE
		cmove	$0000,color+32

		ccwait	$FFDF,$FFFE

		ccwait	$0421,$FFFE
		cmove	$0000,color+32
		ccwait	$0521,$FFFE
		cmove	$0000,color+32
		ccwait	$0621,$FFFE
		cmove	$0000,color+32

		ccwait	$0821,$FFFE
		cmove	$0200,bplcon0				* Bitplanes OFF
		cmove	$0020,dmacon				* Sprite DMA-Aus
		cmove	$0000,color

		cmove	$0000,$0144
		cmove	$0000,$0146
		cmove	$0000,$014c
		cmove	$0000,$014e
		cmove	$0000,$0154
		cmove	$0000,$0156
		cmove	$0000,$015c
		cmove	$0000,$015e
		cmove	$0000,$0164
		cmove	$0000,$0166
		cmove	$0000,$016c
		cmove	$0000,$016e
		cmove	$0000,$0174
		cmove	$0000,$0176
		cmove	$0000,$017c
		cmove	$0000,$017e				* Clear ALL SpriteDATA

		cmove	$0000,bplcon1
		cmove	$0024,bplcon2
		cmove	$0000,bpl1mod
		cmove	$0000,bpl2mod
		cmove	$0038,ddfstrt
		cmove	$00D0,ddfstop

		cmove	$0000,color+02		* PanelColorMap
		cmove	$0000,color+02
		cmove	$0000,color+04
		cmove	$0000,color+06
		cmove	$0000,color+08
		cmove	$0000,color+10
		cmove	$0000,color+12
		cmove	$0000,color+14
		cmove	$0000,color+16
		cmove	$0000,color+18
		cmove	$0000,color+20
		cmove	$0000,color+22
		cmove	$0000,color+24
		cmove	$0000,color+26
		cmove	$0000,color+28
		cmove	$0000,color+30
		cmove	$0000,color+32
		cmove	$0000,color+34
		cmove	$0000,color+36
		cmove	$0000,color+38
		cmove	$0000,color+40
		cmove	$0000,color+42
		cmove	$0000,color+44
		cmove	$0000,color+46
		cmove	$0000,color+48
		cmove	$0000,color+50
		cmove	$0000,color+52
		cmove	$0000,color+54
		cmove	$0000,color+56
		cmove	$0000,color+58
		cmove	$0000,color+60
		cmove	$0000,color+62

		ccwait	$0921,$FFFE
		cmove	$0000,color

PanelPtrs:	cmovel	$0000,bpl1pt				* Pointers to BitMap
		cmovel	$0000,bpl2pt
		cmovel	$0000,bpl3pt
		cmovel	$0000,bpl4pt
		cmovel	$0000,bpl5pt
		cmovel	$0000,bpl6pt

		ccwait	$0A01,$FFFE
		cmove	$6200,bplcon0

		ccwait	$1041,$FFFE
		cmove	$8010,intreq

		ccwait	$2921,$FFFE
		cmove	$0200,bplcon0
		cmove	$8020,dmacon			* Sprite DMA On
		cend

BlackCopper:	cmove	$0200,bplcon0
		cmove	$0000,color
		cend

		SECTION	MyBss,BSS

ColorTab:	ds.w	8
CopperColor2:	ds.w	31
CopperColor:	ds.w	89
PanelColors:	ds.w	32

****************************************************************************
