
; Routines for playing back the Virgin Logo Animation with sound effects

; All coding by Dave Chapman
; Graphics by Carl Cropley
; Sound effects by Shahid Ahmad

PAL		equ	1			; 1=PAL, 0=NTSC


		section	c,code_c		; All in chip ram!


		bra	Virgin

custom		equ	$dff000			; Start of chip addresses

		include	virgin.i

planesize	equ	40*200			; 40 bytes wide, 200 down
screensize	equ	planesize*5		; 5 bitplanes (32 colours)


; Order of these: left,top,right,bottom

startsquare	dc.w	65,0,254,197		; Start full screen size
endsquare	dc.w	99,34,220,163		; First frame of anim
movesquare	dc.w	0,0,0,0			; Work area

Virgin
	;	lea	dosname(pc),a1		; "dos.library"
	;	moveq	#0,d0
	;	movea.l	(4).w,a6
	;	jsr	-$228(a6)		; OpenLibrary
	;	movea.l	d0,a6			; Library base
	;	move.l	#250,d1			; Wait 5 seconds
	;	jsr	-$c6(a6)		; Delay
	;	lea	super(pc),a5		; Routine to call
	;	movea.l	(4).w,a6		; in supervisor mode
	;	jsr	-30(a6)			; Do it!
;super		
;		move.w	#$2700,sr

		move.l	a7,StackPtr		; Save Stack

		lea	stack(pc),a7
		lea	custom,a5		; Custom chips
		lea	variables(pc),a6	; Vars area

	;	move.w	#$7fff,dmacon(a5)	; No DMA
	;	move.w	#$7fff,intena(a5)	; No interrupts
	;	move.w	#$7fff,intreq(a5)	; No interrupt requests
	;	move.w	#$2000,sr

		clr.l	nextscreen(a6)		; So VBL won't use it

		lea	animfile(pc),a0
		adda.l	#initsound,a0
		jsr	(a0)

		move.l	$6c.w,oldvblank(a6)	; Save current vbl routine
		lea	vblankhandler(pc),a0
		move.l	a0,$6c.w		; Set my routine
		move.w	#$c020,intena(a5)	; Enable vblanks
		move.w	#$0020,intreq(a5)	; And clear any old request

		move.l	counter(a6),d0		; Wait for VBL
firstwait	cmp.l	counter(a6),d0		; before changing all the
		beq.s	firstwait		; display registers

		move.w	#$0180,dmacon(a5)	; No copper/bitplane DMA
		move.w	#$5200,bplcon0(a5)	; 5 bit planes, composite colour on
		moveq	#0,d0
		move.w	d0,bplcon1(a5)		; No horizontal scroll
		move.w	d0,bplcon2(a5)		; No priorities
		move.w	d0,bpl1mod(a5)		; Modulo 0 odd planes
		move.w	d0,bpl2mod(a5)		; Modulo 0 even planes
		move.w	#$0038,ddfstrt(a5)	; Start for 320 screen
		move.w	#$00D0,ddfstop(a5)	; End for 320 screen

		ifne	PAL
		move.w	#$4881,diwstrt(a5)	; Position screen top left
		move.w	#$10C1,diwstop(a5)	; Position screen bottom right
		elseif
		move.w	#$2C81,diwstrt(a5)	; Position screen top left
		move.w	#$F4C1,diwstop(a5)	; Position screen bottom right
		endc



		lea	sprlist+2,a1
		lea	EmptySpr,a0
		bsr	SetLong
		bsr	SetLong
		bsr	SetLong
		bsr	SetLong
		bsr	SetLong
		bsr	SetLong
		bsr	SetLong
		bsr	SetLong


		lea	planelist1+2,a1
		lea	screen1,a0
		moveq	#5-1,d1
1$:		bsr	SetLong
		add.l	#planesize,a0
		dbf	d1,1$

		lea	planelist2+2,a1
		lea	screen2,a0
		moveq	#5-1,d1
2$:		bsr	SetLong
		add.l	#planesize,a0
		dbf	d1,2$
		


		movem.l	planelist1(pc),d0-d7/a1-a2
		lea	bitplanelist,a0

		movem.l	d0-d7/a1-a2,(a0)	; Set screen1 bitplanes
		move.l	#screen1,physicalscreen(a6) ; The one displayed
		move.l	#screen2,logicalscreen(a6) ; The one not being displayed




		lea	copperlist,a0
		move.l	a0,cop1lc(a5)		; Set Copper list address
		move.w	d0,copjmp1(a5)		; Set it going
		move.w	#$8380,dmacon(a5)	; Bitplane & copper DMA ON!

rerun		lea	animfile(pc),a1		; Start of file
		move.l	4(a1),d0		; FORM length
		lea	8(a1,d0.l),a0
		move.l	a0,finish(a6)		; End of file

		cmpi.l	#"ANIM",8(a1)
		bne	finished		; Exit if not ANIM
		lea	12(a1),a1
		cmpi.l	#"ILBM",8(a1)
		bne	finished		; Exit if not ILBM
		lea	12(a1),a1
		moveq	#0,d7			; Flags which chunks found

