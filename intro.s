
		XREF	InitGfx,GfxBase
		XREF	SetAPen,SetBPen,SetDrawMode,Move
		XREF	ReadPixel,WritePixel,Draw,RectFill
		XREF	PutData,GetData
		XREF	Text,MidText,RightText,Print,StrLen
		XREF	OpenWindow,CloseWindow
		XREF	OpenScreen,CloseScreen,LoadRGB,MoveScreen
		XREF	OpenFont,CloseFont
		XREF	FadeOut,FadeIn
		XREF	RasterDelay,WaitRaster,MergeCopper		* Graphics

		XREF	SetSound,MusicVBL,LockVoices,SongPtr		* SndPlayer

		XREF	Bob0,Bob1,Bob2,Bob3,Bob4,Bob5,Bob6,Bob7
		XREF	Bob8,Bob9,Bob10,Bob11,Bob12,Bob13
		XREF	CheatBob

		XREF	_MyExecBase


		INCLUDE "MyExec.i"			* Includes für EXEC
		INCLUDE "relcustom.i"			* AmigaCustomChips
		INCLUDE "constants.i"			* AmigaConstants
		INCLUDE	"drawbob.i"			* BobRoutine
		INCLUDE "IntroFilenames.i"		* All FileNames
		INCLUDE "Gfx.i"				* Gfx
		INCLUDE "Iff.i"


		SECTION IntroCode,CODE


Main:		move.l	a6,_MyExecBase			* SystemBase

		lea	custom,a5			* Base of AMIGA-Customchips
		lea	IntroVars,a6


		bsr	InitGfx

		lea	IntHandler(pc),a0
		SYSPUT.L a0,VBLIntVector



		move.l	#76624*2,d0
		SYSCALL AllocClearMem
		move.l	d0,PictureBase(A6)		* Picture

		clr.b	FlipFlag(A6)

		lea	ViewBitmStr(pc),a0
		bsr	InitBitmStr
		
		lea	NewScreen(pc),a0
		lea	ViewBitmStr(pc),a1
		move.l	a1,ns_BitmStr(A0)		* BitmStr
		bsr	OpenScreen
		move.l	d0,ScreenBase(A6)


		move.l	d0,a3
		bsr	LoadPic				* Load Picture


		move.l	PictureBase(A6),a0		* Source
		move.l	a0,a1
		move.l	#76624,d0			* Länge
		add.l	d0,a0				* Destination
		SYSCALL	CopyMem



		move.l	a3,a0				* Screen
		lea	sc_Bitmap(a3),a1		* BitmStr
		lea	NewWindow(pc),a0		* MenuWindow
		bsr	OpenWindow			* Open it
		move.l	d0,WindowBase(A6)

		move.l	a3,a0				* Screen
		lea	CMap,a1
		moveq	#100,d0
		lsl.w	#2,d0
		bsr	FadeIn				* Show Screen


		lea	ViewBitmStr(pc),a0
		SYSCALL	InitDrawBob

		lea	DiversBob1(pc),a1
		SYSCALL	AddBob
		lea	DiversBob2(pc),a1
		SYSCALL	AddBob
		lea	DiversBob3(pc),a1
		SYSCALL	AddBob
		lea	DiversBob4(pc),a1
		SYSCALL	AddBob
		lea	DiversBob5(pc),a1
		SYSCALL	AddBob

		lea	FxBobList(pc),a1
		move.l	a1,BobPointer(A6)
		clr.l	FXCounter(A6)

		clr.l	OldVBCounter(A6)
		clr.l	VBCounter(A6)

MainLoop:	SYSCALL	GetKey
		bsr	Delay5Blank

		lea	DrawBitmStr(pc),a1
		SYSCALL	RestoreBobList

		bsr	HandleBobList

		SYSCALL	DrawBobList

		bsr	FlipScreen

		bsr	CheckJoy
		bne.s	MainLoop

FadeLoop:	bsr	DelayBlank

		moveq	#100,d0
		lsl.w	#2,d0
		move.l	ScreenBase(A6),a0
		bsr	FadeOut


		SYSPUT.L 0,VBLIntVector			* Int OFF


		move.l	WindowBase(A6),a0
		bsr	CloseWindow

		move.l	ScreenBase(A6),a0
		bsr	CloseScreen

		bsr	FreeBobs

		rts



**************************************************************************

LoadPic:	movem.l	d0-d7/a0-a6,-(sp)

		lea	sc_Bitmap(a3),a3		* BitmStr
		move.l	#FN_BACKGROUND,d0
		SYSCALL	LoadFastFile			* Load Picture
		move.l	d0,d3

		lea	CMap,a0				* CMap
		move.l	d3,a1				* Picture
		bsr	@GetColorTab

		move.l	a3,a0
		move.l	d3,a1				* Picture
		bsr	@DecodePic

		move.l	d3,a1
		SYSCALL	FreeMem				* Free Picture

		movem.l	(sp)+,d0-d7/a0-a6
		rts