mainloop.10	cmpi.l	#"BMHD",(a1)
		bne.s	mainloop.20		; If not bitmapheader
		move.w	8(a1),bm_width(a6)	; Store width
		move.w	10(a1),bm_height(a6)	; Store height
		move.b	16(a1),bm_planes(a6)	; Store number of planes
		move.b	18(a1),bm_compression(a6) ; Store compression mode
		cmpi.w	#320,bm_width(a6)
		bne	finished		; Exit if not 320 wide
		cmpi.b	#5,bm_planes(a6)
		bhi	finished		; Exit if > 5 bitplanes
		bset	#0,d7			; Got bitmapheader!
		bra	mainloop.next		; Get next chunk

mainloop.20	cmpi.l	#"CMAP",(a1)
		bne.s	mainloop.30		; If not colourmap
		lea	palette(a6),a0		; Where to store palette
		lea	8(a1),a2		; Skip to CMAP data
		move.l	4(a1),d2		; Get CMAP length
		moveq	#0,d3			; Count colours
mainloop.25	cmpi.b	#32,d3			; Got 32 colours?
		beq.s	mainloop.26		; Yes, skip any extras
		move.b	(a2)+,d0		; Get R component
		andi.w	#$f0,d0
		lsl.w	#4,d0
		move.w	d0,d1
		move.b	(a2)+,d0		; Get G component
		andi.w	#$f0,d0
		or.w	d0,d1
		move.b	(a2)+,d0		; Get B component
		andi.w	#$f0,d0
		lsr.w	#4,d0
		or.w	d0,d1
		move.w	d1,(a0)+		; Store RGB value
		addq.b	#1,d3			; Got one more colour!
mainloop.26	subq.l	#3,d2			; 3 off CMAP length
		bne.s	mainloop.25		; Until done all
		bra	mainloop.next		; Get next chunk

mainloop.30	cmpi.l	#"BODY",(a1)
		beq.s	mainloop.40		; If found screen data

mainloop.next	move.l	4(a1),d0		; Get chunk length
		addq.l	#1,d0			; Round up to even number
		bclr	#0,d0
		lea	8(a1,d0.l),a1		; Skip over it
		cmpa.l	finish(a6),a1		; End of file yet?
		bcs	mainloop.10		; Nope
		bra	finished		; Yes, so exit

mainloop.40	btst	#0,d7			; Was BMHD before here?
		beq	finished		; Nope, exit

		move.l	a1,-(a7)		; Save ptr
		bsr	square			; Do shrinking square
		movea.l	(a7),a1			; Restore ptr
		lea	8(a1),a1		; Point to BODY data
		bsr	UNPACK			; Unpack the 1st screen
		bsr	swapscreen		; Flip display
		bsr	phystolog		; Duplicate 1st screen
		movea.l	(a7)+,a1
		move.l	4(a1),d0		; Get chunk length
		addq.l	#1,d0			; Round up to even number
		bclr	#0,d0
		lea	8(a1,d0.l),a1		; Skip over it
		clr.w	controloffset(a6)	; Start at first frame

mainloop.50	bsr	swapscreen		; Flip screens
		cmpa.l	finish(a6),a1		; Finished anim?
		beq	finishedok		; Yes

		cmpi.l	#"FORM",(a1)		; Must be in this order!!!
		bne	finished
		cmpi.l	#"ILBM",8(a1)
		bne	finished
		cmpi.l	#"ANHD",12(a1)
		bne	finished

		lea	12(a1),a1		; Point to ANHD data
		cmpi.b	#5,8(a1)		; Make sure type 5
		bne	finished		; Exit if not
		move.w	10(a1),d0		; Get animation width
		cmp.w	bm_width(a6),d0		; Compare to screen width
		bne	finished		; Exit if different
		move.w	12(a1),d0		; Get animation height
		cmp.w	bm_height(a6),d0	; Compare to screen height
		bne	finished		; Exit if different
		move.l	4(a1),d0		; Get ANHD length
		addq.l	#1,d0			; Round up to even number
		bclr	#0,d0
		lea	8(a1,d0.l),a1		; Skip over it
		cmpi.l	#"DLTA",(a1)+		; Must be next!!
		bne	finished		; Exit if not
		move.l	(a1)+,d7		; Get delta length
		movea.l	logicalscreen(a6),a2	; Start of screen memory
		moveq	#5-1,d6			; Do 5 planes
		movea.l	a1,a4			; Copy delta address
mainloop.60	move.l	(a4)+,d0		; Get offset to delta data
		beq	nostuffhere		; No data for this plane
		lea	0(a1,d0.l),a0		; Point to delta data
		moveq	#40,d2			; Do 40 columns wide
		movem.l	a1-a2,-(a7)		; Save registers

; Here starts Jim Kents decoding routine

		move.w	d2,d4			; Number of columns wide
		bra	zdcp			; Do loop

dcp		movea.l	a2,a1			; A1 is screen address
		moveq	#0,d0
		move.b	(a0)+,d0		; Get number of opcodes
		bra	zdcvclp			; Do loop

dcvclp		moveq	#0,d1
		move.b	(a0)+,d1		; Get opcode
		bmi.s	dcvskuniq		; If to copy a run
		beq.s	dcvsame			; If to use fill byte

skip		lsl.w	#3,d1			; D1*8
		adda.w	d1,a1			; Add D1*8
		add.w	d1,d1			; D1*16
		add.w	d1,d1			; D1*32
		adda.w	d1,a1			; Add D1*32, so adding D1*40
		dbf	d0,dcvclp		; Do next opcode
		bra	z1dcp			; When done all opcodes

dcvsame		move.b	(a0)+,d1		; Get number to fill
		move.b	(a0)+,d3		; Get fill value
		move.w	d1,d5
		asr.w	#3,d5
		andi.w	#7,d1
		add.w	d1,d1
		add.w	d1,d1
		neg.w	d1
		jmp	same_loop(pc,d1.w)

same_tower	move.b	d3,(a1)
		adda.w	d2,a1
		move.b	d3,(a1)
		adda.w	d2,a1
		move.b	d3,(a1)
		adda.w	d2,a1
		move.b	d3,(a1)
		adda.w	d2,a1
		move.b	d3,(a1)
		adda.w	d2,a1
		move.b	d3,(a1)
		adda.w	d2,a1
		move.b	d3,(a1)
		adda.w	d2,a1
		move.b	d3,(a1)
		adda.w	d2,a1
same_loop	dbf	d5,same_tower
		dbf	d0,dcvclp		; Do next opcode
		bra	z1dcp			; When done all opcodes

dcvskuniq	bclr	#7,d1			; Calc run length
		move.w	d1,d5
		asr.w	#3,d5
		andi.w	#7,d1
		add.w	d1,d1
		add.w	d1,d1
		neg.w	d1
		jmp	uniq_loop(pc,d1.w)

uniq_tower	move.b	(a0)+,(a1)
		adda.w	d2,a1
		move.b	(a0)+,(a1)
		adda.w	d2,a1
		move.b	(a0)+,(a1)
		adda.w	d2,a1
		move.b	(a0)+,(a1)
		adda.w	d2,a1
		move.b	(a0)+,(a1)
		adda.w	d2,a1
		move.b	(a0)+,(a1)
		adda.w	d2,a1
		move.b	(a0)+,(a1)
		adda.w	d2,a1
		move.b	(a0)+,(a1)
		adda.w	d2,a1
uniq_loop	dbf	d5,uniq_tower

zdcvclp		dbf	d0,dcvclp		; Do next opcode

z1dcp		addq.l	#1,a2			; Screen column+1
zdcp		dbf	d4,dcp			; Do 40 columns across

		movem.l	(a7)+,a1-a2		; Restore pointers
nostuffhere	lea	planesize(a2),a2	; Point to next bitplane
		dbf	d6,mainloop.60		; Do 5 bitplanes
		addq.l	#1,d7			; Make delta length even
		bclr	#0,d7
		lea	0(a1,d7.l),a1		; Skip over it
		move.w	controloffset(a6),d0
		lea	framecontrol(pc),a0
		move.b	0(a0,d0.w),d0
		move.b	d0,d1
		andi.b	#31,d0
		eor.b	d0,d1
		cmpi.b	#sound_whoobr,d1
		bne.s	nosfx_wh

;		lea	animfile(pc),a0
;		adda.l	#startwhoobr,a0

		lea	startwhoobr,a0

		move.w	#TRIGGER,(a0)
nosfx_wh	cmpi.b	#sound_wave,d1
		bne.s	nosfx_wa

;		lea	animfile(pc),a0
;		adda.l	#startwave,a0
		lea	startwave,a0

		move.w	#TRIGGER,(a0)
nosfx_wa	cmpi.b	#sound_bleep,d1
		bne.s	nosfx_bl

;		lea	animfile(pc),a0
;		adda.l	#startbleep,a0
		lea	startbleep,a0

		move.w	#TRIGGER,(a0)
nosfx_bl	cmpi.b	#sound_whish,d1
		bne.s	nosfx_whi
;		lea	animfile(pc),a0
;		adda.l	#startwhish,a0
		lea	startwhish,a0

		move.w	#TRIGGER,(a0)
nosfx_whi	bsr	vsyncD0			; Wait for display sync
		addq.w	#1,controloffset(a6)
		bra	mainloop.50		; And do next frame!

finishedok	moveq	#100,d0			; Wait 50 frames
finishedok0	cmp.l	counter(a6),d0
		bcc.s	finishedok0
		lea	palette(a6),a0		; Required palette
		moveq	#32-1,d0		; 32 colours in it
finishedok1	clr.w	(a0)+			; Zero them
		dbf	d0,finishedok1
		bsr	fadecolours		; Fade palette to black
		clr.l	counter(a6)
		moveq	#100,d0
finishedok2	cmp.l	counter(a6),d0
		bcc.s	finishedok2