**************************************************************************

FreeBobs:	movem.l	d0-d7/a0-a6,-(sp)
.MainBobLoop:	SYSLEA	BobList,a0
		move.l	bob_NextBob(A0),a0
		tst.l	bob_NextBob(A0)			* A0=Kollision
		beq.s	.EndMainLoop			* auslösendes Bob

		bsr	RemoveOneBob
		bra.s	.MainBobLoop

.EndMainLoop:	movem.l	(sp)+,d0-d7/a0-a6
		rts

RemoveOneBob:	movem.l	d0-d7/a0-a6,-(sp)

		move.w	bob_Flags(A0),d0
		btst	#BOBB_NORESTORE,d0
		bne.s	.NoSaveBuffer

		move.l	bob_LastSaveBuffer(A0),a1
		move.l	bob_LastLastSaveBuffer(A0),a2

		cmp.l	a1,a2
		bgt.s	.Clear

		move.l	a2,a1				* Change LastSaveBuffer

.Clear:		SYSCALL	FreeMem				* Free Buffer (A1)
.NoSaveBuffer:	move.l	a0,a1				* BobStruktur
		SYSCALL Remove				* Node entfernen (A1)
		SYSCALL	FreeMem				* freeen
		movem.l	(sp)+,d0-d7/a0-a6
		rts

**************************************************************************

IntHandler:	movem.l	d0-d7/a0-a6,-(sp)
		lea	custom,a5			* CustomBase
		lea	IntroVars,a6			* My Vars

		move.w	intreqr(A5),d0			* IntReqRegister
		btst	#5,d0				* Our Interrupt
		beq.s	.NoVBlank			* No -->

		addq.l	#1,VBCounter(a6)		* Increase VBCounter

		move.w	#$20,intreq(A5)			* Clear this Interrupt

.NoVBlank:	movem.l	(sp)+,d0-d7/a0-a6
		rts

**************************************************************************

FlipScreen:	movem.l	d0-d1/a0-a1,-(sp)
		not.b	FlipFlag(A6)
		move.l	ScreenBase(A6),a1
		lea	sc_Bitmap(A1),a0
		bsr.s	InitBitmStr			* Bitmstr

		move.l	a1,a0
		moveq	#0,d0
		moveq	#0,d1
		bsr	MoveScreen
		movem.l	(sp)+,d0-d1/a0-a1
		rts

**************************************************************************

InitBitmStr:	movem.l	d0-d2/a0-a2,-(sp)
		lea	DrawBitmStr+bm_Planes(pc),a2

		move.l	PictureBase(A6),d0
		move.l	d0,d1				* 1.Page

		tst.b	FlipFlag(a6)
		beq.s	3$
		add.l	#44*290*6+64,d1			* 2.Page

3$:		tst.b	FlipFlag(a6)
		bne.s	4$
		add.l	#44*290*6+64,d0			* 2.Page

4$:		lea	bm_Planes(A0),a1		* Planes

		moveq	#0,d2
		move.b	bm_Depth(A0),d2
		bra.s	1$

2$:		move.l	d0,(A1)+
		move.l	d1,(A2)+
		add.l	#44*290,d0			* +PlaneLenght
		add.l	#44*290,d1			* +PlaneLenght

1$:		dbf	d2,2$
		movem.l	(sp)+,d0-d2/a0-a2
		rts

**************************************************************************

Delay5Blank:	move.l	OldVBCounter(a6),d0		* Current VBCnt
		addq.l	#4,d0
1$:		cmp.l	VBCounter(a6),d0		* didn't changed
		bhi.s	1$				* yet -->
		move.l	d0,OldVBCounter(A6)
		rts

**************************************************************************

DelayBlank:	move.l	VBCounter(a6),d0
1$:		cmp.l	VBCounter(a6),d0		* didn't changed
		beq.s	1$				* yet -->
		rts

**************************************************************************

WaitJoy:	btst	#7,$bfe001
		bne.s	WaitJoy				* Gedrückt nein -->
.WaitJoy1:	btst	#7,$bfe001
		beq.s	.WaitJoy1			* Gedrückt ja -->
		rts

**************************************************************************

CheckJoy:	btst	#7,$bfe001
		rts

****************************************************************************

HandleBobList:	movem.l	d0-d7/a0-a6,-(sp)
.GetIt:		addq.l	#1,FXCounter(a6)		* Increase VBCounter
		move.l	FXCounter(A6),d0	* Time
		move.l	BobPointer(A6),a0

		move.w	(A0),d1			* Time
		cmp.w	#-1,d1
		bne.s	.NoReset

		lea	FxBobList(pc),a1
		move.l	a1,BobPointer(A6)
		clr.l	FXCounter(A6)
		bra.s	.GetIt