finished	lea	animfile(pc),a0
		adda.l	#killsound,a0
		jsr	(a0)

		move.l	oldvblank(a6),$6c.w	; Restore VBL

		move.l	StackPtr,a7		; Restore Stack
		rts				; Return to calling routine





SetLong:	move.l	a0,d0
		move.w	d0,4(A1)
		swap	d0
		move.w	d0,(A1)

		lea	8(A1),a1
		rts





phystolog	movem.l	a0-a1/d0,-(a7)
		movea.l	physicalscreen(a6),a0
		movea.l	logicalscreen(a6),a1
		move.w	#screensize/16-1,d0
.l1		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		dbf	d0,.l1
		movem.l	(a7)+,a0-a1/d0
		rts

; Waits for D0 vertical blanks to happen between screen flips

vsyncD0		move.l	d1,-(a7)
vsync.05	move.l	counter(a6),d1
		cmp.l	d0,d1
		bcc.s	vsync.20		; If already >= limit
vsync.10	cmp.l	counter(a6),d1
		beq.s	vsync.10
		bra.s	vsync.05
vsync.20	clr.l	counter(a6)
		move.l	(a7)+,d1
		rts

; Sets up copper list to display required screen and bumps counter

vblankhandler	movem.l	d0-d7/a0-a6,-(a7)
		lea	variables(pc),a6
		addq.l	#1,counter(a6)		; A counter!
		tst.l	nextscreen(a6)
		beq.s	vblank.10		; No new screen
		movea.l	nextscreen(a6),a1
		movem.l	(a1),d0-d7/a2-a3	; Read copper instructions
		lea	bitplanelist,a1
		movem.l	d0-d7/a2-a3,(a1)	; Put into copper list
		lea	copperlist,a1
		move.l	a1,custom+cop1lc	; Set copper address
		move.w	d0,custom+copjmp1	; Only if VBLANK (not copper)
		clr.l	nextscreen(a6)		; Clear screen flag
vblank.10	lea	animfile(pc),a0
		adda.l	#do_sfx,a0
		jsr	(a0)
		movem.l	(a7)+,d0-d7/a0-a6
		move.w	#$0020,custom+intreq	; Reset flags
		rte				; And exit!

swapscreen	movem.l	a0/d0,-(a7)
		cmpi.l	#screen1,logicalscreen(a6)
		bne.s	swapscreen.10		; If not to show screen 1

		move.l	#screen2,logicalscreen(a6)
		move.l	#screen1,physicalscreen(a6)
		lea	planelist1(pc),a0
		move.l	a0,nextscreen(a6)
		bra.s	swapscreen.20

swapscreen.10	move.l	#screen1,logicalscreen(a6)
		move.l	#screen2,physicalscreen(a6)
		lea	planelist2(pc),a0
		move.l	a0,nextscreen(a6)

swapscreen.20	move.l	counter(a6),d0
swapscreen.30	cmp.l	counter(a6),d0
		beq.s	swapscreen.30
		movem.l	(a7)+,a0/d0
		rts

clearscreen	movea.l	logicalscreen(a6),a0
		move.w	#screensize/16-1,d0
clearscreen_1	clr.l	(a0)+
		clr.l	(a0)+
		clr.l	(a0)+
		clr.l	(a0)+
		dbf	d0,clearscreen_1
		rts

fadecolsub	movem.l	d1-d6/a0-a1,-(a7)
fadecolsub0	moveq	#0,d6			; Flag, no changes made yet
fadecolsub1	move.w	#$F00,d2		; Start with R component
		move.w	#$100,d3		; Alter by 1 each time
		moveq	#3-1,d4			; Do 3 loops
fadecolsub2	lea	palette(a6),a0		; Required settings
		lea	palettelist,a1		; Copper settings
		moveq	#32-1,d5		; Do 32 colours
fadecolsub3	move.w	2(a1),d0		; Get copper setting
		and.w	d2,d0			; Mask component
		move.w	(a0)+,d1		; Get required setting
		and.w	d2,d1			; Mask component
		cmp.w	d0,d1			; Are they the same?
		beq.s	fadecolsub6		; Yes, do nothing
		bcc.s	fadecolsub4		; If required is larger
		sub.w	d3,2(a1)		; Copper component darker
		bra.s	fadecolsub5
fadecolsub4	add.w	d3,2(a1)		; Copper component brighter
fadecolsub5	moveq	#1,d6			; Made a change!
fadecolsub6	addq.l	#4,a1			; Next copper colour
		dbf	d5,fadecolsub3		; Repeat 32 colours
		lsr.w	#4,d2			; Mask to next component
		lsr.w	#4,d3			; Value to next component
		dbf	d4,fadecolsub2		; Repeat 3 components
		move.l	counter(a6),d0
fadecolsub7	cmp.l	counter(a6),d0
		beq.s	fadecolsub7
		move.l	d6,d0			; Flag to D0
		movem.l	(a7)+,d1-d6/a0-a1	; Won't change flags so
		rts				; can check D0=0 easily

fadecolours	bsr	fadecolsub		; Change colours slowly
		bne.s	fadecolours
		rts

square		movea.l	physicalscreen(a6),a0
		move.w	#screensize/4-1,d0
fill1		clr.l	(a0)+
		dbf	d0,fill1

		lea	animfile(pc),a0
		adda.l	#startbigwhish,a0
		move.w	#TRIGGER,(a0)
		moveq	#40,d0
		bsr	vsyncD0

; Fiddly bit to draw the box. It looked silly starting with a full
; screen and shrinking to the size in anim frame 1, as the anim box
; isn't centred! As the anim box is 34 pixels from the top, I start
; off with a box 34 pixels larger in all directions and shrink that.

		movea.l	physicalscreen(a6),a0
		lea	2*planesize(a0),a0
		move.w	#197-1,d0
		moveq	#-1,d1
fill2		clr.l	(a0)+			; 0-31
		clr.l	(a0)+			; 32-63
		move.l	#$7fffffff,(a0)+	; 64-95
		move.l	d1,(a0)+		; 96-127
		move.l	d1,(a0)+		; 128-159
		move.l	d1,(a0)+		; 160-191
		move.l	d1,(a0)+		; 192-223
		move.l	#$fffffffe,(a0)+	; 224-255
		clr.l	(a0)+			; 256-287
		clr.l	(a0)+			; 288-319
		dbf	d0,fill2

		lea	startsquare(pc),a0	; Square source coordinates
		lea	movesquare(pc),a1	; Work area
		lea	endsquare(pc),a2	; Square end coordinates
		move.l	(a0),(a1)		; Copy start coords
		move.l	4(a0),4(a1)

square_l1	bsr	fadecolsub		; Wait VBL & fade colours up
		moveq	#2,d0
		bsr	vsyncD0
		movem.l	(a1),d0-d1		; Get current coords
		sub.l	(a2),d0			; Sub end coords
		sub.l	4(a2),d1
		or.l	d1,d0			; Test if result = 0
		beq.s	square_lx		; Finished!
		moveq	#6,d7			; Offsets 6,4,2,0
square_l2	moveq	#0,d0
		move.w	0(a1,d7.w),d0		; Get current coord
		cmp.w	0(a2,d7.w),d0		; Compare to end coord
		beq.s	square_l3		; If already there
		scs	d1
		ext.w	d1
		bset	#0,d1			; Gives +1 or -1
		sub.w	d1,0(a1,d7.w)		; Alter current coord
		movem.l	a0-a2,-(a7)		; Save registers
		lea	squaretab(pc),a0	; Base of jump table
		move.w	0(a0,d7.w),d1		; Get offset
		jsr	0(a0,d1.w)		; Call routine
		movem.l	(a7)+,a0-a2		; Restore registers
square_l3	subq.w	#2,d7			; Next offset
		bpl.s	square_l2		; Until done 6,4,2,0
		bra.s	square_l1		; Repeat until finished
squaretab	dc.w	square_vert-squaretab
		dc.w	square_horiz-squaretab
		dc.w	square_vert-squaretab
		dc.w	square_horiz-squaretab

; Clear a vertical line

square_vert	movea.l	physicalscreen(a6),a0	; Get start of screen
		lea	planesize*2(a0),a0	; Point to bitplane 2
		move.w	d0,d1			; Coord to D1
		lsr.w	#3,d1			; Divide by 8
		adda.w	d1,a0			; Offset along line
		moveq	#7,d1
		eor.w	d1,d0
		and.w	d0,d1			; Gives 7 to 0
		move.w	#256-1,d0		; Height of screen
square_v1	bclr	d1,(a0)			; Clear a bit
		lea	40(a0),a0
		dbf	d0,square_v1
		rts

; Clear a horizontal line

square_horiz	movea.l	physicalscreen(a6),a0	; Get start of screen
		lea	planesize*2(a0),a0	; Point to bitplane 2
		lsl.w	#3,d0
		adda.w	d0,a0
		lsl.w	#2,d0
		adda.w	d0,a0			; Adds D0*40
		move.w	#20-1,d0		; Width of line
square_h1	clr.l	(a0)+			; Clear the line
		dbf	d0,square_h1
		rts

square_lx	moveq	#20,d0
		bra	vsyncD0



	IFD	pfusch

planelist1	dc.w	bplpt+0,screen1>>16	; Bitplane pointers
		dc.w	bplpt+2,screen1&$ffff	; for screen one
		dc.w	bplpt+4,(screen1+planesize)>>16
		dc.w	bplpt+6,(screen1+planesize)&$ffff
		dc.w	bplpt+8,(screen1+planesize*2)>>16
		dc.w	bplpt+10,(screen1+planesize*2)&$ffff
		dc.w	bplpt+12,(screen1+planesize*3)>>16
		dc.w	bplpt+14,(screen1+planesize*3)&$ffff
		dc.w	bplpt+16,(screen1+planesize*4)>>16
		dc.w	bplpt+18,(screen1+planesize*4)&$ffff