.NoReset:	cmp.w	d0,d1
		bhi.s	.NotYet

		lea	NewBob(pc),a1
		move.l	2(A0),2(A1)		* BobData

		moveq	#16,d0
		cmp.l	#Bob4,2(A1)
		beq.s	.Pri
		cmp.l	#Bob5,2(A1)
		beq.s	.Pri
		cmp.l	#Bob6,2(A1)
		bne.s	.NoPri
.Pri:		moveq	#16,d0
.NoPri:		move.w	d0,8(A1)

		SYSCALL	AddBob
		move.l	d0,a1

		moveq	#260/16,d0
		SYSCALL	Random
		lsl.w	#4,d0
		add.w	#48,d0
		move.w	d0,bob_X(A1)

		addq.l	#6,BobPointer(A6)	* Next Entry
.NotYet:	movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************

		*** Bobs ***

NewEndBob:	SETDATA		Bob6
		SETFLAGS	BOBF_NOLIST|BOBF_NORESTORE|BOBF_NODOUBLE
		SETCLIP		-16,1,368,289,CLIPF_ALL
		ENDE

DiversBob1:	SETDATA		Bob7
		SETX		197
		SETY		208
		SETPRI		64
		SETFLAGS	BOBF_SPECIALDRAW+BOBF_NORESTORE
		ENDE

DiversBob2:	SETDATA		Bob8
		SETX		95
		SETY		172
		SETPRI		64
		SETFLAGS	BOBF_SPECIALDRAW+BOBF_NORESTORE
		ENDE

DiversBob3:	SETDATA		Bob9
		SETX		273
		SETY		183
		SETPRI		64
		SETFLAGS	BOBF_SPECIALDRAW+BOBF_NORESTORE
		ENDE

DiversBob4:	SETDATA		Bob10
		SETX		89
		SETY		184
		SETPRI		32
		SETFLAGS	BOBF_SPECIALDRAW+BOBF_NORESTORE
		ENDE

DiversBob5:	SETDATA		Bob11
		SETX		167
		SETY		83
		SETPRI		32
		SETFLAGS	BOBF_SPECIALDRAW
		ENDE

DiversBob6:	SETDATA		Bob12
		SETX		302
		SETY		118
		SETPRI		32
		SETFLAGS	BOBF_SPECIALDRAW
		ENDE

NewBob:		SETDATA		Bob0
		SETPRI		0
		SETY		360
		SETMOVE		MovePrg
		SETCLIP		0,0,352,290,CLIPF_ALL
		ENDE

MovePrg:	UP		410
		REMOVE
		ENDE

FxBobList:	dc.w		75			* Time
		dc.l		Bob0			* BobData
		dc.w		150			* Time
		dc.l		Bob4			* BobData
		dc.w		225			* Time
		dc.l		Bob1			* BobData
		dc.w		300			* Time
		dc.l		Bob5			* BobData
		dc.w		375			* Time
		dc.l		Bob2			* BobData
		dc.w		450			* Time
		dc.l		Bob6			* BobData
		dc.w		525			* Time
		dc.l		Bob3			* BobData
		dc.w		600			* Time
		dc.l		Bob5			* BobData
		dc.w		-1

		*** BitmStructures ***

ViewBitmStr:	dc.w	44				* 0 ScrWidth in Bytes
		dc.w	290				* 2 ScrHeight in Pixels
		dc.b	0				* 4 Pad
		dc.b	6				* 5 Depth
		dc.w	0				* 6 Flags
		dc.l	0,0,0,0,0,0			* 5 Pointers to Bitmap

DrawBitmStr:	dc.w	44				* 0 ScrWidth in Bytes
		dc.w	290				* 2 ScrHeight in Pixels
		dc.b	0				* 4 Pad
		dc.b	6				* 5 Depth
		dc.w	0				* 6 Flags
		dc.l	0,0,0,0,0,0			* 5 Pointers to Bitmap

		*** Screens & Windows ***

NewScreen:	dc.w	-16				* Left Edge
		dc.w	-24				* Top Edge
		dc.w	352				* Width
		dc.w	290				* Height
		dc.w	6				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

NewWindow:	dc.w	0				* Left Edge	
		dc.w	0				* Top Edge
		dc.w	352				* Width in Pixels				
		dc.w	290				* Height in Pixels
		dc.b	17				* APen
		dc.b	0				* BPen
		dc.w	WNF_NOBACKSAVE+WNF_BORDERLESS	* WindowFlags
		dc.w	DM_JAM				* DrawMode
		dc.l	0				* This Windows Titel
		dc.l	0				* Font

Para:		dc.l	0

		CNOP	0,2


		SECTION	IntroData,DATA

	STRUCTURE WonderStruct,0

		LONG	VBCounter
		LONG	OldVBCounter
		LONG	ScreenBase
		LONG	WindowBase
		LONG	PictureBase
		LONG	BobPointer
		LONG	FXCounter
	
		BYTE	NoSound
		BYTE	FlipFlag

		LABEL	WonderVar_SIZEOF


		SECTION	MyBss,BSS

IntroVars:	DS.B	WonderVar_SIZEOF
CMap:		DS.W	64