planelist2	dc.w	bplpt+0,screen2>>16	; Bitplane pointers
		dc.w	bplpt+2,screen2&$ffff	; for screen two
		dc.w	bplpt+4,(screen2+planesize)>>16
		dc.w	bplpt+6,(screen2+planesize)&$ffff
		dc.w	bplpt+8,(screen2+planesize*2)>>16
		dc.w	bplpt+10,(screen2+planesize*2)&$ffff
		dc.w	bplpt+12,(screen2+planesize*3)>>16
		dc.w	bplpt+14,(screen2+planesize*3)&$ffff
		dc.w	bplpt+16,(screen2+planesize*4)>>16
		dc.w	bplpt+18,(screen2+planesize*4)&$ffff

	ENDC
	

planelist1	dc.w	bplpt+0,0
		dc.w	bplpt+2,0
		dc.w	bplpt+4,0
		dc.w	bplpt+6,0
		dc.w	bplpt+8,0
		dc.w	bplpt+10,0
		dc.w	bplpt+12,0
		dc.w	bplpt+14,0
		dc.w	bplpt+16,0
		dc.w	bplpt+18,0


planelist2	dc.w	bplpt+0,0
		dc.w	bplpt+2,0
		dc.w	bplpt+4,0
		dc.w	bplpt+6,0
		dc.w	bplpt+8,0
		dc.w	bplpt+10,0
		dc.w	bplpt+12,0
		dc.w	bplpt+14,0
		dc.w	bplpt+16,0
		dc.w	bplpt+18,0


		rsreset
counter		rs.l	1
nextscreen	rs.l	1
logicalscreen	rs.l	1
physicalscreen	rs.l	1
oldvblank	rs.l	1
finish		rs.l	1
bm_width	rs.w	1
bm_height	rs.w	1
bm_planes	rs.b	1
bm_compression	rs.b	1
palette		rs.w	32
controloffset	rs.w	1
VARS_SIZEOF	rs.w	0

variables	ds.b	VARS_SIZEOF

UNPACK:		movea.l	logicalscreen(a6),a0
		move.l	#$002800C8,D0
		move.l	#$00050028,D1
		move.l	#$1F400000,D2


****	Reg's on entry:
****	D0 high word = Dest'n line offset in bytes
****	D0 low word  = Dest'n scan lines deep
****	D1 high word = Dest'n number of planes
****	D1 low word  = Width in bytes to unpack on each scanline
****	D2 high word = Size of complete plane at dest'n
****	A0   long    = Dest'n address to store unpacked screen
****	A1   long    = Source IFF data (the BODY chunk)

		move.w	#15,d2
		add.w	bm_width(a6),d2		; IFF pixel width
		andi.w	#$FFF0,d2		; Round up to WORD
		lsr.w	#3,d2			; Now IFF byte width

****	First see if IFF screen is smaller (Y size) than
****	the requested screen.

		cmp.w	bm_height(a6),d0
		bcs	scan_entry		; To the DBF
		move.w	bm_height(a6),d0	; else use IFF height
		bra	scan_entry		; Branch to da DBF

scan_loop	move.b	#0,d3			; Clear "current plane"
		movea.l	a0,a2			; Work dest'n address

undo_loop.10	cmp.b	bm_planes(a6),d3
		beq	next_scan		; Done all planes!

		swap	d1
		move.b	d1,d4			; No. of planes at dest'n
		swap	d1
		cmp.b	d4,d3
		bcs.s	undo_loop.20		; If < planes req'd

		moveq	#0,d4			; Do (skip) full line
		bra.s	skipiff			; Skip one line

undo_loop.20	moveq	#0,d4			; Bytes so far
undo_loop.30	cmpi.b	#1,bm_compression(a6)
		bne.s	undostraight

; Right...gotta unpack the compressed scanlines!

undo_loop.35	cmp.b	d2,d4			; Finished IFF data?
		beq.s	undo7
		moveq	#0,d5
		move.b	(a1)+,d5		; Get the byte count
		cmpi.b	#128,d5
		beq.s	undo_loop.35		; Duffer

undo_loop.40	cmp.b	d1,d4			; Gone past req'd?
		bcc.s	undo_loop.45
		move.b	(a1),0(a2,d4.w)		; Copy byte

undo_loop.45	addq.b	#1,d4
		tst.b	d5
		bmi.s	undo_loop.50		; Branch if byte-repeat
		addq.l	#1,a1			; Do a byte-run-copy
		dbf	d5,undo_loop.40
		bra.s	undo_loop.35
undo_loop.50	addq.b	#1,d5			; Works OK coz drops into
		bra.s	undo_loop.40		; addq.l #1,a1 at right time

undostraight	cmp.b	d2,d4
		beq.s	undo7			; If finished IFF
		cmp.b	d1,d4
		bcc.s	undo_str.10		; If >= req'd
		move.b	(a1),0(a2,d4.w)		; Copy
undo_str.10	addq.l	#1,a1			; Next IFF
		addq.b	#1,d4			; Offset+1
		bra.s	undostraight

skipiff		cmpi.b	#1,bm_compression(a6)
		beq.s	skipiff.05
		lea	0(a1,d2.w),a1
		bra.s	undo7

skipiff.05	cmp.b	d4,d2
		beq.s	undo7
		moveq	#0,d5
		move.b	(a1)+,d5
		cmpi.b	#128,d5
		beq.s	skipiff.05
skipiff.10	addq.b	#1,d4
		tst.b	d5
		bmi.s	skipiff.20
		addq.l	#1,a1
		dbf	d5,skipiff.10
		bra.s	skipiff.05
skipiff.20	addq.b	#1,d5
		bra.s	skipiff.10

undo7		swap	d2
		lea	0(a2,d2.w),a2		; Plane offset
		swap	d2
		addq.b	#1,d3			; Do next plane!
		bra	undo_loop.10

next_scan	swap	d0
		lea	0(a0,d0.w),a0		; One scanline down
		swap	d0
scan_entry	dbf	d0,scan_loop
		rts

		ds.l	100
stack
dosname		dc.b	"dos.library",0
		even
sound_whoobr	equ	1*32
sound_wave	equ	2*32
sound_bleep	equ	3*32
sound_whish	equ	4*32

		ifne	PAL
xx		equ	5
		elseif
xx		equ	6
		endc

framecontrol	dc.b	xx!sound_whish,xx,xx,xx,xx,xx,xx*3,xx!sound_whoobr
		dc.b	xx,xx,xx,xx,xx,xx,xx,xx*5
		dc.b	xx!sound_wave,xx,xx,xx,xx,xx,xx,xx
		dc.b	xx,xx,xx*5,xx!sound_bleep,xx,xx*2,xx!sound_bleep,xx
		dc.b	xx*2,xx!sound_bleep,xx,xx*2,xx!sound_bleep,xx,xx*2
		dc.b	xx!sound_bleep,xx,xx*2
		dc.b	xx,xx,xx,xx,xx,xx,xx,xx,xx,xx,xx,xx,xx,xx,xx,xx

		ifne	PAL
animfile	incbin	"virginamiPAL"
		elseif
animfile	incbin	"virginamiNTSC"
		endc
		EVEN


; Initialise sfx stuff

initsound	equ	*-animfile

; Turn filter off
	bset	#1,$bfe001
; Clear some variables
	lea	whoobrwait,a0
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
; Drop into killsound

killsound	equ	*-animfile

	lea	custom,a0
	move.w	#15,intena(a0)
	moveq	#0,d0
	move.w	d0,aud0+ac_vol(a0)
	move.w	d0,aud1+ac_vol(a0)
	move.w	d0,aud2+ac_vol(a0)
	move.w	d0,aud3+ac_vol(a0)
	rts

; To start a sound effect, set its wait timer to TRIGGER
; i.e. To start the wave, use  'move #TRIGGER,wavewait'
;      To start the whoobr, use 'move #TRIGGER,whoobrwait'

; The sfx driver - nice and simple - call it 50 times a second
; Channels 0 & 1 are used for the WHOOBR sound
; Channels 2 & 3 are used for the WAVE sound
; Channels 0 & 1 are used for the BLEEP sound
; Channels 0 & 1 are used for the big WHISH sound
; Channels 2 & 3 and used for the smaller WHISH sound

do_sfx	equ	*-animfile

	movem.l	d2-d7/a2,-(a7)

	lea	custom,a0
; Process whoobr
	lea	whoobrwait,a1
	lea	whoobr,a2
	move	(a2)+,d3
	add	#50,d3
	moveq	#0,d4
	move	#whoobrsize/2,d5
	move	#TRIGGERSTART2,d6
	move	#TRIGGERSTART1,d7
	bsr	PROCFX

; Process wave
	lea	wavewait,a1
	lea	wave,a2
	move	(a2)+,d3
	moveq	#2,d4
	move	#wavesize/2,d5
	bsr	PROCFX

; Process bleep
	lea	bleepwait,a1
	lea	bleep,a2
	move	(a2)+,d3
	moveq	#0,d4
	move	#bleepsize/2,d5
	bsr	PROCFX

; Process big whish
	lea	bigwhishwait,a1
	lea	whish,a2
	move	(a2)+,d3
	add	d3,d3
	add	#500,d3
	moveq	#0,d4
	move	#whishsize/2,d5
	bsr	PROCFX

; Process little whish (for expanding slit - hope that doesn't sound rude)
	lea	whishwait,a1
	lea	whish,a2
	move	(a2)+,d3
	sub	#50,d3
	moveq	#2,d4
	move	#3584/2,d5
	bsr	PROCFX

; All done
	movem.l	(a7)+,d2-d7/a2
	rts



; Process sound effect
; Entry:
;  CUSTOM in a0
;  wait address in a1
;  first channel trigger in d7
;  second channel trigger in d6
;  sample address in a2
;  sample length in d5 (in words)
;  channel index (0 - 3) in d4
;  sample period in d3
; Exit:
;  all above registers intact. Make no assumptions about other registers
;  except for a3-a6 which are also preserved
PROCFX	move.l	d4,-(a7)
	move	(a1),d0		; get wait value
	beq	l5			; quit if nothing doing
	moveq	#1,d1
	lsl	d4,d1			; shift channel into bit place
	move	d4,d2
	lsl	#4,d2			; offset to audio block (*16)
	add	#aud0,d2		; absolute within chip
	cmp	d7,d0			; first trigger?
	bne.s	l1
	move	d1,dmacon(a0)		; turn channel off
	move	d3,ac_per(a0,d2)
	move.l	a2,ac_ptr(a0,d2)
	move	d5,ac_len(a0,d2)
	move	#64,ac_vol(a0,d2)
	or	#$8200,d1
	move	d1,dmacon(a0)		; turn channel on
l1	move	d7,d1
	subq	#1,d1
	cmp	d1,d0			; trigger null?
	bne.s	l2
	pea	nullsample
	move.l	(a7)+,ac_ptr(a0,d2)
;	move.l	#nullsample,ac_ptr(a0,d2)
	move	#nullsamplesize/2,ac_len(a0,d2)
l2	addq	#1,d4			; next audio block
	moveq	#1,d1
	lsl	d4,d1
	move	d4,d2
	lsl	#4,d2			; offset to second audio block
	add	#aud0,d2		; absolute within chip
	cmp	d6,d0			; second trigger?
	bne.s	l3
	move	d1,dmacon(a0)
	move	d3,ac_per(a0,d2)
	move.l	a2,ac_ptr(a0,d2)
	move	d5,ac_len(a0,d2)
	move	#64,ac_vol(a0,d2)
	or	#$8200,d1
	move	d1,dmacon(a0)
l3	move	d6,d1
	subq	#1,d1
	cmp	d1,d0
	bne.s	l4
	pea	nullsample
	move.l	(a7)+,ac_ptr(a0,d2)
;	move.l	#nullsample,ac_ptr(a0,d2)
	move	#nullsamplesize/2,ac_len(a0,d2)
l4	subq	#1,(a1)
l5	move.l	(sp)+,d4
	rts





	section	d,data_c

; Virgin logo sfx for the Amiga

; This was assembled with PDS. Any problems, give me a call:
; Shahid Ahmad
; Tel: 0831 381029

; Note:
; Samples are stored with their periods as the first word - data follows this
; word and is in the normal format for sending direct to Amiga sound DMA

whish		incbin	"whish.spl"
whishsize	equ	*-whish-2

bleep		incbin	"bleep.spl"
bleepsize	equ	*-bleep-2

whoobr		incbin	"whoobr.spl"
whoobrsize	equ	*-whoobr-2

wave		incbin	"wave.spl"
wavesize	equ	*-wave-2

startwhoobr:		;	equ	*-animfile
whoobrwait	dc.w	0
startwave		;	equ	*-animfile
wavewait	dc.w	0
startbleep		;	equ	*-animfile
bleepwait	dc.w	0
startwhish		;	equ	*-animfile
whishwait	dc.w	0
startbigwhish		;	equ	*-animfile
bigwhishwait	dc.w	0

TRIGGERSTART1	equ	7
TRIGGERSTART2	equ	2
TRIGGER		equ	TRIGGERSTART1
 
nullsample	equ	wave+2
nullsamplesize	equ	32

copperlist
bitplanelist	ds.w	20			; Room for bitplane pointers

palettelist	dc.w	color+0,0		; 32 colour palette
		dc.w	color+2,0
		dc.w	color+4,0
		dc.w	color+6,0
		dc.w	color+8,0
		dc.w	color+10,0
		dc.w	color+12,0
		dc.w	color+14,0
		dc.w	color+16,0
		dc.w	color+18,0
		dc.w	color+20,0
		dc.w	color+22,0
		dc.w	color+24,0
		dc.w	color+26,0
		dc.w	color+28,0
		dc.w	color+30,0
		dc.w	color+32,0
		dc.w	color+34,0
		dc.w	color+36,0
		dc.w	color+38,0
		dc.w	color+40,0
		dc.w	color+42,0
		dc.w	color+44,0
		dc.w	color+46,0
		dc.w	color+48,0
		dc.w	color+50,0
		dc.w	color+52,0
		dc.w	color+54,0
		dc.w	color+56,0
		dc.w	color+58,0
		dc.w	color+60,0
		dc.w	color+62,0

sprlist		dc.w	$120,0
		dc.w	$122,0
		dc.w	$124,0
		dc.w	$126,0
		dc.w	$128,0
		dc.w	$12a,0
		dc.w	$12c,0
		dc.w	$12e,0
		dc.w	$130,0
		dc.w	$132,0
		dc.w	$134,0
		dc.w	$136,0
		dc.w	$138,0
		dc.w	$13a,0
		dc.w	$13c,0
		dc.w	$13e,0

		dc.w	$ffff,$fffe

EmptySpr:	dc.l	0
StackPtr:	dc.l	0
		dc.l	"-C5-"


		section	virginbss,bss_c

screen1:	ds.b	screensize
screen2:	ds.b	screensize

		end
