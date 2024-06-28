*****************************************************************************
**                                                                         **
**  WonderGirl:                                     WonderBoy like Game    **
**                                                                         **
*****************************************************************************
**                                                                         **
**  						   Last Change : 07-Okt-90 **
**                                                                         **
*****************************************************************************


		XREF	BlackCopper
		XREF	CopperList,CopperSprites,SetPointers
		XREF	CopperColor,CopperColor2
		XREF	BitMapPtrs,c_bplcon1
		XREF	cpr_Cloud1bpl,cpr_Cloud1bpt
		XREF	cpr_Cloud2bpl,cpr_Cloud2bpt
		XREF	cpr_Cloud3bpl,cpr_Cloud3bpt
		XREF	CopyColorMap
		XREF	SetColors,FadeOutCopper,FadeInCopper
		XREF	PanelColors,PanelPtrs			* CopperList	
		XREF	Level1ColorMap,Level2ColorMap,Level3ColorMap
		XREF	Level4ColorMap,Level5ColorMap,Level6ColorMap
		XREF	FadeOutCopp,FadeInCopp

		XREF	InitGfx,GfxBase
		XREF	SetAPen,SetBPen,SetDrawMode,Move
		XREF	ReadPixel,WritePixel,Draw,RectFill
		XREF	PutData,GetData
		XREF	Text,MidText,RightText,Print,StrLen
		XREF	OpenWindow,CloseWindow,ClearWindow
		XREF	OpenScreen,CloseScreen,LoadRGB,MoveScreen,MergeCopper
		XREF	OpenFont,CloseFont
		XREF	FadeOut,FadeIn
		XREF	RasterDelay,WaitRaster				* Graphics

		XREF	GetPosition,InsertScore,HiList			* HiScore
		XREF	LoadScores,SaveScores

		XREF	SetSound,MusicVBL,LockVoices,SongPtr		* SndPlayer
		XREF	PlayFX

		XREF	GetJoy,WaitJoy,CheckJoy,JoyStick
		XREF	StickCnt,ButtonCnt

		XREF	MyHandleCollision,MyCollOneBob
		XREF	EnemyList1,EnemyList2,EnemyList3,EnemyList4,EnemyList5
		XREF	EnemyList6,EnemyList7,EnemyList8,EnemyList9
		XREF	Level1BobTab,Level2BobTab,Level3BobTab,Level4BobTab,Level5BobTab
		XREF	Level6BobTab,Level7BobTab,Level8BobTab,Level9BobTab

		XREF	JoyMove,JoyMem,ButtonMem,ButtonMove

		XDEF	ShootColl,EnergyColl,HealthColl
		XDEF	CubeColl,ShopColl,CoinColl,FrageZeichenHandler
		XDEF	Bonus1Handler,Bonus2Handler,Bonus3Handler,Bonus4Handler,Bonus5Handler
		XDEF	CommonRemBob,CommonRemBobTest,FallHandler
		XDEF	Play8SVX

		XDEF	ImmerCoinBob,Coin,ImmerEmptyBob
		XDEF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XDEF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XDEF	ImmerShopBob1
		XDEF	ImmerGetJobBob,ImmerGetJobBob2,ImmerGetJobBob3,ImmerGetJobBob4
		XDEF	ImmerGetJobBob5,ImmerGetJobBob6,ImmerGetJobBob7
		XDEF	ImmerGetJobBob8,ImmerGetJobBob9,ImmerGetJobBob10
		XDEF	ImmerGetJobBob11,ImmerGetJobBob12,ImmerGetJobBob13
		XDEF	ImmerGetJobBob14,ImmerGetJobBob15,ImmerGetJobBob16
		XDEF	ImmerGetJobBob17,ImmerGetJobBob18,ImmerGetJobBob19
		XDEF	ImmerGetJobBob20
		XDEF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XDEF	ImmerHaus64Bob,ImmerHaus13Bob
		XDEF	Job1Done,ImmerSandUhr
		XDEF	ImmerBusStop1,ImmerBusStop2,ImmerBusStop3

		XDEF	WonderVars,GetElem,GetInfo,ReachedBusStop
		XDEF	GameEnd

		XREF	_MyExecBase

;TEST
INTRO
;;TRUEINTRO
VIRGIN
;DEMOONE
;POSITION
DEBUG
MEM
;FREEZE
;GERMAN


		INCDIR	h:

		INCLUDE "DosFilenames.i"		* FileNames
		INCLUDE "MyExec.i"			* Includes für EXEC
		INCLUDE "relcustom.i"			* AmigaCustomChips
		INCLUDE "constants.i"			* AmigaConstants
		INCLUDE	"definitions.i"			* Global definitions
		INCLUDE	"drawbob.i"			* Bob Routine
		INCLUDE "Gfx.i"				* Gfx
		INCLUDE "Sfx.i"				* Sfx
		INCLUDE "Iff.i"				* Sfx

		INCLUDE	"Gfx/Levels/Flags1.i"
		INCLUDE	"Gfx/Levels/Flags2.i"
		INCLUDE	"Gfx/Levels/Flags4.i"
		INCLUDE	"Gfx/Levels/Flags5.i"
		INCLUDE	"Gfx/Levels/Flags8.i"
		INCLUDE	"Gfx/Level1Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"
		INCLUDE	"Gfx/KarteBobs.i"
		INCLUDE	"Gfx/FinalBobs.i"
		INCLUDE	"Gfx/Laterne.i"

		IFD	POSITION
		 INCLUDE "BobOffsets.i"
		ENDC



		SECTION Program,CODE


Main:		move.l	a6,_MyExecBase			* SystemBase
		lea	custom,a5			* Base of AMIGA-Customchips
		lea	WonderVars,a6

		clr.b	LowMemFlag(A6)

		SYSCALL	AvailMem
		move.l	d0,d1
		SYSCALL	AvailFastMem
		add.l	d0,d1

		cmp.l	#500*1024,d1			* FastRam oder 1MByte CHIP ?
		bhi.s	.EnoughMem			* -->
	
		st.b	LowMemFlag(A6)

.EnoughMem:	move.l	#BlackCopper,cop1lc(a5)

	;	move.w	#$7FFF,intreq(A5)
	;	move.w	#$C000+INTF_PORTS,intena(A5)	* Enable MasterInt+KeyInt
	;	move.w	#$87C0,dmacon(A5)		* Enable DMA|BITMAP|COPPER|BLITTER|BLITTERNASTY|SPRITES
		bset.b	#1,$bfe001			* Filter OFF
		move.w	#$20,$dff1dc			* PAL-Screen

		bsr	InitGfx
		bsr	LoadScores			* Load HiScores

	;	lea	ResetHandler(pc),a0
	;	SYSCALL	SetResetHandler


	IFND	INTRO

		move.w	#6,SongSpeed(A6)

		move.l	#37000,d0
		SYSCALL	AllocClearMem
		move.l	d0,SongPtr			* Load Song

		move.l	#FN_INTROSONG,d0
		move.l	SongPtr,a0
		SYSCALL	ReadFile

		st.b	MusicFlag(A6)

		moveq	#2,d0
		bsr	SetSound			* Start Sound

		clr.b	MusicFlag(A6)
	ENDC


	IFD	TRUEINTRO

		move.l	#FN_INTRO,d0
		SYSCALL	LoadSeg				* Intro laden
		move.l	d0,a4				* Entry

		movem.l	d0-d7/a0-a6,-(sp)
		move.l	_MyExecBase,a6
		jsr	(A4)				* Start It
		movem.l	(sp)+,d0-d7/a0-a6

		move.l	a4,a1
		SYSCALL	UnLoadSeg

	;	move.w	#$C000+INTF_PORTS,intena(A5)	* Enable MasterInt+KeyInt
	;	move.w	#$87C0,dmacon(A5)		* Enable DMA|BITMAP|COPPER|BLITTER|BLITTERNASTY|SPRITES
	;	bset.b	#1,$bfe001			* Filter OFF

	ENDC


		clr.b	FxFlag(A6)
		st.b	NoInt(a6)

		lea	IntHandler(pc),a0
		SYSPUT.L a0,VBLIntVector
		lea	CopperInt(pc),a0
		SYSPUT.L a0,CopperIntVector


	IFD	INTRO


		move.w	#6,SongSpeed(A6)

		move.l	#37000,d0
		SYSCALL	AllocClearMem
		move.l	d0,SongPtr			* Load Song

		move.l	#FN_INTROSONG,d0
		move.l	SongPtr,a0
		SYSCALL	ReadFile


	IFD	VIRGIN

		move.l	#FN_VIRGIN,d0
		SYSCALL	LoadSeg				* Intro laden
		move.l	d0,a4				* Entry

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	(A4)				* Start It
		movem.l	(sp)+,d0-d7/a0-a6

		move.l	a4,a1
		SYSCALL	UnLoadSeg

		move.w	#$C000+INTF_PORTS,intena(A5)	* Enable MasterInt+KeyInt
		move.w	#$87C0,dmacon(A5)		* Enable DMA|BITMAP|COPPER|BLITTER|BLITTERNASTY|SPRITES
		bset.b	#1,$bfe001			* Filter OFF
	ENDC



		st.b	MusicFlag(A6)

		moveq	#2,d0
		bsr	SetSound			* Start Sound

		clr.b	MusicFlag(A6)

		move.l	#FN_PRESENTS,d0
		lea	PresentsScreen(pc),a0
		lea	ShortDelay(pc),a1
		bsr	ShowScreen			* 'Presents A'


		bsr	StarByte			* 'StarByte'


		move.l	#FN_PRODUCTION,d0
		lea	ProductionScreen(pc),a0
		lea	ShortDelay(pc),a1
		bsr	ShowScreen			* 'Production'

		SYSCALL	GetKey

		move.l	#200*1024,d0
		SYSCALL	AllocMem
		move.l	d0,MenuWindow(A6)

		move.l	#FN_LABEL,d0
		lea	NewLabelScreen(pc),a0
		lea	HauptLader(pc),a1
		bsr	ShowScreen			* 'A Touch of Magic'

		move.l	#FN_TITEL,d0
		lea	ExtraDelay(pc),a1		* WaitJoy()
		lea	NewTitelScreen(pc),a0
		bsr	ShowScreen			* 'Rolling Ronny'
	ENDC


	IFND	INTRO
		bsr	HauptLader
	ENDC

		clr.b	ContinueCnt(A6)

		bsr	ChangeSong1

ReStart:	st.b	NoInt(a6)

		bsr	Menu

		move.w	d0,ActLevel(A6)			* ActLevel

		lea	LevelTab(pc),a0
		move.w	d0,d1
		mulu	#LEVEL_TAB_SIZE,d0
		add.l	d0,a0				* Which Level
		move.l	a0,ActLevelPtr(A6)		* Initiate Level
		lea	WayTab(pc),a0
		mulu	#WAY_TAB_SIZE,d1
		add.l	d1,a0
		move.l	a0,ActWayPtr(A6)		* Initiate Way

		clr.l	Score(A6)			* Score
		move.l	a0,OldScore(A6)			* OldScore

		bsr	LoadLevel			* Load Level
		bsr	CreateLevel			* Init Level

		lea	DrawBitmStr(pc),a0
		SYSCALL	InitDrawBob			* Init BobRoutine

NewLevel:	bsr	InitVars			* Set our Variables
		bsr	InitLevel			* Reset EnemyList
		bsr	ClearPanel			* Reset Bonus

		move.l	#BlackCopper,cop1lc(a5)

		lea	MyNewBob(pc),a1
		SYSCALL	AddBob				* Add my Bob
		move.l	d0,MyBob(a6)
		move.l	d0,a0
		move.w	#116,bob_X(A0)
		move.l	ActLevelPtr(A6),a2

		move.w	#RWALK,bob_Image(A0)		* Shape
		move.w	RONNY_Y(A2),bob_Y(A0)

		move.l	PTR_SONGHANDLER(A2),a1
		move.l	a1,d0				* SongHandler
		beq.s	.NoHandler			* -->

		jsr	(A1)				* Use it

.NoHandler:	move.l	PTR_CLOUDHANDLER(A2),a1
		move.l	a1,d0
		beq.s	.NoCloudHandler

		jsr	(a1)

.NoCloudHandler:

		IFD	POSITION

		 lea	NewDebugBob(pc),a1
		 move.l	BobBase(a6),2(A1)
		 SYSCALL	AddBob
		 move.l	d0,DebugBob(A6)
		 move.w	#160,DebugX(A6)
		 move.w	#100,DebugY(A6)

		 move.l	#BobListe,DebugPtr(A6)

		ENDC

		clr.l	VBCounter(A6)
		clr.l	OldVBCounter(A6)
		clr.b	NoInt(a6)

		bsr	Delay2Blanks

		move.l	#CopperList,cop1lc(A5)		* Set our CopperList

		bsr	FadeInCopper			* Screen einfaden

		lea	ViewBitmStr(pc),a1
		move.l	a1,ActBitmap(A6)		* BitmStr

		st.b	GameFlag(A6)

		move.b	#1,DirX(A6)
		bsr	HandleEnemyList			* Set some new Enemies

		move.l	#50*60*5,GameTimer(A6)		* Timer 5 Minutes

		tst	ActLevel(a6)
		bne.s	.NotFirstLevel

		move.l	#50*60*6,GameTimer(A6)

.NotFirstLevel:	clr.l	Time(A6)

MainLoop:	bsr	Delay2Blanks
		addq.l	#1,Time(A6)			* Nach VBlankInt

		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		bsr	UpDatePanel

		lea	DrawBitmStr(pc),a1
		SYSCALL	RestoreBobList			* Restore Bobs

****************************************************************************

		IFD	POSITION

		 move.l	DebugBob(A6),a1
		 move.w	LevelX(a6),d0
		 add.w	DebugX(A6),d0
		 move.w	d0,bob_X(a1)
		 move.w	DebugY(A6),bob_Y(A1)

		 SYSGET.B ActualASCIIKey,d0
		 cmp.b	#'w',d0
		 bne.s	2$

		 move.l	DebugBob(A6),a0
		 SYSCALL RemBob

		 cmp.l	#EndListe-4,DebugPtr(A6)
		 beq.s	5$
		 addq.l	#4,DebugPtr(A6)
5$:		 move.l	DebugPtr(A6),a1
		 move.l	(A1),d0

		 add.l	BobBase(A6),d0
		 lea	NewDebugBob(pc),a1
		 move.l	d0,2(A1)
		 SYSCALL AddBob
		 move.l	d0,DebugBob(A6)
		 bra.s	3$

2$:		 cmp.b	#'q',d0
		 bne.s	3$

		 move.l	DebugBob(A6),a0
		 SYSCALL RemBob

		 cmp.l	#BobListe,DebugPtr(A6)
		 beq.s	4$
		 subq.l	#4,DebugPtr(A6)
4$:		 move.l	DebugPtr(A6),a1
		 move.l	(A1),d0

		 add.l	BobBase(A6),d0

		 lea	NewDebugBob(pc),a1
		 move.l	d0,2(A1)
		 SYSCALL	AddBob
		 move.l	d0,DebugBob(A6)

3$:		 cmp.b	#'8',d0
		 bne.s	.noup

		 subq.w	#1,DebugY(A6)

.noup:		 cmp.b	#'2',d0
		 bne.s	.nodown

		 addq.w	#1,DebugY(A6)

.nodown:	 cmp.b	#'4',d0
		 bne.s	.noleft

		 subq.w	#1,DebugX(A6)

.noleft:	 cmp.b	#'6',d0
		 bne.s	.noright

		 addq.w	#1,DebugX(A6)

.noright:	 SYSCALL	FlushKeyBuf

		ENDC

****************************************************************************

		bsr	Shoot				* Schusshandler
		bsr	HandleRemove			* RemBobs
		bsr	HandleEnemyList			* Set some new Enemies

		moveq	#0,d0
		move.b	HimmelFlag(A6),d0
		or.b	SturzFlag(a6),d0
		bne.s	.NoColl

		bsr	MyHandleCollision		* Bob-Collision

.NoColl:	bsr	UpDateClip			* Set new Clip-Coords

		lea	DrawBitmStr(pc),a1
		SYSCALL	DrawBobList			* Draw Bobs

		bsr	FlipScreen			* FlipIt

		bsr	HandlePanel

	IFD	TEST
		tst.b	FKeyFlag
		bne	Exit2
	ENDC

		tst.b	EndFlag(a6)			* End
		bne.s	Exit				* yes -->

		tst.l	GameTimer(A6)
		bne.s	.TimeExit

		move.b	#OUT_OF_TIME,EndFlag(a6)


.TimeExit:	SYSGET.B CheatFlag,d0
		beq.s	.NoExit

		btst	#6,$bfe001
		beq.s	.Exit

.NoExit:	bra	MainLoop

.Exit:
	IFD	DEBUG
		move.b	#LEVEL_END,EndFlag(A6)
	ENDC
		
Exit:		sf.b	DemoFlag(A6)			* DemoEnde

		bsr	DelayBlank			* Warten bis Copper kommt
		bsr	DelayBlank

		st.b	NoInt(a6)			* Int ausschalten

	IFD	DEMOONE
		cmp.b	#DEMO_END,EndFlag(A6)
		beq.s	1$

		moveq	#20,d0
		move.w	#292,d1
		moveq	#60,d2
		lea	DemoTxt(pc),a0
		sub.l	a1,a1
		bsr	Message
1$:
	ENDC
		sf.b	GameFlag(A6)			* GameEnde

		bsr	FadeOutCopper
		bsr	FreeBobs
		bsr	UnLoadLevel


		cmp.b	#DEMO_END,EndFlag(a6)
		beq	ReStart




		lea	NewKarteScreen(pc),a0
		bsr	OpenScreen
		move.l	d0,a3				* Screen
		lea	sc_Bitmap(A3),a0
		move.l	a0,ActBitmap(A6)


		move.l	#FN_KARTE,d0
		bsr	LoadPic


		move.l	a3,a0				* Screen
		lea	CMap,a1
		moveq	#125,d0
		lsl.w	#2,d0
		bsr	FadeIn				* Show Screen


		move.l	#FN_KARTEBOBS,d0
		SYSCALL	LoadFile
		move.l	d0,KarteBobBase(A6)		* Bobs laden

		lea	NewKarteBobs(pc),a1
		SYSCALL	AddBob				* Add Bobs
		move.l	d0,BobBase(A6)


		bsr	ShowWay				* Weg zeichnen
		bsr	WaitJoy

		cmp.b	#LEVEL_END,EndFlag(A6)		* Level beendet
		beq	.NextLevel			* Ja -->
		


		*** Game Over ***

		move.l	#25*50,d0			* Speed

		lea	OutOfTimeList(pc),a0
		cmp.b	#OUT_OF_TIME,EndFlag(A6)
		beq.s	.OutOfTime

		lea	OutOfList(pc),a0		* Liste

.OutOfTime:	bsr	HandlePaint

.GotoMenu:	move.l	#25*50,d0			* Speed
		lea	OverList(pc),a0			* Liste
		bsr	HandlePaint 

		bsr	WaitJoy				* Warten auf Godot

	IFND	DEMOONE
		cmp.b	#2,ContinueCnt(A6)
		bne.s	.EndKarte

		moveq	#0,d0
		bsr	EndShow
	ENDC

.EndKarte:	bsr	NewHiScore			* HiScore ?
		bsr	CleanUpKarte
		bra	ReStart

		*** Next Level ***

.NextLevel:	add.l	#LEVEL_TAB_SIZE,ActLevelPtr(A6)	* Next Level
		add.l	#WAY_TAB_SIZE,ActWayPtr(A6)	* Next Way

		SYSGET.B CheatFlag,d0
		beq.s	.NoCheat

		move.l	#99,Money(A6)
		move.b	#20,NumCubes(A6)

.NoCheat:	cmp.l	#99,Money(A6)
		bge.s	.EnoughMoney

		move.l	#25*50,d0			* Speed
		lea	MoneyList(pc),a0		* Liste
		bsr	HandlePaint
		bra	.GotoMenu

.EnoughMoney:	cmp.b	#20,NumCubes(A6)
		bge.s	.EnoughCubes

		move.l	#25*50,d0			* Speed
		lea	CubesList(pc),a0		* Liste
		bsr	HandlePaint
		bra	.GotoMenu

.EnoughCubes:	moveq	#32,d0				* Top Edge
		move.w	#190,d1				* Width
		moveq	#40,d2				* Heigth

		lea	CubeText(pc),a0			* Text
		lea	ConvertCubes(pc),a1		* Handler
		bsr	Message

.NoCubes:	move.l	ActLevelPtr(A6),a0
		tst.l	(A0)				* Noch ein Level da

	IFD	DEMOONE
		bra	.GotoMenu
	ENDC

		beq	.LastLevel			* Nein --> SpielEnde
;		bra	.LastLevel			* Nein --> SpielEnde

		addq.w	#1,ActLevel(A6)
		move.w	ActLevel(A6),d0			* Nächster Level

		cmp.w	HighLevel(A6),d0
		ble.s	.NoHighLevel

		move.w	d0,HighLevel(A6)

.NoHighLevel:	bsr	CheckJoy
		beq.s	.NoHighLevel

		move.l	ActWayPtr(A6),a0
		move.l	PTR_TEXT-WAY_TAB_SIZE(A0),a0
		move.l	a0,d0
		beq.s	.NoText
		move.w	(a0)+,d0			* TopEdge
		move.w	(A0)+,d1			* Width
		move.w	(a0)+,d2			* Height
		sub.l	a1,a1				* Handler
		bsr	Message				* Message ausgeben

.NoText:	bsr	CleanUpKarte

		bsr	NextLevelPic
		bra	NewLevel			* Nächster Level


***************************************************************************

.LastLevel:	movem.l	d0-d7/a0-a6,-(sp)
		move.b	#END_GAME,EndFlag(A6)		* SpielEnde
		moveq	#-1,d0
		bsr	EndShow
		movem.l	(sp)+,d0-d7/a0-a6
		bra	.EndKarte


***************************************************************************

EndShow:
	IFD	DEMOONE
		rts
	ELSEIF
		movem.l	d0-d7/a0-a6,-(sp)
		move.w	d0,d7				* Init 0=NoCont

		move.l	#FN_FINALBOBS,d0
		SYSCALL	LoadFile
		move.l	d0,FinalBobBase(A6)

		lea	EndScreen(pc),a0
		bsr	OpenScreen
		move.l	d0,a3				* A3=Screen


		move.l	#FN_FINAL,d0
		bsr	LoadPic

		move.l	a3,a0				* Screen
		lea	CMap,a1
		bsr	LoadRGB				* Show Screen



		move.l	a3,a0				* Screen

		moveq	#-4,d1				* Y-Value
		move.l	a3,a0
		move.w	#292/4-1,d2
		moveq	#0,d3
.ScrollUp:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen
		SYSCALL	GetKey

		dbf	d2,.ScrollUp

		lea	sc_Bitmap(A3),a0		* BitmStr
		SYSCALL	InitDrawBob			* Init BobRoutine

		lea	EndBob1(pc),a1
		SYSCALL	AddBob
		lea	EndBob2(pc),a1
		SYSCALL	AddBob
		lea	EndBob3(pc),a1
		SYSCALL	AddBob
		lea	EndBob4(pc),a1
		SYSCALL	AddBob
		lea	EndBob5(pc),a1
		SYSCALL	AddBob
		lea	EndBob6(pc),a1
		SYSCALL	AddBob

		clr.l	LevelX(A6)

.Wait:		bsr	DelayBlank
		moveq	#236/2,d0
		lsl.w	#1,d0
		bsr	RasterDelay			* Wait for RasterLine 150

		lea	sc_Bitmap(A3),a1
		SYSCALL	RestoreBobList

		lea	sc_Bitmap(A3),a1
		SYSCALL	DrawBobList
		
		addq.l	#1,LevelX(A6)
		cmp.l	#100,LevelX(A6)
		bne.s	.NoAddWindow

		lea	sc_Bitmap(a3),a1		* BitmStr
		lea	NewEndWindow(pc),a0		* MenuWindow
		lea	EndText2(pc),a4

		tst.b	d7
		bne	1$

		lea	NewEndWindow2(pc),a0		* MenuWindow
		lea	EndText1(pc),a4
1$:		bsr	OpenWindow			* Open it

		move.l	d0,a2				* A2=Window
		move.l	d0,a0				* Window
		move.l	a4,a1
		bsr	Text
		
.NoAddWindow:	SYSCALL	GetKey

		cmp.l	#150,LevelX(A6)
		blt.s	.Wait
		bsr	CheckJoy
		bne	.Wait


		neg.w	d1
		move.w	#292/4-1,d2
		move.l	a3,a0
.ScrollDown:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen
		
		SYSCALL	GetKey

		dbf	d2,.ScrollDown


		bsr	FreeBobs

		move.l	a2,a0
		bsr	CloseWindow

		move.l	a3,a0
		bsr	CloseScreen

		move.l	FinalBobBase(A6),a1
		SYSCALL	FreeMem

		movem.l	(sp)+,d0-d7/a0-a6
		rts



		CNOP	0,2

* Augenbrauen

EndBob1:	SETDATA		FinalBob0,WonderVars+FinalBobBase
		SETX		229
		SETY		133
		SETANIM		Anim1
		SETANIMSPEED	10
		SETFLAGS	BOBF_NORESTORE|BOBF_NODOUBLE
		ENDE

* Augen

EndBob2:	SETDATA		FinalBob2,WonderVars+FinalBobBase
		SETX		228
		SETY		140
		SETANIM		1$
		SETANIMSPEED	8
		SETFLAGS	BOBF_NORESTORE|BOBF_NODOUBLE
		ENDE

1$:		RNDDELAY	2,6
		dc.w		1,0
		LOOP


*Mund

EndBob3:	SETDATA		FinalBob4,WonderVars+FinalBobBase
		SETX		226
		SETY		165
		SETANIM		1$
		SETANIMSPEED	3
		SETFLAGS	BOBF_NORESTORE|BOBF_NODOUBLE
		ENDE

1$:		RNDDELAY	1,2
		dc.w		0,1,2,1
		LOOP


* Kaffeetasse

EndBob4:	SETDATA		FinalBob11,WonderVars+FinalBobBase
		SETX		304
		SETY		207
		SETANIM		1$
		SETANIMSPEED	6
		SETFLAGS	BOBF_NORESTORE|BOBF_NODOUBLE
		ENDE

1$:		ANIMTO		0,3
		LOOP


* Finger (klopft)

EndBob5:	SETDATA		FinalBob9,WonderVars+FinalBobBase
		SETX		223
		SETY		220
		SETANIM		Anim1
		SETANIMSPEED	4
		SETFLAGS	BOBF_NORESTORE|BOBF_NODOUBLE
		ENDE

* Daumen

EndBob6:	SETDATA		FinalBob7,WonderVars+FinalBobBase
		SETX		247
		SETY		207
		SETANIM		Anim1
		SETANIMSPEED	4
		SETFLAGS	BOBF_NORESTORE|BOBF_NODOUBLE
		ENDE

Anim1:		RNDDELAY	3,7
		dc.w		0,1
		LOOP

	ENDC

****************************************************************************

	IFD	TEST

Exit2:		sf.b	DemoFlag(A6)			* DemoEnde
		sf.b	FKeyFlag	

		bsr	DelayBlank			* Warten bis Copper kommt
		bsr	DelayBlank

		st.b	NoInt(a6)			* Int ausschalten
		bsr	FadeOutCopper
		bsr	FreeBobs
		bsr	UnLoadLevel

		move.w	ActLevel(A6),d0
		lea	LevelTab(pc),a0
		move.w	d0,d1
		mulu	#LEVEL_TAB_SIZE,d0
		add.l	d0,a0				* Which Level
		move.l	a0,ActLevelPtr(A6)		* Initiate Level
		lea	WayTab(pc),a0
		mulu	#WAY_TAB_SIZE,d1
		add.l	d1,a0
		move.l	a0,ActWayPtr(A6)		* Initiate Way

		bsr	LoadLevel			* Load Level
		bsr	CreateLevel			* Init Level
		bra	NewLevel

	ENDC

***************************************************************************

ShowWay:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	ActLevelPtr(A6),a1
		move.l	ActWayPtr(A6),a4
		move.l	PTR_WAYTAB(A4),a0
		lea	LevelWay(pc),a2

		moveq	#34,d0
		move.w	#232,d1
		moveq	#22,d2				* BobNummer

	******* Count ******

		moveq	#0,d3				* D3=Cnt
		moveq	#0,d4				* D4=Cnt

		move.l	a2,a1				* A1=Beginn des Wegs

.CntLoop:	cmp.l	a0,a1
		beq.s	.EndCnt

		addq.w	#1,d4
		lea	2(A1),a1
		bra.s	.CntLoop

.EndCnt:	addq.w	#1,d3
		lea	2(A1),a1

		cmp.b	#$10,(a1)			* Nächster Level
		bne.s	.EndCnt				* nein -->

		tst.w	LevelX(A6)			* Anfang ?
		bne.s	.NotNull			* Nein -->

.SetTwo:	moveq	#2,d3
		bra.s	.Completed

.NotNull:	cmp.b	#LEVEL_END,EndFlag(A6)
		beq.s	.Completed

		mulu	LevelX(A6),d3
		divu	SizeX(A6),d3			* Verhältniss
		lsr.w	#4,d3				* berechnen

.Completed:	add.w	d4,d3				* + Länge
		tst.w	d3
		beq	.SetTwo

		move.l	#360*100,d4			* Distanz
		divu	d3,d4				* berechnen
		ext.l	d4

		cmp.l	#400,d4				* zu langsam
		bls.s	.ShowIt				* nein -->

.NoZero:	move.w	#400,d4				* minimale Geschwindigkeit

.ShowIt:	subq.w	#1,d3

.ShowLoop:
.NoStart:	bsr	PaintBob			* Punkt zeichnen

.GetNext:	move.b	(A2)+,d5
		cmp.b	#$DF,d5
		beq.s	.End

		cmp.b	#$10,d5
		bne.s	.NoColChange

		move.b	(A2)+,d5
		ext.w	d5
		move.w	d5,d2
		bra.s	.EndLoop

.NoColChange:	ext.w	d5
		add.w	d5,d0				* X
		move.b	(A2)+,d5
		ext.w	d5
		add.w	d5,d1				* Y

		move.l	d0,-(sp)
		moveq	#0,d0
		move.w	d4,d0
		bsr	RasterDelay
		move.l	(sp)+,d0

.EndLoop:	dbf	d3,.ShowLoop

.End:		moveq	#0,d2
		move.b	BOB2(A4),d2

		bsr	PaintBob			* Ende
.End2:		movem.l	(sp)+,d0-d7/a0-a6
		rts


LevelWay:	****** Level 1 *****

Level1Way:	WAYCOLOR	22

		REPT		17
		 MOVEWAY	1,-1
		ENDR
		MOVEWAY		1,-2
		MOVEWAY		0,-1
		MOVEWAY		1,-1
		MOVEWAY		1,-1

		REPT		16
		 MOVEWAY	-1,-1
		ENDR

	****** Bus 1 *****

		WAYCOLOR	23

		MOVEWAY		0,-1
		MOVEWAY		0,-1
		REPT		9
		 MOVEWAY	-1,-1
		ENDR
		MOVEWAY		1,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		REPT		7
		 MOVEWAY	1,-1
		 MOVEWAY	0,-1
		ENDR
		REPT		10
		 MOVEWAY	1,-1
		ENDR

	****** Level 2 *****

Level2Way:	WAYCOLOR	22

		REPT		11
		 MOVEWAY	-1,-1
		 MOVEWAY	0,-1
		ENDR	

	****** Bus 2 *****

		WAYCOLOR	23


		MOVEWAY		0,-1
		REPT		9
		 MOVEWAY	1,-1
		 MOVEWAY	0,-1
		ENDR
		MOVEWAY		1,0
		REPT		38
		 MOVEWAY	1,-1
		ENDR

	****** Level 3 *****

Level3Way:	WAYCOLOR	22


		REPT		9
		 MOVEWAY	1,1
		ENDR
		REPT		9
		 MOVEWAY	1,0
		ENDR
		MOVEWAY		2,1
		MOVEWAY		1,0
		MOVEWAY		1,1
		MOVEWAY		1,0
		REPT		11
		 MOVEWAY	1,1
		ENDR

	****** Bus 3 *****

		WAYCOLOR	23

		REPT		4
		 MOVEWAY	0,1
		ENDR
		MOVEWAY		1,1
		REPT		3
		 MOVEWAY	0,1
		ENDR
		MOVEWAY		1,0
		MOVEWAY		1,1
		MOVEWAY		0,1
		MOVEWAY		1,1
		MOVEWAY		1,1
		MOVEWAY		1,2
		REPT		8
		 MOVEWAY	1,1
		ENDR

	****** Level 4 *****

Level4Way:	WAYCOLOR	22

		REPT		7
		 MOVEWAY	0,1
		ENDR
		REPT		5
		 MOVEWAY	-1,1
		 MOVEWAY	0,1
		ENDR

	****** Bus 4 *****

		WAYCOLOR	23

		REPT		6
		 MOVEWAY	1,1
		 MOVEWAY	0,1
		ENDR

		REPT		10
		 MOVEWAY	1,0
		ENDR
		REPT		6
		 MOVEWAY	0,1
		ENDR
		MOVEWAY		1,1
		REPT		8
		 MOVEWAY	0,1
		ENDR

	****** Level 5 *****

Level5Way:	WAYCOLOR	22

		REPT		23
		 MOVEWAY	1,0
		ENDR
		MOVEWAY		1,1
		REPT		4
		 MOVEWAY	1,0
		ENDR
		REPT		6
		 MOVEWAY	1,1
		ENDR
		REPT		13
		 MOVEWAY	1,0
		ENDR

	****** Bus 5 *****

		WAYCOLOR	23

		MOVEWAY		0,1
		REPT		5
		 MOVEWAY	1,1
		 MOVEWAY	0,1
		ENDR
		REPT		34
		 MOVEWAY	1,0
		ENDR
		MOVEWAY		0,1
		MOVEWAY		0,1
		REPT		6
		 MOVEWAY	1,1
		 MOVEWAY	0,1
		ENDR

	****** Level 6 *****

Level6Way:	WAYCOLOR	22

		MOVEWAY		1,-2
		MOVEWAY		1,0
		MOVEWAY		1,0
		MOVEWAY		1,0
		MOVEWAY		1,-1
		MOVEWAY		1,0
		REPT		6
		 MOVEWAY	1,-1
		ENDR
		MOVEWAY		1,0
		REPT		12
		 MOVEWAY	1,-1
		ENDR

	****** Bus 6 *****

		WAYCOLOR	23

		REPT		9
		 MOVEWAY	0,-1
		ENDR
		REPT		4
		 MOVEWAY	1,-1
		ENDR
		REPT		11
		 MOVEWAY	0,-1
		ENDR
		REPT		3
		 MOVEWAY	-1,-1
		ENDR

		MOVEWAY		0,-1
		MOVEWAY		1,0
		MOVEWAY		1,0
		MOVEWAY		1,0
		MOVEWAY		1,-1
		MOVEWAY		1,0
		MOVEWAY		1,0
		MOVEWAY		1,0
		MOVEWAY		1,-1
		MOVEWAY		1,0
		MOVEWAY		1,0
		MOVEWAY		1,-1
		MOVEWAY		1,0
		MOVEWAY		1,0

	****** Level 7 *****

Level7Way:	WAYCOLOR	22

		MOVEWAY		-2,-1
		REPT		22
		 MOVEWAY	-1,-1
		ENDR

	****** Bus 7 *****

		WAYCOLOR	23

		REPT		3
		 MOVEWAY	-1,-1
		ENDR

		MOVEWAY		0,-1
		MOVEWAY		-1,-1
		MOVEWAY		-1,-1
		MOVEWAY		0,-1
		MOVEWAY		-1,-1
		MOVEWAY		-1,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		REPT		5
		 MOVEWAY	1,-1
		ENDR
		MOVEWAY		2,-1
		MOVEWAY		1,0
		MOVEWAY		1,-1
		MOVEWAY		1,-1

	****** Level 8 *****

Level8Way:	WAYCOLOR	22

		REPT		26
		 MOVEWAY	1,0
		ENDR
		MOVEWAY		1,-1
		MOVEWAY		1,0
		MOVEWAY		1,-1
		MOVEWAY		2,-1
		MOVEWAY		1,-1
		MOVEWAY		1,-1
		MOVEWAY		1,0
		MOVEWAY		1,-1
		MOVEWAY		1,-1
		MOVEWAY		1,-1

	****** Bus 8 *****

		WAYCOLOR	23

		MOVEWAY		1,0
		MOVEWAY		2,-1
		MOVEWAY		1,0

		REPT		6
		 MOVEWAY	1,-1
		 MOVEWAY	1,0
		ENDR

	****** Level 9 *****

Level9Way:	WAYCOLOR	22

		MOVEWAY		1,-1
		REPT		29
		 MOVEWAY	0,-1
		ENDR
		REPT		4
		 MOVEWAY	1,0
		ENDR

		REPT		4
		 MOVEWAY	0,-1
		 MOVEWAY	1,-1
		ENDR
		
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		-1,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		-1,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		-1,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		-1,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		-1,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		-1,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		0,-1
		MOVEWAY		1,-1
		MOVEWAY		0,-1
		MOVEWAY		1,-1
		MOVEWAY		0,-1
		MOVEWAY		1,-1
		MOVEWAY		1,-1
		MOVEWAY		0,-1
		MOVEWAY		1,-1
		MOVEWAY		1,-1
		MOVEWAY		1,-1
.LevelWayEnd:

		dc.b		$DF

		CNOP	0,2


WayTab:		dc.l	Level1Way
		dc.l	Level1Txt
		dc.b	1,1,0,0
		dc.l	Level2Way
		dc.l	Level2Txt
		dc.b	3,3,12,0
		dc.l	Level3Way
		dc.l	Level3Txt
		dc.b	1,1,13,0
		dc.l	Level4Way
		dc.l	Level4Txt
		dc.b	1,1,14,0
		dc.l	Level5Way
		dc.l	Level5Txt
		dc.b	1,1,15,0
		dc.l	Level6Way
		dc.l	Level6Txt
		dc.b	1,1,16,0
		dc.l	Level7Way
		dc.l	Level7Txt
		dc.b	1,1,16,0
		dc.l	Level8Way
		dc.l	Level8Txt
		dc.b	1,1,16,0
		dc.l	Level9Way
		dc.l	0		;Level9Txt
		dc.b	2,2,16,0


OverList:	dc.w	60,60,4
		dc.w	65,65,5
		dc.w	72,72,6	
		dc.w	82,82,7
		dc.w	94,94,8
		dc.w	112,112,9
		dc.w	112,112,10
		dc.w	112,112,9
		dc.w	112,112,10
		dc.w	112,112,9
		dc.w	112,112,10
		dc.w	112,112,9
		dc.w	112,112,10
		dc.w	112,112,9
		dc.w	112,112,10
		dc.w	112,112,9
		dc.w	112,112,10
		dc.w	-1

OutOfList:	dc.w	240,130,4
		dc.w	240,130,5
		dc.w	240,130,6
		dc.w	240,130,7
		dc.w	240,130,8
		dc.w	240,130,9
		dc.w	240,130,20
		dc.w	-1

OutOfTimeList:	dc.w	240,130,4
		dc.w	240,130,5
		dc.w	240,130,6
		dc.w	240,130,7
		dc.w	240,130,8
		dc.w	240,130,9
		dc.w	240,130,21
		dc.w	-1

MoneyList:	dc.w	240,130,4
		dc.w	240,130,5
		dc.w	240,130,6
		dc.w	240,130,7
		dc.w	240,130,8
		dc.w	240,130,9
		dc.w	240,130,17
		dc.w	240,130,19
		dc.w	-1

CubesList:	dc.w	240,130,4
		dc.w	240,130,5
		dc.w	240,130,6
		dc.w	240,130,7
		dc.w	240,130,8
		dc.w	240,130,9
		dc.w	240,130,17
		dc.w	240,130,18
		dc.w	-1

WayList:	dc.w	190,120,4
		dc.w	190,120,5
		dc.w	190,120,6
		dc.w	190,120,7
		dc.w	190,120,8
		dc.w	190,120,9
		dc.w	190,120,11
WayList2:	dc.w	190,120,12
		dc.w	-1

*********************************************************************************

CleanUpKarte:	move.l	a3,a0				* Screen
		moveq	#125,d0
		lsl.w	#2,d0
		bsr	FadeOut
		bsr	CloseScreen
		move.l	BobBase(a6),a1
		SYSCALL	FreeMem				* Free BobStructure
		move.l	KarteBobBase(a6),a1
		SYSCALL	FreeMem				* Free BobStructure
		rts


*********************************************************************************
* A0=List  A3=Screen
* D0=Delay
****************************************************************************

HandlePaint:	movem.l	d0-d3,-(sp)
		move.l	d0,d3

.Loop:		move.w	(A0)+,d0
		cmp.w	#-1,d0
		beq.s	.End
		move.w	(A0)+,d1
		move.w	(A0)+,d2

		bsr	PaintBob

		move.l	d3,d0
		bsr	RasterDelay
		bra.s	.Loop

.End:		movem.l	(sp)+,d0-d3
		rts


*********************************************************************************
* A3=Screen
* D0=X   D1=Y  D2=Image
****************************************************************************

PaintBob:	movem.l	a0-a1,-(sp)
		move.l	BobBase(A6),a0
		move.w	d0,bob_X(A0)
		move.w	d1,bob_Y(A0)
		move.w	d2,bob_Image(A0)
		lea	sc_Bitmap(A3),a1		* BitmStr
		SYSCALL	DrawOneBob			* Paint Bob
		movem.l	(sp)+,a0-a1
		rts


******************************************************************************

NextLevelPic:	movem.l	d0-d7/a0-a6,-(sp)

		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		move.l	#120*1024,d0
		SYSCALL	AllocMem			* Speicher reservieren
		move.l	d0,a4				* um später speicher nicht
							* zu verstückeln
		lea	NewBusScreen(pc),a0
		bsr	OpenScreen
		move.l	d0,a3				* A3=HowToPlayScreen

		move.l	a4,a1
		SYSCALL	FreeMem				* And FreeIt


		move.l	#FN_BUS,d0
		bsr	LoadPic


		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC


		lea	BusFahrt(pc),a0
		moveq	#3,d0		
		bsr	PlayFX


		move.l	a3,a0				* Screen
		lea	CMap,a1
		moveq	#125,d0
		lsl.w	#2,d0
		bsr	FadeIn				* Show Screen


		st.b	CycleFlag(a6)			* Enable ColorCycling

		move.l	VBCounter(a6),d6
		add.l	#50*5,d6			* 5 Sec

.Wait:		cmp.l	VBCounter(a6),d6
		ble.s	.Cont

		SYSCALL GetKey

		bsr	CheckJoy
		bne.s	.Wait				* Loop -->


.Cont:		clr.b	CycleFlag(a6)			* Cycling off

		move.l	a3,a0
		moveq	#125,d0
		lsl.w	#2,d0
		bsr	FadeOut				* Fade Out

		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		move.l	a3,a0
		bsr	CloseScreen

		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		bsr	LoadLevel			* Load Level and Init
		bsr	CreateLevel

		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC


		movem.l	(sp)+,d0-d7/a0-a6
		rts


******************************************************************************

HauptLader:
	IFD	INTRO
		move.l	MenuWindow(A6),a1		* Speicher Block
		SYSCALL	FreeMem				* freigeben
	ENDC
		lea	WonderVars,a6

		move.l	#FN_RONNYBOB,d0
		SYSCALL	LoadFile
		lea	MyNewBob+2(pc),a0
		move.l	d0,(A0)				* RonnyBob

		move.l	#FN_IMMERBOBS,d0
		SYSCALL	LoadFile
		move.l	d0,ImmerBobBase(A6)		* ImmerBobs

		bsr	LoadFont			* Load Font
		bsr	LoadPanel			* Load Panel
		bsr	InitClouds

		clr.l	FXBase(A6)
		tst.b	LowMemFlag(A6)
		bne.s	.LowMem

		move.l	#FN_SOUNDFX,d0
		SYSCALL	LoadFile
		move.l	d0,FXBase(A6)			* Load SoundFX's

.LowMem:	bra	ShortDelay


******************************************************************************

ColorCycle:	movem.l	d0-d7/a0-a6,-(sp)

		move.l	GfxBase+gfx_ViewCpr,a0
1$:		cmp.w	#color+2,(a0)+			* ColorMap suchen
		bne	1$

		lea	-4(a0),a0

	;;	lea	cpr_Colors+2(a0),a0		* CopperColorMap
		lea	CycleTab,a4
		
		move.l	a0,a1				* CMap

.CycleLoop:	cmp.w	#-1,(A4)
		beq.s	.LastEntry			* yes -->

		addq.b	#1,(A4)				* Inc Cnt
		move.b	(A4),d0				* D0=Cnt
		cmp.b	1(A4),d0			* Speed
		bne.s	.NextEntry

		clr.b	(A4)				* Clr Cnt

		move.w	2(A4),d1			* StartCol
		move.w	4(A4),d2			* EndCol

		move.w	d2,d3
		sub.w	d1,d3
		subq.w	#1,d3				* NumCols (dbf)

		lsl.w	#2,d1				* StartCol
		lsl.w	#2,d2				* EndCol
		move.w	d1,d6				* StartCol

		move.w	(A1,d2.w),d4			* Last Color

.Loop:		move.w	-4(A1,d2.w),d5
		move.w	d5,(A1,d2.w)
		subq.w	#4,d2
		dbf	d3,.Loop

		move.w	d4,(A1,d6.w)			* Last->First Color

.NextEntry:	lea	6(A4),a4
		bra.s	.CycleLoop

.LastEntry:	movem.l	(sp)+,d0-d7/a0-a6
		rts


CycleTab:	dc.w	10,2,6
		dc.w	10,7,11
		dc.w	8,29,31
		dc.w	10,12,14
		dc.w	10,15,17
		dc.w	9,18,19
		dc.w	-1



***************************************************************************

ReachedBusStop:	lea	WonderVars,a6
		move.b	#LEVEL_END,EndFlag(A6)
		rts



***************************************************************************

ConvertCubes:	move.b	NumCubes(A6),d4			* Cubes
		move.b	d4,d5
		subq.b	#1,d5
		moveq	#0,d6
		bra.s	.First

.Loop:		moveq	#5,d7
.Delay:		bsr	DelayBlank
		dbf	d7,.Delay			* Delay

.First:		add.l	#300,d6				* Increase Score

		moveq	#16,d0
		bsr	SetAPen

		moveq	#124,d0
		moveq	#16,d1
		moveq	#46,d2
		moveq	#19,d3
		bsr	RectFill

		lea	CubeText2(pc),a1
		lea	Para(A6),a2
		moveq	#0,d0
		move.b	d5,d0
		move.l	d0,(A2)
		move.l	d6,4(A2)
		bsr	Print				* Text

		bsr	UpDatePanel

		subq.b	#1,d5
		subq.b	#1,d4
		bne.s	.Loop

		add.l	d6,Score(A6)
		bra	PressButton



***************************************************************************

PressButton:	moveq	#90,d0
		move.w	#224,d1
		moveq	#28,d2
		lea	PressTxt(pc),a0
		sub.l	a1,a1
		bra	Message


***************************************************************************

Delay2Blanks:	move.l	d1,-(sp)
		move.l	VBCounter(A6),d1
		sub.l	OldVBCounter(A6),d1

		cmp.w	#2,d1
		bge.s	2$

		moveq	#2,d1

2$:		move.l	OldVBCounter(a6),d0		* Current VBCnt
		add.w	d1,d0
1$:		cmp.l	VBCounter(a6),d0		* didn't changed
		bgt.s	1$				* yet -->

		move.l	VBCounter(A6),OldVBCounter(A6)

		bsr	DelayBlank
		move.l	(sp)+,d1
		rts
		

****************************************************************************
* D0 = TopEdge
* D1 = Width
* D2 = Height
****************************************************************************

CreateWindow:	move.l	ActBitmap(A6),a1		* Screen
		lea	MsgWindow(pc),a0

		move.b	#16,nw_BPen(A0)

		tst.b	GameFlag(A6)
		beq.s	.NoGame

		move.b	#15,nw_BPen(A0)

.NoGame:	move.w	d0,nw_TopEdge(A0)
		move.w	d1,nw_Width(A0)
		move.w	d2,nw_Height(A0)
		bsr	CalcEdge			* Left Edge

		bsr	OpenWindow
		move.l	d0,a0
		rts


****************************************************************************

CalcEdge:	cmp.l	#ViewBitmStr,ActBitmap(A6)	* GameScreen
		beq.s	2$				* ja -->

		move.w	#352,d0				* ScreenBreite
		sub.w	nw_Width(A0),d0			* -WindowBreite
		asr.w	#1,d0				* /2
		
		bra	1$

2$:		move.w	#320+64,d0			* ScreenBreite
		sub.w	nw_Width(A0),d0			* -WindowBreite
		asr.w	#1,d0				* /2
		add.w	LevelX(A6),d0

1$:		move.w	d0,nw_LeftEdge(A0)		* = Linke Ecke
		rts


****************************************************************************
* D0 = TopEdge
* D1 = Width
* D2 = Height
* A0 = Text
* A1 = Handler (wenn 0 = WaitJoy)
****************************************************************************

Message:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	a0,a2
		move.l	a1,a3

		bsr	CreateWindow			* Window öffnen

		moveq	#24,d0
		bsr	SetAPen				* APen setzen

		move.l	a2,d0				* Text
		beq.s	.NoText				* keiner -->

		move.l	a2,a1
		bsr	Text

.NoText:	move.l	a3,d0
		beq.s	.JoyHandler

		bsr	UpDatePanel

		movem.l	d0-d7/a0-a6,-(sp)

		jsr	(A3)

		movem.l	(sp)+,d0-d7/a0-a6
		bra.s	.NoHandler

.JoyHandler:	bsr	WaitJoy
	
.NoHandler:	moveq	#100,d0
		lsl.l	#1,d0
		bsr	WaitRaster

		bsr	CloseWindow
		movem.l	(sp)+,d0-d7/a0-a6
		rts


****************************************************************************
* VBlank Interrupt
****************************************************************************

IntHandler:	movem.l	d0-d7/a0-a6,-(sp)
		lea	custom,a5			* CustomBase
		lea	WonderVars,a6			* My Vars

		addq.l	#1,VBCounter(a6)		* Increase VBCounter
		addq.b	#1,JumpCnt(A6)

.NoMain:	tst.b	NoKeyFlag(A6)			* Main is asking for KEY
		bne	.NoKey				* -->

		SYSGET.B ActualASCIIKey,d0
		cmp.b	#'m',d0				* Musik
		bne.s	.NoMusicToggle			* ein-/ausschalten

		not.b	MusicFlag(A6)
		move.w	#$F,dmacon(A5)			* Sound DMA aus

		SYSCALL	FlushKeyBuf
		SYSPUT.B #0,ActualASCIIKey

.NoMusicToggle:	cmp.b	#'s',d0				* SoundEffekte
		bne.s	.NoFxToggle			* ein-/ausschalten

		not.b	FxFlag(A6)

		SYSCALL	FlushKeyBuf
		SYSPUT.B #0,ActualASCIIKey

.NoFxToggle:	cmp.b	#' ',d0
		bne.s	.NoKey

		SYSCALL	FlushKeyBuf
		SYSPUT.B #0,ActualASCIIKey

		move.w	#$4000,intena(A5)
		
		bsr	WaitJoy

		move.w	#$c000,intena(A5)

.NoKey:		tst.b	NoInt(a6)
		bne.s	.NoInt
	
		tst.l	GameTimer(A6)
		beq.s	.NotZero

		nop

	IFND	POSITION
		subq.l	#1,GameTimer(A6)
	ENDC

.NotZero:	bsr	SoftScroll			* Scroll
		bsr	SetClouds			* Wolken Scrollen

.NoInt:		tst.b	MusicFlag(a6)
		bne.s	.NoSound

		bsr	MusicVBL			* MusicPlayer

.NoSound:	tst.b	CycleFlag(A6)
		beq.s	.NoCycle

		bsr	ColorCycle
		nop
.NoCycle:
	IFD	FREEZE
		bra.s	.fdfd
	ENDC
		SYSGET.B CheatFlag,d0
		beq.s	.fdfd

		clr.w	FallingDist(A6)
		move.w	#12,NoCollisionTimer(A6)
.fdfd:
.NoVBlank:	movem.l	(sp)+,d0-d7/a0-a6
		rts



****************************************************************************

CopperInt:	movem.l	d0-d7/a0-a6,-(sp)
		lea	WonderVars,a6
		lea	custom,a5

		tst.b	NoInt(A6)
		bne.s	.NoInt

		bsr	NewMoveMyBob			* Move my Bob
		bsr	SetLaterne
		bsr.s	SpriteHandler

		bsr	CountShop
		bsr	CountCollision
		bsr	StopBob
		bsr	SneezeBob
		bsr	CollectBobs

.NoInt:		movem.l	(sp)+,d0-d7/a0-a6
		rts


****************************************************************************

SpriteHandler:	movem.l	d0-d7/a0-a5,-(sp)

		move.l	MyBob(A6),a0			* MyBob
		move.l	a0,d0
		beq	.NoBob

		movem.l	d0-d7/a0-a6,-(sp)
		tst.b	SturzFlag(A6)
		bne.s	.Animate
		tst.b	WalkFlag(A6)
		beq.s	.Animate

		tst.b	HimmelFlag(A6)
		bne.s	.MoveIt
		tst.b	DirX(A6)			* Wurde Bob bewegt
		beq.s	.NoAnimate			* Nein --> Keine Animation

.Animate:	lea	WonderVars,a6
		move.l	MyBob(A6),a0
		SYSCALL	AnimateOneBob			* Let's Animate
.MoveIt:	lea	WonderVars,a6
		move.l	MyBob(A6),a0
		SYSCALL	MoveOneBob			* Let's Move
.NoAnimate:	movem.l	(sp)+,d0-d7/a0-a6

		move.w	bob_Image(a0),d2
		lsl.w	#2,d2
		lea	bob_AnimPtrs(a0),a2
		move.l	(a2,d2.w),a2
		move.l	a2,a5

		move.w	bod_CollX0(A2),bob_CollX0(A0)
		move.w	bod_CollX1(A2),bob_CollX1(A0)
		move.w	bod_CollY0(A2),bob_CollY0(A0)
		move.w	bod_CollY1(A2),bob_CollY1(A0)	* CollisionRectangle

		move.w	bod_Height(A2),d2
		lea	bod_Images(A2),a1		* A1=Planes		
	
		move.l	ShowSpr(A6),a4			* SpriteData to draw in

		lea	0*(36*4)+4(A4),a2
		lea	2*(36*4)+4(A4),a3		
		bsr	CopyMap
		lea	0*(36+4)+6(A4),a2
		lea	2*(36*4)+6(A4),a3		
		bsr	CopyMap

		lea	1*(36*4)+4(A4),a2
		lea	3*(36*4)+4(A4),a3		
		bsr	CopyMap
		lea	1*(36*4)+6(A4),a2
		lea	3*(36*4)+6(A4),a3		
		bsr	CopyMap

		move.l	a5,a2
		move.w	bob_X(A0),d0			* X-Pos
		move.w	bob_Y(A0),d1			* Y-Pos
		sub.w	bod_X0(A2),d0			* D0=X-Pos (Pixel)
		sub.w	bod_Y0(A2),d1			* D1=Y-Pos (Pixel)
		sub.w	LevelX(A6),d0
		add.w	#$81-16-16,d0			* D0=X-Pos (Sprite)
		add.w	#$4C-2,d1			* D1=Y-Pos (Sprite)
		move.w	d1,d2
		add.w	#32,d2				* D2=EndY-Pos (Sprite)

		cmp.w	#20,d1
		bgt	.DontShow

		clr.l	(A4)
		clr.l	1*(36*4)(A4)
		clr.l	2*(36*4)(A4)
		clr.l	3*(36*4)(A4)
		bra	.EndShow

.DontShow:	move.l	a4,a0				* Sprite
		bsr	SetSprPos

		lea	1*(36*4)(A4),a0
		or.b	#$80,3(A0)
		bsr	SetSprPos

		add.w	#16,d0
		lea	2*(36*4)(A4),a0
		bsr	SetSprPos

		lea	3*(36*4)(A4),a0
		or.b	#$80,3(A0)
		bsr	SetSprPos

.EndShow:	bsr	SetMySprite

.NoBob:		movem.l	(sp)+,d0-d7/a0-a5
		rts




DrawRonny:	movem.l	d0-d7/a0-a6,-(sp)

		move.l	MyBob(A6),a0			* MyBob
		move.w	bob_Image(a0),d2
		lsl.w	#2,d2
		lea	bob_AnimPtrs(a0),a2
		move.l	(a2,d2.w),a2
		move.l	a2,a5

		move.w	bod_CollX0(A2),bob_CollX0(A0)
		move.w	bod_CollX1(A2),bob_CollX1(A0)
		move.w	bod_CollY0(A2),bob_CollY0(A0)
		move.w	bod_CollY1(A2),bob_CollY1(A0)	* CollisionRectangle

		move.w	bod_Height(A2),d2
		lea	bod_Images(A2),a1		* A1=Planes		
	
		move.l	ShowSpr(A6),a4			* SpriteData to draw in

		lea	0*(36*4)+4(A4),a2
		lea	2*(36*4)+4(A4),a3		
		bsr	CopyMap
		lea	0*(36+4)+6(A4),a2
		lea	2*(36*4)+6(A4),a3		
		bsr	CopyMap

		lea	1*(36*4)+4(A4),a2
		lea	3*(36*4)+4(A4),a3		
		bsr	CopyMap
		lea	1*(36*4)+6(A4),a2
		lea	3*(36*4)+6(A4),a3		
		bsr	CopyMap

		movem.l	(sp)+,d0-d7/a0-a6
		rts



****************************************************************************

SetLaterne:	movem.l	d0-d2/a0,-(sp)
		moveq	#100,d0
		lsl.w	#1,d0
		sub.w	LevelX(A6),d0
		add.w	#$81-16-16,d0			* D0=X-Pos (Sprite)
		
		move.l	ActLevelPtr(A6),a0
		move.w	PTR_CLOUDFLAGS(A0),d1
		btst	#CLB_AUTOMOVE,d1
		bne.s	.SetSprite

		moveq	#$10,d0

.SetSprite:	move.w	#135,d1
		move.l	d1,d2
		add.w	#115,d2
		lea	Laterne1,a0
		bsr	SetSprPos
		lea	Laterne2,a0
		or.b	#$80,3(A0)
		bsr	SetSprPos

		clr.w	$174(A5)
		clr.w	$176(A5)
		clr.w	$17C(A5)
		clr.w	$17E(A5)

		movem.l	(sp)+,d0-d2/a0
		rts


****************************************************************************

CopyMap:	move.w	d2,d1
		moveq	#33,d3

		tst.w	NoCollisionTimer(A6)
		beq.s	.EndCopy

		btst	#1,NoCollisionTimer+1(A6)
		bne.s	.Clear

		bra.s	.EndCopy

.Copy:		move.w	(A1)+,(A2)
		move.w	(A1)+,(A3)
		lea	4(A2),a2
		lea	4(A3),a3
		subq.w	#1,d3
.EndCopy:	dbf	d1,.Copy

.Clear:		clr.w	(A2)
		clr.w	(A3)
		lea	4(A2),a2
		lea	4(A3),a3
		dbf	d3,.Clear			* Rest löschen
		rts


****************************************************************************

CountShop:	tst.b	ShopTimer(A6)
		beq.s	.NoCount

		subq.b	#1,ShopTimer(A6)

.NoCount:	rts


****************************************************************************

CountCollision:	tst.w	NoCollisionTimer(A6)
		beq.s	.NoCount
		subq.w	#1,NoCollisionTimer(A6)
.NoCount:	rts


****************************************************************************

StopBob:	tst.w	ParalizeTimer(A6)
		beq.s	.NoParalizing

		subq.w	#1,ParalizeTimer(A6)

		cmp.w	#1,ParalizeTimer(A6)
		bne.s	.NoParalizing

		movem.l	a0-a6,-(sp)
		SYSLEA	BobList,a0
.MainBobLoop:	move.l	bob_NextBob(A0),a0
		tst.l	bob_NextBob(A0)			* A0=Kollision
		beq.s	.EndMainLoop			* auslösendes Bob

		move.w	bob_UserFlags(A0),d0
		btst	#BOBB_ENEMY,d0			* Only EnemyBobs
		beq.s	.MainBobLoop			* none -->
				
		and.w	#~(BOBF_NOMOVE|BOBF_NOANIM),bob_Flags(A0)

		bra.s	.MainBobLoop

.EndMainLoop:	movem.l	(sp)+,a0-a6

.NoParalizing:	rts


****************************************************************************

ParalizeThem:	movem.l	d0-d7/a0-a6,-(sp)
		SYSLEA	BobList,a0
.MainBobLoop:	move.l	bob_NextBob(A0),a0
		tst.l	bob_NextBob(A0)			* A0=Kollision
		beq.s	.EndMainLoop			* auslösendes Bob

		move.w	bob_UserFlags(A0),d0
		btst	#BOBB_ENEMY,d0			* Only EnemyBobs
		beq.s	.MainBobLoop			* none -->

		or.w	#BOBF_NOMOVE|BOBF_NOANIM,bob_Flags(A0)

		bra.s	.MainBobLoop

.EndMainLoop:	movem.l	(sp)+,d0-d7/a0-a6
		rts


*****************************************************************************

SneezeBob:	tst.b	PowerSneeze(a6)
		beq.s	.NoSneeze

		movem.l	d0-d7/a0-a2,-(sp)
		SYSLEA	BobList,a0
.MainBobLoop:	move.l	bob_NextBob(A0),a0
		tst.l	bob_NextBob(A0)			* A0=Kollision
		beq.s	.EndMainLoop			* auslösendes Bob

		move.w	bob_UserFlags(A0),d0
		btst	#BOBB_ENEMY,d0			* Only EnemyBobs
		beq.s	.MainBobLoop			* none -->

		bsr	ShootColl2			* Delete one Bob

		bra.s	.MainBobLoop

.EndMainLoop:	clr.b	PowerSneeze(A6)			* No more sneezing
		movem.l	(sp)+,d0-d7/a0-a2
.NoSneeze:	rts


*****************************************************************************

CollectBobs:	tst.b	CollectFlag(a6)
		beq.s	.NoCollect

		movem.l	d0-d7/a0-a2,-(sp)
		SYSLEA	BobList,a1
.MainBobLoop:	move.l	bob_NextBob(A1),a1
		tst.l	bob_NextBob(A1)			* A0=Kollision
		beq.s	.EndMainLoop			* auslösendes Bob

		move.w	bob_UserFlags(A1),d0
		btst	#BOBB_COLLECTABLE,d0		* Only Collectable Bobs
		beq.s	.MainBobLoop			* none -->

		move.l	bob_CollHandler(A1),d0		* CollHandler
		move.l	d0,a0				* exists
		beq.s	.MainBobLoop			* No -->

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	(A0)				* Jump to CollHandler
		movem.l	(sp)+,d0-d7/a0-a6

		bra.s	.MainBobLoop

.EndMainLoop:	clr.b	CollectFlag(A6)			* No more sneezing
		movem.l	(sp)+,d0-d7/a0-a2
.NoCollect:	rts


*****************************************************************************

HandleEnemyList:
		movem.l	d0-d3/a0-a1,-(sp)
		move.w	LevelX(A6),d1			* Actual X-Position

		tst.b	DirX(A6)			* Bewegung
		beq	.NoMatch			* keine -->
		bpl	.Right				* Rechts

.Left:		move.l	LEnemyListPtr(a6),a0		* Ptr to EnemyList
		move.w	sb_XPos(A0),d3			* Next XPos
		move.w	sb_YPos(A0),d2
		cmp.w	#-30000,d3			* kommt da nichts mehr ?
		beq.s	.NoMatchLeft			* Ja -->

		add.w	#368,d3
		cmp.w	d3,d1				* Time to add new Bob
		bgt.s	.NoMatchLeft			* no -->

		sub.l	#sb_SIZEOF,LEnemyListPtr(a6)	* Ptr to next entry

		move.b	sb_BobLeft(A0),d0		* A1=BobStructure
		ext.w	d0
		beq.s	.NoMatchLeft			* -->

		lea	sb_Flags(A0),a2			* Flags
		btst	#SBB_VISIBLE,1(A2)		* Bob on screen
		bne.s	.Left				* Don't add second time

		bset	#SBB_VISIBLE,1(A2)

		bsr	MyAddBob			* Add this Bob
		move.l	d0,a1

		move.l	a2,bob_UserDataPtr(a1)		* Flags
		clr.w	bob_ClipX(A1)
		clr.w	bob_ClipY(A1)
		clr.w	bob_ClipX2(A1)
		clr.w	bob_ClipY2(A1)
		move.w	#CLIPF_ALL,bob_ClipFlags(A1)

		add.w	d3,bob_X(a1)			* XPos relativ to LevelX
		move.w	d2,bob_Y(A1)

.NoMatchLeft:	move.l	REnemyListPtr(A6),a0
		move.w	-sb_SIZEOF(a0),d3		* Letzte X-Koordinate
		cmp.w	d1,d3
		blt	.NoMatch
		
		sub.l	#sb_SIZEOF,REnemyListPtr(A6)	* Erniedrigen, da wir nach
		bra.s	.NoMatchLeft			* links gelaufen sind

.Right:		move.l	REnemyListPtr(a6),a0		* Ptr to EnemyList
		move.w	sb_XPos(A0),d3			* Next XPos
		move.w	sb_YPos(A0),d2
		cmp.w	d1,d3				* Time to add new Bob
		bgt.s	.NoMatchRight			* no -->

		add.l	#sb_SIZEOF,REnemyListPtr(a6)	* Ptr to next entry

		move.b	sb_BobRight(A0),d0		* A1=BobStructure
		ext.w	d0
		beq.s	.NoMatchLeft			* -->

		lea	sb_Flags(A0),a2			* Flags
		btst	#SBB_VISIBLE,1(A2)		* Bob on screen
		bne.s	.Right				* don't add second time

		bset	#SBB_VISIBLE,1(A2)

		bsr	MyAddBob			* Add this Bob
		move.l	d0,a1

		move.l	a2,bob_UserDataPtr(a1)		* Flags

		clr.w	bob_ClipX(A1)
		clr.w	bob_ClipY(A1)
		clr.w	bob_ClipX2(A1)
		clr.w	bob_ClipY2(A1)
		move.w	#CLIPF_ALL,bob_ClipFlags(A1)

		add.w	d3,bob_X(a1)			* XPos relativ to LevelX
		add.w	#368,bob_X(A1)			* Left Border
		move.w	d2,bob_Y(A1)

.NoMatchRight:	move.l	LEnemyListPtr(A6),a0
		move.w	sb_SIZEOF(a0),d3		* Letzte X-Koordinate
		sub.w	#368,d1
		cmp.w	d1,d3
		bgt.s	.NoMatch
		
		add.l	#sb_SIZEOF,LEnemyListPtr(A6)	* Erniedrigen, da wir nach
		bra.s	.NoMatchRight			* rechts gelaufen sind

.NoMatch	movem.l	(sp)+,d0-d3/a0-a1
		rts


****************************************************************************

HandleRemove:	movem.l	d0-d2/a0-a1,-(sp)
		SYSLEA	BobList,a0
.BobLoop:	move.l	bob_NextBob(A0),a0		* Next Bob
		tst.l	bob_NextBob(A0)			* A0=Kollision
		beq.s	.EndList			* No more Bobs -->

		move.w	bob_UserFlags(A0),d2
		btst	#BOBB_REMOVE,d2			* Can remove this Bob
		beq.s	.BobLoop			* no -->

		move.w	bob_AbsX(A0),d0
		move.w	LevelX(a6),d1
		move.w	d1,d2
		add.w	#368+16,d2

		cmp.w	d0,d1
		bgt.s	.RemIt
		cmp.w	d0,d2
		bgt.s	.BobLoop

.RemIt:		bsr.s	CommonRemBob
		bra.s	.BobLoop

.EndList:	movem.l	(sp)+,d0-d2/a0-a1
		rts


****************************************************************************
* A0=Bob
****************************************************************************

CommonRemBob:	movem.l	d0/a0-a1,-(sp)

		move.l	bob_UserDataPtr(a0),a1		* Flags aus LevelListe
		move.l	a1,d0
		beq.s	1$

		btst	#SBB_ONCE,1(A1)			* OnceFlag
		bne.s	1$				* ja -->
		bclr	#SBB_VISIBLE,1(A1)		* VisibleFlag löschen

1$:		SYSCALL	RemBob

		movem.l	(sp)+,d0/a0-a1
		rts


****************************************************************************
* A0=Bob
****************************************************************************

CommonRemBobTest:
		movem.l	d0/a0-a2,-(sp)

		move.l	bob_UserDataPtr(a0),a1		* Flags aus LevelListe
		move.l	a1,d0
		beq.s	1$

		btst	#SBB_ONCE,1(A1)			* OnceFlag
		bne.s	1$				* ja -->
		bclr	#SBB_VISIBLE,1(A1)		* VisibleFlag löschen

1$:		movem.l	(sp)+,d0/a0-a2
		rts



****************************************************************************
* D0=Bob
****************************************************************************

MyAddBob:	movem.l	d1/a0-a2,-(sp)

		move.l	LevelBobTab(A6),a2		* BobConversionTab
		lsl.w	#2,d0				* LONG's
		move.l	(A2,d0.w),a1			* Ptr to Bob

		SYSCALL	AddBob
		move.l	d0,a0

		tst.w	ParalizeTimer(a6)		* Paralize
		beq.s	.NoParalize			* no -->
		
		move.w	bob_UserFlags(A0),d1
		btst	#BOBB_ENEMY,d1
		beq.s	.NoParalize

		or.w	#BOBF_NOANIM|BOBF_NOMOVE,bob_Flags(A0)

.NoParalize:	movem.l	(sp)+,d1/a0-a2
		rts


****************************************************************************

FallHandler:	cmp.w	#RONNY_HITCOLL,bob_HitMask(a0)
		bne.s	SturzHandler

		lea	WonderVars,a6
		moveq	#1,d0
		moveq	#24,d1
		SYSCALL	FlashBob

		moveq	#-1,d0				* Sub Health
		bsr	ChangeHealth
		rts


****************************************************************************

SturzHandler:	lea	WonderVars,a6
		st.b	SturzFlag(A6)

		move.l	MyBob(A6),a0			* Bob
		lea	FallAnimLeft(pc),a1		* Anim
		tst.b	DirectionX(A6)
		bmi.s	.SetAnim
		lea	FallAnimRight(pc),a1		* Anim
.SetAnim:	moveq	#4,d0				* Speed
		SYSCALL	SetAnimPrg
		rts


****************************************************************************

NewMoveMyBob:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	MyBob(a6),a4			* A4 = Bob

		bsr	SetSpeed

		tst.b	SturzFlag(A6)
		bne	.WasNotOnStair

		tst.b	HimmelFlag(A6)			* Keine Abfrage
		bne.s	.NoBottom			* JAJA -->

		cmp.w	#176,bob_Y(a4)			* Bob Y-Position out
		blt.s	.NoBottom			* of Screen

		move.w	FallingDist(a6),d2
		cmp.w	#250,bob_Y(A4)
		bhi.s	.Set

		addq.w	#4,bob_Y(A4)
		bra	.NoScrScroll

.Set:		bsr	SetHimmelMove
		bra	.NoScrScroll

.NoBottom:	tst.w	bob_Y(A4)
		bpl.s	.NoTop

		SYSTST.B CheatFlag
		bne.s	.NoTop

		move.w	FallingDist(A6),d2
		bra	.ImSprung

.NoTop:		bsr	GetJoy

		move.b	DirX(A6),LastDirX(A6)
		move.b	DirY(A6),LastDirY(A6)
		move.b	d0,DirX(a6)
		beq.s	.NoXDir
		move.b	d0,DirectionX(A6)		* Letzte Richtung

.NoXDir:	move.b	d1,DirY(a6)			* JoyStick-Abfrage
		beq.s	.NoYDir
		move.b	d1,DirectionY(A6)

.NoYDir:	muls	Speed(a6),d0
		muls	Speed(a6),d1
		move.w	d0,ScrollX(a6)
		move.w	d1,ScrollY(a6)

	IFD	FREEZE
		bra.s	.fd
	ENDC
		SYSGET.B CheatFlag,d7
		beq.s	.fd
	
		add.w	d1,bob_Y(a4)

.fd:		;tst.b	CloudFlag(A6)
		;bne	.Sprung

		tst.b	HimmelFlag(A6)
		bne	.HandleX

		tst.b	JumpingFlag(a6)
		bne	.NoStair

		clr.b	StairFlag(a6)

		move.w	bob_X(a4),d0			* X-Position
		move.w	bob_Y(a4),d1			* Y-Position
		add.w	ScrollY(a6),d1
		addq.w	#1,d1
		
		bsr	GetElem				* Wo stehen wir
		bsr	GetInfo
		btst	#LEVB_LeiterFlag,d0		* Flag
		beq	.NoStair			* --> Nein

		tst.b	DirY(A6)
		beq	.Nothing

		st.b	StairFlag(a6)			* Now moves on stair
		clr.w	FallingDist(A6)

		move.w	ScrollY(a6),d0
		move.b	d0,DirX(A6)			* Kleiner Cheat
		move.b	#5,JumpDelay(a6)

		move.l	a4,a0				* Bob

		move.b	DirY(A6),d3			* Wurde die
		cmp.b	LastDirY(A6),d3			* Richtung gewechselt
		beq	.Nothing

		and.w	#$FFF0,bob_X(A0)
		add.w	#5,bob_X(A0)			* Auf Leiter setzen

		tst.b	DuckFlag(A6)
		bne	.Nothing

		cmp.l	#StairUp,bob_AnimPrg(A4)
		beq.s	.ChangeDir
		cmp.l	#StairDown,bob_AnimPrg(A4)
		beq.s	.ChangeDir

		lea	StairUp(pc),a1
		tst.b	DirectionY(A6)
		bmi.s	.Up1

		lea	StairDown(pc),a1

.Up1:		moveq	#3,d0
		SYSCALL	SetAnimPrg			* Anim setzen

		lea	StairUpMove(pc),a1
		tst.b	DirectionY(A6)
		bmi.s	.Up

		lea	StairDownMove(pc),a1

.Up:		moveq	#1,d0				* MoveSpeed
		moveq	#4,d1				* MoveStep
		SYSCALL	SetMovePrg			* MovePrg setzen
		bra.s	.Nothing

.ChangeDir:	lea	StairUp(pc),a1
		lea	StairUpMove(pc),a2

		tst.b	DirectionY(A6)
		bmi.s	.Up2

		lea	StairDown(pc),a1
		lea	StairDownMove(pc),a2

.Up2:		move.l	a1,bob_AnimPrg(A4)
		move.l	a2,bob_MovePrg(A4)

.Nothing:	bra	.HandleX

.NoStair:	;cmp.l	#StairUp,bob_AnimPrg(A4)
		;bne.s	.WasOnStair
		;cmp.l	#StairDown,bob_AnimPrg(A4)
		;beq.s	.WasNotOnStair

.WasOnStair:	;clr.l	bob_AnimPrg(A4)
		;clr.l	bob_MovePrg(A4)

.WasNotOnStair:	move.w	FallingDist(a6),d2
		tst.w	bob_Y(A4)
		bmi.s	.StehtNicht1

		move.w	bob_X(a4),d0
		move.w	bob_Y(a4),d1
		add.w	d2,d1
		subq.w	#2,d0
		bsr	GetElem
		bsr	GetInfo				* einem Element
		move.w	d0,d3

		move.w	bob_X(a4),d0
		addq.w	#2,d0
		bsr	GetElem
		bsr	GetInfo				* einem Element

		or.w	d3,d0

		tst.b	SturzFlag(A6)
		beq.s	.NoSturz2

		cmp.w	#158,bob_Y(A4)
		bgt	.Steht
		bra.s	.NoSturz

.NoSturz2:	cmp.w	#10,bob_Y(a4)
		blo.s	.NoSturz

		btst	#LEVB_SturzFlag,d0
		beq.s	.NoSturz

		bsr	SturzHandler
		bra	.NoScrScroll

.NoSturz:	btst	#LEVB_StandFlag,d0		* Flag
		beq.s	.StehtNicht1

.StehtDoch:	and.w	#$F,d1				* Stehen wir im oberen
		cmp.w	d2,d1				* Bereich
		blt	.Steht				* Nein --->

.StehtNicht1:	move.w	FallingDist(A6),d0
		bne.s	.DistanzOk
		moveq	#1,d0
		move.w	d0,FallingDist(A6)

.ImSprung:	;tst.b	CloudFlag(A6)
		;bne.s	.OnCloud

		move.w	d2,d0				* D0=FallingDist
.DistanzOk:	add.w	d0,bob_Y(A4)
		move.b	JumpCnt(a6),d0
		and.b	#$3,d0				* Increment Speed
		bne.s	.NoIncrease			* of Falling
		addq.w	#1,FallingDist(a6)

.NoIncrease:	tst.b	SturzFlag(A6)
		bne	.NoScrScroll
		bra	.HandleX

	******  Bob steht auf Grund oder Wolke ******

.Steht:		move.w	bob_Y(a4),d0
		add.w	#$F,d0
		and.w	#$FFF0,d0
		subq.w	#1,d0
		move.w	d0,bob_Y(a4)			* Auf Boden setzen

.OnCloud:	tst.b	SturzFlag(A6)
		bne	.NoScrScroll

;		move.w	FallingDist(A6),d0
;		lsr.w	#2,d0
;		neg.w	d0
;		bsr	ChangeHealth

.Steht2:	sf.b	JumpingFlag(a6)
		clr.w	FallingDist(A6)

	******  Sprung ******

.Sprung:	cmp.b	#-1,DirY(a6)
		bne.s	.KeinenSprung
		tst.b	JumpDelay(a6)			* Warten auf JumpDelay
		bne.s	.KeinenSprung

		clr.b	JumpCnt(A6)
		move.w	#-4,FallingDist(A6)		* SprungHöhe

		tst.b	SuperJump(A6)			* SuperJump
		beq.s	.NoSuperJump			* nein -->

		move.w	#-6,FallingDist(a6)		* grosser Sprung
		subq.b	#1,SuperJump(A6)		* -1 Sprung

.NoSuperJump:	move.w	FallingDist(A6),d0
		add.w	d0,bob_Y(A4)

.Sprung2:	sf.b	DuckFlag(a6)
		bsr	SprungAnim
		st.b	JumpingFlag(a6)

.KeinenSprung:	cmp.b	#1,DirY(A6)			* Joy nach unten
		bne.s	.NichtDucken			* Nein -->

		tst.b	JumpDelay(A6)
		bne.s	.NichtDucken
		tst.b	DuckFlag(A6)			* Schon geduckt
		bne.s	.NichtDucken2			* JA -->

		bsr	DuckenAnim			* Animatiom setzen
		st.b	DuckFlag(A6)
		
.NichtDucken2:	cmp.w	#LDUCK,bob_Image(A4)		* Bob in diesem Moment geduckt
		beq.s	.Ducken2			* Nein -->
		cmp.w	#RDUCK,bob_Image(A4)		* Bob in diesem Moment geduckt
		bne.s	.NichtDucken			* Nein -->

.Ducken2:	bsr	GeducktAnim			* Bob bleibt unten

.NichtDucken:

	***** Links/Rechts Bewegungen ******

.HandleX:	cmp.w	#180,bob_Y(A6)
		bgt	.NoScrScroll

		;tst.b	CloudFlag(A6)			* Bob auf Wolke
		;bne.s	.HandleX2			* Ja -->
		tst.b	DuckFlag(A6)			* Bob geduckt
		bne	.NoScrScroll			* --> Keine Bewegung

.HandleX2:	lea	LevelX(a6),a1			* LevelX
		move.w	ScrollX(a6),d0			* X-Bewegung
		beq	.NoScrScroll
		bpl	.HandleRight			* Nach rechts

	***** Handles Left Movement *********

.ScrollLeft:	tst.b	NoLeftFlag(a6)
		bne.s	.NoScrScrollX

		move.w	(A1),d1				* Actual LevelPos
		add.w	#172+32,d1			* LeftScrollBorder
		cmp.w	bob_X(a4),d1
		blt.s	.NoScrScrollX

		add.w	d0,(A1)				* Scroll Level 
		bpl.s	.NoScrScrollX
		clr.w	(A1)				* Left Border

.NoScrScrollX:	move.w	d0,d3
		move.w	bob_X(A4),d0
		move.w	bob_Y(A4),d1
		bmi.s	.RonnyTooHigh1
		sub.w	#10,d0
		subq.w	#1,d1
		bsr	GetElem
		bsr	GetInfo				* einem Element
		btst	#LEVB_WandFlag,d0		* Flag
		bne	.NoScrScroll

.RonnyTooHigh1:	tst.b	NoLeftFlag(a6)
		beq.s	.Left1

		move.w	(A1),d1
		move.w	bob_X(A4),d2
		add.w	#60,d1
		cmp.w	d1,d2
		bgt.s	1$

		moveq	#0,d3
1$:

.Left1:		add.w	d3,bob_X(A4)			* Walk Left
		cmp.w	#52,bob_X(A4)
		bhi.s	.LeftBorder
		move.w	#52,bob_X(A4)

.LeftBorder:	bsr	MoveLeftRight			* Change Anim
		bra.s	.NoScrScroll

	***** Handles Right Movement *********

.HandleRight:	tst.b	HimmelFlag(A6)
		bne.s	.NoScrScroll

		move.w	d0,d3
		move.w	bob_X(A4),d0
		move.w	bob_Y(A4),d1
		bmi.s	.RonnyTooHigh2
		subq.w	#1,d1
		add.w	#10,d0
		bsr	GetElem
		bsr	GetInfo 			* einem Element
		btst	#LEVB_WandFlag,d0		* Flag
		bne.s	.NoScrScroll

.RonnyTooHigh2:	lea	LevelX(A6),a1
		move.w	(a1),d1				* Actual LevelPos
		add.w	#216-32,d1			* Right ScrollBorder
		cmp.w	bob_X(A4),d1			* 
		bhi.s	.NoScrScroll2			* No -->

		move.w	(A1),d2
		add.w	#368+320,d2
		cmp.w	PixelSizeX(A6),d2
		bhi.s	.NoScrScroll2

		add.w	d3,(a1)				* MoveScr to right

.NoScrScroll2:	tst.b	NoRightFlag(A6)
		bne.s	.NoScrScroll

		move.w	bob_X(A4),d2
		add.w	#368+8,d2
		cmp.w	PixelSizeX(A6),d2
		bhi.s	.NoScrScroll

		add.w	d3,bob_X(A4)			* MoveBob to right
		bsr	MoveLeftRight			* Change Anim

.NoScrScroll:	movem.l	(sp)+,d0-d7/a0-a6
		rts


**************************************************************************

GeducktAnim:	lea	DuckenLeft2(pc),a1
		tst.b	DirectionX(A6)
		bmi.s	.SetAnim
		lea	DuckenRight2(pc),a1
.SetAnim:	move.l	MyBob(A6),a0			* Bob
		moveq	#4,d0				* Speed
		SYSCALL	SetAnimPrg
		rts


**************************************************************************

DuckenAnim:	clr.b	WalkFlag(A6)
		lea	DuckenLeft(pc),a1

		tst.b	DirectionX(A6)
		bmi.s	.SetAnim
		lea	DuckenRight(pc),a1
.SetAnim:	move.l	a4,a0				* Bob
		moveq	#4,d0				* Speed
		SYSCALL	SetAnimPrg
		rts


**************************************************************************

SprungAnim:	clr.b	WalkFlag(A6)
		lea	SprungLeft(pc),a1

		tst.b	DirectionX(A6)
		bmi.s	.Left
		lea	SprungRight(pc),a1
.Left:		move.l	a4,a0				* Bob
		moveq	#4,d0				* Speed
		SYSCALL	SetAnimPrg
		rts


**************************************************************************

ChangeSprungAnim:
		lea	SprungLeft(pc),a1
		tst.b	DirectionX(A6)
		bmi.s	.Left
		lea	SprungRight(pc),a1
.Left:		move.l	a1,bob_AnimPrg(A4)
		rts


**************************************************************************

MoveLeftRight:	tst.b	JumpingFlag(A6)
		bne.s	ChangeSprungAnim

		tst.b	WalkFlag(A6)
		beq.s	.Animate

		tst.b	StairFlag(A6)
		bne.s	.NoNewAnim

		move.b	LastDirX(A6),d0
		cmp.b	DirX(A6),d0
		beq.s	.NoNewAnim

.Animate:	lea	WalkLeft(pc),a1
		tst.b	DirectionX(A6)			* Actual Direction
		bmi.s	.Left
		lea	WalkRight(pc),a1

.Left:		move.l	a4,a0				* Bob
		moveq	#4,d0				* Speed
		SYSCALL	SetAnimPrg
.NoNewAnim:	rts


**************************************************************************

SetHimmelMove:	movem.l	d0-d7/a0-a6,-(sp)
		lea	WonderVars,a6
		st.b	HimmelFlag(A6)

		moveq	#-20,d0
		bsr	ChangeHealth			* Sub Health

		move.l	MyBob(A6),a4			* Bob
		move.l	a4,a0
		moveq	#1,d0				* MoveSpeed
		moveq	#1,d1				* MoveStep
		lea	HimmelMove(pc),a1		* MovePrg
		SYSCALL	SetMovePrg

		lea	NewBallonBob(pc),a1
		SYSCALL	AddBob
		move.l	d0,a0
		move.l	d0,BallonBobBase(A6)

		move.w	bob_X(A4),d0
		addq.w	#4,d0
		move.	d0,bob_X(a0)
		move.w	bob_Y(A4),bob_Y(A0)
	
		movem.l	(sp)+,d0-d7/a0-a6
		rts


**************************************************************************

AddSternliBob:	move.l	d0,a6
		move.l	MyBob(a6),a0
		lea	NewSternliBob(pc),a1
		SYSCALL	AddBob
		move.l	d0,a1

		move.w	bob_X(A0),bob_X(A1)
		moveq	#-16,d0
		move.b	DirectionX(A6),d1
		ext.w	d1
		muls.w	d1,d0
		add.w	d0,bob_X(A1)

		move.w	bob_Y(A0),d0
		sub.w	#16,d0
		move.w	d0,bob_Y(A1)
		rts


**************************************************************************

MoveBallon:	move.l	d0,a6
		move.l	MyBob(A6),a2
		move.l	BallonBobBase(A6),a3
		move.w	bob_X(A2),d0
		addq.w	#4,d0
		move.w	d0,bob_X(a3)

		cmp.w	#50,bob_Y(A2)
		blt.s	.Release

		move.w	#LWALK+4,d0
		tst.b	DirectionX(A6)
		bmi.s	.Left
		move.w	#RWALK+4,d0
.Left:		move.w	d0,bob_Image(A2)

		move.w	bob_Y(A2),bob_Y(A3)
		rts

.Release:	clr.b	JumpingFlag(A6)
		clr.b	StairFlag(A6)
		clr.b	StandFlag(A6)
		clr.b	DuckFlag(A6)
		clr.b	HimmelFlag(A6)

		clr.b	DirX(A6)
		clr.w	FallingDist(A6)
		clr.l	bob_MovePrg(A2)

		move.w	#200,NoCollisionTimer(A6)

		move.l	a3,a0
		moveq	#5,d0
		lea	BallonAnim2(pc),a1
		SYSCALL	SetAnimPrg
		rts


**************************************************************************

GetInfo:	move.l	a0,-(sp)
		lea	WonderVars,a6
		lsl.w	#1,d0				* Elem
		move.l	LevelFlags(A6),a0		* Liste
		move.w	(a0,d0.w),d0			* Wert
		move.l	(sp)+,a0
		rts


**************************************************************************

DelayBlank:	move.l	d0,-(sp)
		move.l	VBCounter(a6),d0		* Current VBCnt
1$:		cmp.l	VBCounter(a6),d0		* didn't changed
		beq.s	1$				* yet -->
		move.l	(sp)+,d0
		rts


**************************************************************************

FlipScreen:	movem.l	d0-d1/a0-a1,-(sp)

		not.b	FlipFlag(a6)
		lea	ViewBitmStr(pc),a0		* BitmapStructure
		move.l	PictureBase(a6),d0		* BaseAdress
		tst.b	FlipFlag(A6)
		beq.s	1$

		add.l	ScrSize(A6),d0			* Second Plane

1$:		bsr	SetBitmapPtrs

		lea	DrawBitmStr(pc),a0		* BitmapStructure
		move.l	PictureBase(a6),d0		* BaseAdress
		tst.b	FlipFlag(a6)
		bne.s	2$

		add.l	ScrSize(A6),d0			* Second Plane

2$:		bsr	SetBitmapPtrs
		movem.l	(sp)+,d0-d1/a0-a1
		rts


**************************************************************************

SetUpPicture:	move.l	PanelBase(a6),a0
		lea	PanelPtrs,a1
		move.l	#(SZ_PANEL-64)/6,d0		* PlaneSize
		moveq	#6-1,d1				* NumPlanes
		bsr	SetPointers			* Set Panel

		move.l	PanelBase(a6),a0
		add.l	#SZ_PANEL-64,a0			* Begin of ColorMap
		lea	PanelColors,a1
		moveq	#32,d0				* NumCols
		bsr	SetColors

		lea	DrawBitmStr(pc),a4
		bsr.s	SetUpPic
		lea	ViewBitmStr(pc),a4

SetUpPic:	moveq	#0,d1				* YPosition
		moveq	#0,d0				* XPosition
1$:		bsr	DrawChar
		addq.w	#1,d0				* Next Column
		cmp.w	#ScrWidth/2,d0			* Last Column
		bne.s	1$
		moveq	#0,d0				* Reset Column

		addq.w	#1,d1				* Next Row
		cmp.w	#ScrHeight/16,d1		* Last Row
		bne.s	1$
		rts


**************************************************************************

InitVars:	movem.l	d0-d1/a0/a6,-(sp)

		move.l	$dff006,d0
		move.l	$dff006,d1
		SYSCALL	Randomize			* for 'Random'

		move.b	#6,ShootValue(a6)		* Shoot Delay
		clr.w	LevelX(A6)
		clr.w	LastLevelX(A6)
		clr.b	EndFlag(a6)
		clr.b	FlipFlag(A6)			* Level Initializing

		moveq	#-1,d0
		move.l	d0,OldMoney(A6)
		move.l	d0,OldScore(A6)
		move.l	d0,OldTimer(A6)
		move.b	d0,OldNumCubes(A6)

		move.l	#10,Money(A6)			* Money

		move.w	#1,FallingDist(a6)
		move.w	#84,Energy(a6)
		clr.w	EnergyIst(a6)
		move.w	#84,Health(a6)
		clr.w	HealthIst(a6)			* Player Initializing

		clr.w	NoCollisionTimer(A6)
		clr.b	SuperJump(A6)
		clr.w	ParalizeTimer(A6)
		clr.b	CollectFlag(A6)
		clr.b	PowerSneeze(A6)

		clr.b	JumpingFlag(A6)
		clr.b	StairFlag(A6)
		clr.b	StandFlag(A6)
		clr.b	DuckFlag(A6)
		clr.b	HimmelFlag(A6)
		clr.b	SturzFlag(A6)
		clr.b	CycleFlag(A6)
		clr.b	ShopFlag(A6)
		clr.b	ShopTimer(A6)
		clr.b	NumCubes(A6)

		moveq	#1,d0
		move.b	d0,DirX(A6)
		move.b	d0,DirectionX(A6)

		lea	CheatText(pc),a0
		SYSCALL	SetCheatText			* Sets Cheat Text	

		lea	Sprite1(A6),a1
		move.l	a1,ShowSpr(A6)

	IFND	FREEZE
		move.l	#JoyMove,JoyMem
		move.l	#ButtonMove,ButtonMem
	ENDC
		clr.w	StickCnt
		clr.w	ButtonCnt
	
		movem.l	(sp)+,d0-d1/a0/a6
		rts


**************************************************************************

SetClouds:	movem.l	d0-d7/a0-a3,-(sp)
		moveq	#0,d0
		move.w	LevelX(A6),d0

		move.l	CloudPtr(A6),a3

		move.l	ActLevelPtr(A6),a2
		move.w	PTR_CLOUDFLAGS(A2),d1
		btst	#CLB_AUTOMOVE,d1
		beq.s	.NoMove

		add.l	VBCounter(A6),d0

1$:		move.l	d0,d4
		move.l	d0,d5
		move.l	d0,d6
		lsr.l	#1,d4
		lsr.l	#2,d5
		lsr.l	#3,d6

		bra.s	.DoIt

.NoMove:	move.l	d0,d4
		move.l	d0,d5
		move.l	d0,d6

		mulu	#3,d4
		divu	#2,d4

		mulu	#6,d5
		divu	#5,d5

.DoIt:		move.w	#33*80,d3			* Offset
		lea	cpr_Cloud1bpt,a0		* BitplanePtr
		lea	cpr_Cloud1bpl,a1		* Bplcon0
		move.w	d4,d0
		move.l	a3,a2				* Plane
		bsr.s	SetScroll

		move.w	d5,d0
		move.w	#33*80,d3			* Offset
		lea	cpr_Cloud2bpt,a0		* BitplanePtr
		lea	cpr_Cloud2bpl,a1		* Bplcon0
		add.l	#80*16,a2
		bsr.s	SetScroll

		move.w	d6,d0				* X-Position
		move.w	#33*80,d3			* Offset
		lea	cpr_Cloud3bpt,a0		* BitplanePtr
		lea	cpr_Cloud3bpl,a1		* Bplcon0
		add.l	#80*10,a2
		bsr.s	SetScroll

.NoScroll:	movem.l	(sp)+,d0-d7/a0-a3
		rts


**************************************************************************
* D0=XScroll / D3=PlaneSize / A0=CopperBitmap / A1=BplCon0 / A2=Plane
****************************************************************************

SetScroll:	movem.l	d0-d2/a0-a1,-(sp)
		divu	#320,d0
		swap	d0

		move.w	d0,d2
		asr.w	#4,d2				* /16
		add.w	d2,d2				* D2 := Byte-Offset (gerade)
		ext.l	d2
		not.w	d0				* Bits umkehren
		andi.w	#15,d0				* Pixelscroll-Wert
		move.w	d0,d1
		lsl.w	#4,d1
		or.w	d1,d0				* Bits 0-3 in Bits 4-7
		move.w	d0,2(A1)			* in Copperliste eintragen
		moveq	#3-1,d1
		move.l	a2,d0				* BitPlane
		add.l	d2,d0				* Plus Scroll-Offset
1$:		move.w	d0,6(a0)			* Lo-Word
		swap	d0
		move.w	d0,2(a0)			* Hi-Word
		swap	d0
		add.l	d3,d0				* Offset addieren
		lea	8(a0),a0
		dbf	d1,1$

		movem.l	(sp)+,d0-d2/a0-a1
		rts


**************************************************************************

InitClouds:	move.l	d0,-(sp)
		move.l	#3840+2400+1680,d0
		SYSCALL	AllocMem
		move.l	d0,CloudPtr(A6)
		move.l	(sp)+,d0
		rts

LoadClouds:	movem.l	d0/a0-a2,-(sp)
		move.l	CloudPtr(a6),a0
		move.l	#FN_CLOUD,d0
		SYSCALL	ReadFile
		bsr	SetClouds
		movem.l	(sp)+,d0/a0-a2
		rts

LoadNeon:	movem.l	d0/a0-a2,-(sp)
		move.l	CloudPtr(a6),a0
		move.l	#FN_NEON,d0
		SYSCALL	ReadFile
		bsr	SetClouds
		movem.l	(sp)+,d0/a0-a2
		rts

LoadStein:	movem.l	d0/a0-a2,-(sp)
		move.l	CloudPtr(a6),a0
		move.l	#FN_STEIN,d0
		SYSCALL	ReadFile
		bsr	SetClouds
		movem.l	(sp)+,d0/a0-a2
		rts


**************************************************************************

LoadPanel:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	#FN_PANELFONT,d0
		SYSCALL	LoadFile

		lea	NewPanelFont+nf_Bob(pc),a0
		move.l	d0,(A0)				* Font for this Window

		move.l	#FN_PANEL,d0			* Size
		SYSCALL	LoadFile			* Load Panel
		move.l	d0,PanelBase(a6)		* PanelAdress
		move.l	d0,a0

		lea	PanelBitmStr+bm_Planes(pc),a1	* Ptrs to Bitmap
		lea	FxPanelBitmStr+bm_Planes(pc),a2	* Ptrs to FXBitmap
		moveq	#6-1,d0				* Depth

1$:		move.l	a0,(A1)+			* Set Bitmap
		move.l	a0,(A2)				* Letzte Bitmap für HalfBriteEffekte
		add.l	#40*32,a0			* Next Plane
		dbf	d0,1$				* -->

		lea	NewPanelWindow(pc),a0		* PanelWindow
		lea	PanelBitmStr(pc),a1		* BitmStr
		bsr	OpenWindow			* Open it
		move.l	d0,PanelWindow(a6)

		lea	NewPanelWindow(pc),a0		* PanelWindowFX
		lea	FxPanelBitmStr(pc),a1		* BitmStr
		bsr	OpenWindow			* Open it
		move.l	d0,FxPanelWindow(a6)

		lea	NewPanelBobs(pc),a1
		SYSCALL	AddBob				* Adds Gadgets & Jobs
		move.l	d0,FieldBob(A6)
		movem.l	(sp)+,d0-d7/a0-a6
		rts


**************************************************************************
* A0 = FieldStruct
****************************************************************************

AddGadget:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	a1,a2
		lea	Field1(A6),a1			* Start der Fields
		moveq	#4-1,d0				* NumFields
		moveq	#0,d1				* FieldCnt

.SearchField:	tst.l	(A1)+				* Field frei
		beq.s	.FoundField			* JA -->
		addq.w	#1,d1				* Next Field
		dbf	d0,.SearchField			* Loop -->
		bra	.Exit				* keines frei

.FoundField:

		btst	#FDB_PROPERTIE,fd_Flags+1(A0)
		bne.s	.GotJob
		btst	#FDB_JOB,fd_Flags+1(A0)		* This is no Job
		beq.s	.NoJob				* -->

.GotJob:	bsr	JobSelector			* Select the Options

		btst	#FDB_JOB,fd_Flags+1(A0)
		bne.s	.GotJob2

		tst.b	MenuOption(A6)
		beq.s	.Accepted
		bra.s	.Leave

.GotJob2:	tst.b	MenuOption(A6)			* OK
		beq.s	.Accepted			* -->
		cmp.b	#1,MenuOption(A6)		* Cancel
		bne.s	.Leave				* -->

		move.l	a2,a0				* Bob
		SYSCALL	RemBob				* Reomven
		bra	.Exit				* -->

.Leave:		move.l	a2,a0
		bsr	CommonRemBob
		bra	.Exit

.Accepted:	move.w	fd_Money(A0),d2			* Money
		add.w	ExtraMoney(A6),d2		* plus ExtraMoney
		ext.l	d2
		add.l	d2,Money(A6)

.NoJob:		move.l	a0,-(A1)			* Field besetzen

		move.w	fd_Score(A0),d2
		ext.l	d2
		add.l	d2,Score(A6)			* Score addieren

.NoJob2:	move.w	fd_BobNum(A0),d2
		
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	PanelWindow(A6),a1
		move.l	wn_BitmStr(A1),a1		* BitmapStructure

		move.l	FieldBob(A6),a0			* Bob	
		move.w	d2,bob_Image(A0)		* Image
		mulu.w	#20,d1
		add.w	#244,d1
		move.w	d1,bob_X(A0)			* XPos
		move.w	#24+1,bob_Y(A0)			* YPos

		lea	custom,a5
		SYSCALL	DrawOneBob			* Paint Bob

		movem.l	(sp)+,d0-d7/a0-a6
		movem.l	(sp)+,d0-d7/a0-a6
		moveq	#-1,d0				* Success
		rts

.Exit:		movem.l	(sp)+,d0-d7/a0-a6
		moveq	#0,d0				* No Field Free
		rts


**************************************************************************

RemoveGadget:	movem.l	d0-d4/a0-a2,-(sp)
		lea	-4(A1),a1			* Eigenes Field
		clr.l	(A1)				* Field löschen

		lea	Field1(a6),a0

		sub.l	a0,a1

		move.l	PanelWindow(A6),a0

		move.b	wn_APen(A0),d4

		moveq	#0,d0
		bsr	SetAPen

		move.l	a1,d0				* FieldNum
		mulu	#5,d0
		add.w	#235,d0				* Left Edge
		moveq	#9+1,d1				* Top Edge
		moveq	#18,d2				* Width
		moveq	#17-1,d3			* Height
		bsr	RectFill

		move.b	d4,wn_APen(A0)
		movem.l	(sp)+,d0-d4/a0-a2
		rts


**************************************************************************

ClearPanel:	movem.l	d0-d7/a0-a6,-(sp)
		lea	Field1(A6),a1			* Start der Fields
		moveq	#4-1,d4				* Count

.Clear:		tst.l	(A1)+				* Check Field
		beq.s	.Empty				* empty -->

		bsr	RemoveGadget			* Remove Gadget
.Empty:		dbf	d4,.Clear			* next -->
		
		movem.l	(sp)+,d0-d7/a0-a6
		rts


**************************************************************************

HandlePanel:	movem.l	d0-d4/a0-a2,-(sp)

		SYSCALL	GetKey
		cmp.b	#27,d0
		bne	.NoExit

		move.b	#123,EndFlag(a6)
.NoExit:

	IFD	TEST
		tst.b	d0
		beq	1$

		cmp.b	#$F6,d0
		bne.s	2$

		tst.w	ActLevel(A6)
		beq.s	1$

		subq.w	#1,ActLevel(a6)

2$:		cmp.b	#$F7,d0
		bne.s	1$

		cmp.w	#9,ActLevel(A6)
		beq.s	1$

		addq.w	#1,ActLevel(a6)
		st.b	FKeyFlag

1$:		cmp.b	#'1',d0
		blo.s	3$
		cmp.b	#'8',d0
		bhi.s	3$

		sub.b	#'0',d0
		moveq	#0,d1
		move.b	d0,d1
		move.w	d1,ActLevel(a6)
		st.b	FKeyFlag
3$:
	ENDC

		lea	Field1(A6),a1			* Start der Fields
		moveq	#4-1,d1				* NumFields
		move.w	#241,d2				* FKey

.SearchField:	tst.l	(A1)+				* Field belegt
		beq.s	.FieldEmpty			* Nein -->

		move.l	-4(A1),a0			* FieldEntry

.NoJob:		cmp.b	d0,d2				* FKey gedrückt
		bne.s	.FieldEmpty			* nein -->

		move.l	fd_Handler(A0),a2		* Handler
		move.l	a2,d4
		beq.s	.NoHandler



	*** Handler aufrufen ***

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	(A2)				* Anspringen
		movem.l	(sp)+,d0-d7/a0-a6
		bra.s	.FieldEmpty

.NoHandler:	tst.w	fd_Flags(A0)
		beq.s	.FieldEmpty

		st.b	NoInt(A6)
		bsr	SoftScroll			* Bitplane eintragen

		movem.l	d0-d2/a0-a1,-(sp)

		move.l	fd_Text(A0),a0
		move.l	a0,d0
		beq.s	.NoText


	*** Text ausgeben ***

		move.w	(A0)+,d0
		move.w	(A0)+,d1
		move.w	(A0)+,d2
		sub.l	a1,a1

		bsr	HideRonny			* RonnySprite verdecken
		bsr	Message				* Meldung ausgeben


.NoText:	movem.l	(sp)+,d0-d2/a0-a1

		clr.b	NoInt(A6)

.FieldEmpty:	addq.w	#1,d2				* Next FKey
		dbf	d1,.SearchField			* Loop -->

.Exit:		movem.l	(sp)+,d0-d4/a0-a2
		rts

	IFD	TEST
FKeyFlag:	dc.w	0
	ENDC


**************************************************************************

JobSelector:	movem.l	d0-d7/a0-a6,-(sp)
		st.b	NoInt(a6)			* Game Stoppen
		bsr	SoftScroll			* Bitplane eintragen

		move.l	a0,a2
		move.l	a0,a4

		move.l	fd_Text(a2),a0
		move.l	a0,d0
		beq.s	.NoText

		move.w	(a0)+,d0			* TopEdge
		move.w	(A0)+,d1			* Width
		move.w	(a0)+,d2			* Height
		sub.l	a1,a1				* Handler
		bsr	HideRonny
		bsr	Message				* Message ausgeben
		bsr	DrawRonny

		moveq	#100,d0
		bsr	RasterDelay

1$:		bsr	CheckJoy
		beq.s	1$

.NoText:	moveq	#50,d0				* TopEdge
		move.w	#130,d1				* Width
		moveq	#50,d2				* Height

		btst	#FDB_JOB,fd_Flags+1(A4)
		bne.s	.GotJob

		sub.w	#9,d2				* -1 Zeile

.GotJob:	sub.l	a0,a0				* Text
		lea	JobSelect(pc),a1		* Handler
		bsr	HideRonny
		bsr	Message				* Message ausgeben
		movem.l	(sp)+,d0-d7/a0-a6

		clr.b	NoInt(A6)
		rts


****************************************************************************

JobSelect:	clr.w	ExtraMoney(A6)
		btst	#FDB_JOB,fd_Flags+1(A4)
		bne.s	GotJob

		bsr	OpenMoneyWindow
		move.w	ExtraMoney(A6),d0
		ext.l	d0
		bsr	PrintMoney

		moveq	#0,d0				* Option

		lea	JobOption2(pc),a1		* Text

.GotJob:	bsr	SelectOption
		move.b	d0,MenuOption(A6)

.Exit:		moveq	#100,d0
		lsl.l	#1,d0
		bsr	WaitRaster

		move.l	a3,a0
		bsr	CloseWindow
		rts


GotJob:		bsr	OpenMoneyWindow
		move.w	ExtraMoney(A6),d0
		ext.l	d0
		bsr	PrintMoney

		moveq	#4,d0
		SYSCALL	Random
		addq.w	#2,d0				* Rnd (2-6)
		move.w	d0,d4				* maximaler Betrag

		lsl.w	#2,d4				* 

		moveq	#0,d7				* Option
.JobSelect3:	move.l	d7,d0

		lea	JobOption(pc),a1		* Text
		bsr	SelectOption
		move.l	d0,d7
		move.b	d0,MenuOption(A6)
		cmp.b	#1,d0
		beq.s	.Gamble

.Exit:		moveq	#100,d0
		lsl.l	#1,d0
		bsr	WaitRaster

		move.l	a3,a0
		bsr	CloseWindow
		rts



.Gamble:	move.l	a0,-(sp)
		addq.w	#4,ExtraMoney(A6)		* Gamble
		cmp.w	ExtraMoney(A6),d4		* Price OK
		bgt.s	.PriceOk			* yes -->

		moveq	#40,d0				* Preis war zu hoch
		move.w	#180,d1
		moveq	#40,d2
		lea	TooHighTxt(pc),a0		* Text
		sub.l	a1,a1				* WaitJoy
		bsr	Message

		move.b	#1,MenuOption(A6)		* Cancel
		move.l	(sp)+,a0
		bra.s	.Exit				* Ende -->

.PriceOk:	moveq	#40,d0
		move.w	#228,d1
		moveq	#31,d2
		lea	MoreMoneyTxt(pc),a0		* Text
		sub.l	a1,a1				* WaitJoy
		bsr	Message

2$:		bsr	CheckJoy
		beq.s	2$				* Gedrückt ja -->

		move.w	ExtraMoney(A6),d0
		ext.l	d0
		bsr	PrintMoney
		move.l	(sp)+,a0
		bra	.JobSelect3



**************************************************************************

OpenMoneyWindow:
		movem.l	d0-d7/a0-a2,-(sp)
		lea	ShopWindow2(pc),a0		* Window
		lea	ViewBitmStr(pc),a1		* BitmapStructure
		bsr	CalcEdge
		add.w	#64,nw_LeftEdge(A0)		* noch verschieben
		bsr	OpenWindow			* Open ShoppyWindow
		move.l	d0,a3				* ShoppyWindow
		movem.l	(sp)+,d0-d7/a0-a2
		rts



**************************************************************************
* D0 = Money
****************************************************************************

PrintMoney:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	d0,d4
		move.l	a3,a0				* Window
		lea	Para(A6),a2			* Stack

		moveq	#15,d0
		bsr	SetAPen

		moveq	#112,d0
		moveq	#4,d1
		moveq	#24,d2
		moveq	#8,d3
		bsr	RectFill

		move.l	d4,(A2)				* Money
		lea	MoneyString(pc),a1		* Text
		bsr	Print
		movem.l	(sp)+,d0-d7/a0-a6
		rts


**************************************************************************

UnLoadLevel:	move.l	a1,-(sp)
		move.l	CharBase(a6),a1
		SYSCALL	FreeMem
		move.l	LevelBase(a6),a1
		SYSCALL	FreeMem
		move.l	PictureBase(a6),a1
		SYSCALL	FreeMem
		move.l	BobBase(a6),a1
		SYSCALL	FreeMem
		move.l	(sp)+,a1
		rts


**************************************************************************

LoadLevel:	movem.l	d0-d2/a0-a2,-(sp)
		move.l	ActLevelPtr(A6),a2
		move.l	PTR_FLAGS(A2),LevelFlags(A6)	* LevelFlags

		move.l	PTR_ENEMYLEFT(A2),LEnemyListPtr(a6)
		move.l	PTR_ENEMYRIGHT(A2),REnemyListPtr(a6)
		move.l	PTR_LEVELBOBTAB(A2),LevelBobTab(A6)

		move.l	PTR_COLORMAP(A2),a0
		bsr	CopyColorMap			* Set this levels colormap


		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		move.l	FN_BOBS(A2),d0
		SYSCALL	LoadFile
		move.l	d0,BobBase(A6)


		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		move.l	FN_CHAR(A2),d0
		SYSCALL	LoadFile			* Load CharSet
		move.l	d0,CharBase(a6)


		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		move.l	FN_LEVEL(A2),d0
		SYSCALL	LoadFile			* Load LevelSet
		move.l	d0,LevelBase(a6)


		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		movem.l	(sp)+,d0-d2/a0-a2
		rts


****************************************************************************

CreateLevel:	movem.l	d0-d2/a0-a2,-(sp)
		move.l	LevelBase(A6),a0
		move.l	a0,a1				* A1=Destination

		move.w	6(a1),d0			* X-Chars/Screen
		mulu	10(A1),d0			* NumScreens X
		move.w	d0,SizeX(A6)
		lsl.w	#4,d0
		move.w	d0,PixelSizeX(a6)		* Breite in Pixel

		move.w	8(a1),d0			* Y-Chars/Screen
		mulu	12(A1),d0			* NumScreens Y
		move.w	d0,SizeY(A6)
		lsl.w	#4,d0
		move.w	d0,PixelSizeY(a6)

		move.l	#Scr_SIZEOF,d0			* Screen-Size

		move.w	SizeX(A6),d1			* NumCharsX
		sub.w	#ScrWidth/2,d1			* -1 Screen
		lsl.w	#1,d1				* 2 Byte pro Element

		move.w	SizeY(a6),d2			* NumCharsY
		sub.w	#12,d2				* -1 Screen
		mulu	#ScrWidth,d2			* ExtraPlanes for YScroll
		lsl.l	#4,d2				* 16 Pixels height

		cmp.l	d1,d2
		bhi.s	1$
		add.l	d1,d2		
1$:
		add.l	d2,d0
		move.l	d0,ScrSize(A6)

		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		lsl.l	#1,d0				* 2 Screens
		SYSCALL	AllocMem			* Memory for Display
		move.l	d0,PictureBase(a6)

		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		lea	ViewBitmStr(pc),a0
		bsr.s	SetBitmapPtrs			* SetFirstRastPort

		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		add.l	ScrSize(A6),d0			* Next Page

		lea	DrawBitmStr(pc),a0
		bsr.s	SetBitmapPtrs			* SetSecondRastPort

		IFD	DEBUG
		 SYSCALL CheckMem
		ENDC

		bsr	SetUpPicture			* Generate FirstScreen
		movem.l	(sp)+,d0-d2/a0-a2
		rts



**************************************************************************

InitLevel:	movem.l	a0-a2,-(sp)
		move.l	ActLevelPtr(A6),a2

		move.l	PTR_ENEMYRIGHT(A2),a0

.Loop2:		and.w	#~(SBF_VISIBLE|SBF_SHOOT),sb_Flags(A0)
		lea	sb_SIZEOF(A0),a0
		cmp.w	#30000,(a0)
		bne.s	.Loop2

		movem.l	(sp)+,a0-a2
		rts


**************************************************************************

SetBitmapPtrs:	movem.l	d0-d1/a0,-(sp)
		lea	bm_Planes(a0),a0		* Pointers to 1.BitPlane
		moveq	#ScrDepth-1,d1
1$:
		move.l	d0,(A0)+
		add.l	#Plane_SIZEOF,d0		* Set All BitPlanes
		dbf	d1,1$					
		movem.l	(sp)+,d0-d1/a0
		rts


**************************************************************************

UpDateClip:	movem.l	d0-d2/a0,-(sp)

		move.w	LevelX(a6),d0			* Level Coordinate
		move.w	d0,d1
		add.w	#368+8,d1			* Right Edge
		add.w	#16,d0

		SYSLEA	BobList,a0
2$:		move.l	bob_NextBob(A0),a0		* Next Bob
		move.l	bob_NextBob(A0),d2
		beq.s	1$				* No more Bobs -->

		move.w	#CLIPF_ALL,bob_ClipFlags(a0)	* Clip in all Directions
		clr.w	bob_ClipY(a0)
		move.w	#ScrHeight,bob_ClipY2(a0)
		move.w	d0,bob_ClipX(a0)		* New Right Border
		move.w	d1,bob_ClipX2(a0)		* New Right Border
		bra.s	2$

1$:		movem.l	(sp)+,d0-d2/a0
		rts


**************************************************************************

	*** Softscroll-Werte in Copperliste eintragen

SoftScroll:	movem.l	d0-d2/a0-a1,-(SP)

	*** Richtigen Bildausschnitt in Copperliste eintragen

		bsr	SoftScroll2

	*** Char-Reihe bei X-Scroll refreshen

		moveq	#0,d3				* Set to left Border

		move.w	LevelX(A6),d2
		move.w	d2,d1				* D1=LevelX
		move.w	LastLevelX(A6),d0
		move.w	d2,LastLevelX(A6)		* D2=LastLevelX
		sub.w	d0,d2				* D2=ScrollValue
;		beq.s	.NoXScroll			* NoScroll

.XScroll:	tst.w	d2
		bmi.s	.LeftScroll			* LeftScroll
		moveq	#23,d3				* Set to right Border

.LeftScroll:	move.w	d1,d0
		asr.w	#4,d0				* XKoordinate
		add.w	d3,d0				* Border (Left/Right)

		moveq	#0,d1
		asr.w	#4,d1				* in Chars
		moveq	#12-1,d2

		lea	ViewBitmStr(pc),a4
		not.b	DrawFlipFlag(A6)
		beq.s	2$
		lea	DrawBitmStr(pc),a4

2$:		bsr	DrawChar			* Draw It
		addq.w	#1,d1				* Next Y-Pos
		dbf	d2,2$				* -->

.NoXScroll:	movem.l	(SP)+,d0-d2/a0-a1
		rts


**************************************************************************

SoftScroll2:	movem.l	d0-d2/a0-a1,-(sp)

		move.w	LevelX(A6),d0			* X0 des Ausschnitts
		move.w	d0,d2
		asr.w	#4,d2				* /16
		addq.w	#2,d2
		add.w	d2,d2				* D2 := Byte-Offset (gerade)
		ext.l	d2

		not.w	d0				* Bits umkehren
		andi.w	#15,d0				* Pixelscroll-Wert
		move.w	d0,d1
		lsl.w	#4,d1
		or.w	d1,d0				* Bits 0-3 in Bits 4-7
		move.w	d0,c_bplcon1+2			* in Copperliste eintragen

		lea	ViewBitmStr+bm_Planes(pc),a1	* Anzuzeigendes Bild
		lea	BitMapPtrs+2,a0			* Start in Copperliste
		moveq	#ScrDepth-1,d1

1$:		move.l	(a1)+,d0			* Nächste Plane

		add.l	d2,d0				* Plus Scroll-Offset
		move.w	d0,4(a0)			* Lo-Word
		swap	d0
		move.w	d0,(a0)				* Hi-Word
		lea	8(A0),a0
		dbf	d1,1$

		movem.l	(sp)+,d0-d2/a0-a1
		rts


*****************************************************************************

	*** DrawChar: Char mit Char-Koordinaten D0/D1 refreshen

DrawChar:	movem.l	d0-d3/a0-a4,-(SP)

	*** Source-Offset (Level-Data) berechnen

		move.w	d1,d3				* D3 :  Y
		mulu.w	SizeX(A6),d1			* Chars per Row
		move.l	LevelBase(a6),a0		* A0 :  Die Level-Daten
		adda.w	d0,a0
		adda.l	d1,a0

		move.l	bm_Planes(a4),a2		* A2 :  Planes-Base
5$:
		adda.w	d0,a2
		adda.w	d0,a2				* Chars sind ja WORDs
		mulu.w	#ScrWidth*16,d3			* 16 Linien pro Char
		adda.l	d3,a2

		moveq	#0,d0
		move.b	14(a0),d0			* Char-Nr nach d0
		lsl.w	#5,d0				* Mal sizeof(charplane)
		mulu.w	#NumCharPlanes,d0		* Mal Anzahl Char-Planes

		move.l	CharBase(a6),a1			* A1 :  Zeichensatz ..
		adda.l	d0,a1				* .. plus Offset gibt Src
		moveq	#ScrWidth,d1			* Zwecks Speed

	*** Char-Daten in die ersten Planes reinkopieren

		move.w	#NumCharPlanes,d2		* Plane-Counter
		bra.s	2$				* Für dbf
1$:		move.w	(a1)+,(a2)			* 1. Zeile kopieren
		adda.w	d1,a2				* auf nächste Zeile springen
		move.w	(a1)+,(a2)			* 2. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 3. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 4. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 5. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 6. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 7. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 8. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 9. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 10. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 11. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 12. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 13. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 14. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 15. Zeile kopieren
		adda.w	d1,a2
		move.w	(a1)+,(a2)			* 16. Zeile kopieren
		adda.w	d1,a2

		lea	Plane_SIZEOF-16*ScrWidth(a2),a2	* next Plane
2$:		dbf	d2,1$				* ---> PlaneLoop

	*** Restliche Planes löschen

		moveq	#0,d0				* Clear-Register
		moveq	#ScrDepth,d2
		subq.w	#NumCharPlanes,d2		* Plane-Counter
		bra.s	4$				* Für dbf
3$:		move.w	d0,(a2)				* 1. Zeile löschen
		adda.w	d1,a2				* auf nächste Zeile springen
		move.w	d0,(a2)				* 2. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 3. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 4. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 5. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 6. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 7. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 8. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 9. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 10. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 11. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 12. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 13. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 14. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 15. Zeile löschen
		adda.w	d1,a2
		move.w	d0,(a2)				* 16. Zeile löschen
		adda.w	d1,a2

		lea	Plane_SIZEOF-16*ScrWidth(a2),a2	* next Plane
4$:		dbf	d2,3$				* ---> PlaneLoop
		movem.l	(SP)+,d0-d3/a0-a4
		rts


****************************************************************************

Shoot:		movem.l	d0/a0-a1,-(sp)
		tst.b	ShootDelay(a6)			* Zähler fuer Abstände
		beq.s	.Delayed			* zwischen Schüssen testen

		subq.b	#1,ShootDelay(a6)		* Zähler erniedrigen
		bra.s	.NoShoot			* und Abfrage überspringen

.Delayed:	tst.w	EnergyIst(A6)
		beq.s	.NoShoot

		bsr	CheckJoy
		bne.s	.NoShoot			* FIRE ?
		
		moveq	#0,d0
		or.b	StairFlag(A6),d0
		or.b	DuckFlag(A6),d0
		or.b	SturzFlag(a6),d0
		or.b	HimmelFlag(A6),d0
		bne.s	.NoShoot

		moveq	#-1,d0
		bsr	ChangeEnergy

		lea	NewSchussBob(pc),a1
		SYSCALL	AddBob				* Schuss adden
		move.l	d0,a1

		move.l	MyBob(a6),a0
		move.w	bob_X(A0),bob_X(A1)
		move.w	bob_Y(A0),d0
		sub.w	#10,d0
		move.w	d0,bob_Y(A1)

;		or.w	#BOBF_REMOVE,bob_UserFlags(A1)

		tst.b	DirectionX(a6)			* Direction of Shoot
		bpl.s	.Left				* Right -->
		or.w	#BOBF_FLIPXMOVE,bob_Flags(A1)	* Flip X-Axe
		
.Left:		move.b	ShootValue(a6),ShootDelay(A6)	* und Delay setzen
.NoShoot:	movem.l	(sp)+,d0/a0-a1
		rts


**************************************************************************

GetElem:	movem.l	d1/a0,-(sp)
		lea	WonderVars,a6
		asr.w	#4,d0				* CharX
		asr.w	#4,d1				* CharY

		muls	SizeX(A6),d1
		add.w	d0,d1				* Offset

		move.l	LevelBase(a6),a0
		moveq	#0,d0
		move.b	14(A0,d1.w),d0			* Elem
		movem.l	(sp)+,d1/a0
		rts


*****************************************************************************

LoadFont:	movem.l	d0-d7/a0-a6,-(sp)

		move.l	#FN_FONT,d0
		SYSCALL	LoadFile
		move.l	d0,FontBase(a6)			* Load Font
		lea	NewFont+nf_Bob(pc),a0
		move.l	d0,(a0)				* FontStructure
		lea	BottleBob1+2(pc),a0
		move.l	d0,(a0)
		lea	BottleBob2+2(pc),a0
		move.l	d0,(a0)
		lea	BottleBob3+2(pc),a0
		move.l	d0,(a0)
		movem.l	(sp)+,d0-d7/a0-a6
		rts


*****************************************************************************

HandleEnergy:	bsr.s	DrawEnergy			* UpDate EnergyDisplay

.EnergyOK:
		move.l	Time(a6),d0			* GameTime
		move.b	d0,d1


.NoSub:		bsr.s	DrawHealth			* UpDate HealthDisplay
		tst.w	HealthIst(A6)
		bhi.s	.HealthOK

		SYSGET.B CheatFlag,d0
		bne.s	.HealthOK

		move.b	#OUT_OF_HEALTH,EndFlag(A6)

.HealthOK:	rts


*****************************************************************************

DrawEnergy:	movem.l	d0-d3/a0,-(sp)
		move.w	Energy(a6),d1			* Actual Soll-Energy
		cmp.w	EnergyIst(a6),d1		* Actual Ist-Energy
		beq.s	.Down				* gleich -->
		bhi.s	.Up				* zu klein -->

		subq.w	#1,EnergyIst(a6)
		bra.s	.Down
.Up:		addq.w	#1,EnergyIst(a6)
.Down:		move.l	FxPanelWindow(a6),a0
		moveq	#0,d0
		bsr	SetAPen

		moveq	#23,d0				* Left Edge
		moveq	#5,d1				* Top Edge
		move.w	EnergyIst(A6),d2		* Width
		moveq	#12,d3				* Height
		bsr	RectFill

		moveq	#1,d0
		bsr	SetAPen

		moveq	#23,d0
		add.w	d2,d0
		addq.w	#1,d0				* Left Edge
		neg.w	d2
		add.w	#84,d2				* Width
		bsr	RectFill

.NoChange:	movem.l	(sp)+,d0-d3/a0
		rts	


**************************************************************************

DrawHealth:	movem.l	d0-d3/a0,-(sp)
		move.w	Health(a6),d1			* Actual Soll-Health
		cmp.w	HealthIst(a6),d1		* Actual Ist-Health
		beq.s	.Down				* gleich -->
		bhi.s	.Up				* zu klein -->

		subq.w	#1,HealthIst(a6)
		bra.s	.Down
.Up:		addq.w	#1,HealthIst(a6)
.Down:		move.l	FxPanelWindow(a6),a0
		moveq	#0,d0
		bsr	SetAPen

		moveq	#23,d0				* Left Edge
		moveq	#17,d1				* Top Edge
		move.w	HealthIst(A6),d2		* Width
		moveq	#10,d3				* Height
		bsr	RectFill

		moveq	#1,d0
		bsr	SetAPen

		moveq	#23,d0
		add.w	d2,d0
		addq.w	#1,d0				* Left Edge
		neg.w	d2
		add.w	#84,d2				* Width
		bsr	RectFill

.NoChange:	movem.l	(sp)+,d0-d3/a0
		rts	


**************************************************************************

EnergyCheat:	dc.w	0

ChangeEnergy:
		IFD	DEBUG
		 rts
		ENDC
 
		tst.w	d0
		bpl.s	.NoCheat

		cmp.w	#4,ActLevel(A6)
		bhi.s	.NoCheat

		cmp.w	#-1,d0
		bgt.s	.NoCheat

		asr.w	#1,d0

.NoCheat:	add.w	d0,Energy(A6)
		bpl.s	.Ok
		clr.w	Energy(A6)
.Ok:		cmp.w	#84,Energy(A6)
		blt.s	.Smaller
		move.w	#84,Energy(A6)
.Smaller:	rts


**************************************************************************

HealthCheat:	dc.w	0

ChangeHealth:
		IFD	DEBUG
		 rts
		ENDC

		tst.w	d0
		bpl.s	.NoCheat

		cmp.w	#4,ActLevel(A6)
		bhi.s	.NoCheat

		cmp.w	#-1,d0
		bgt.s	.NoCheat

		asr.w	#1,d0

.NoCheat:	add.w	d0,Health(A6)
		bpl.s	.Ok
		clr.w	Health(A6)
.Ok:		cmp.w	#84,Health(A6)
		blt.s	.Smaller
		move.w	#84,Health(A6)
.Smaller:	rts


****************************************************************************

Menu:		moveq	#0,d7				* Timer

		lea	NewMenuScreen(pc),a0
		bsr	OpenScreen
		move.l	d0,MenuScreen(A6)
		move.l	d0,a3


		move.l	#FN_MENU,d0
		bsr	LoadPic


		lea	sc_Bitmap(a3),a1		* BitmStr
		lea	NewMenuWindow(pc),a0		* MenuWindow
		bsr	OpenWindow			* Open it
		move.l	d0,MenuWindow(A6)
		move.l	d0,a0				* Window

		lea	MenuText1(pc),a1		* Text 1
		cmp.b	#2,ContinueCnt(A6)
		bne.s	.Cont

		lea	MenuText12(pc),a1		* Text 1

.Cont:		bsr	Text
		clr.b	MenuOption(a6)
		bsr	SetMenuText			* Text 2 

		move.l	a3,a0				* Screen
		lea	CMap,a1
		moveq	#125,d0
		lsl.w	#2,d0
		bsr	FadeIn				* Show Screen

		lea	FxList(pc),a1
		move.l	a1,FxListPtr(A6)
		clr.l	FxTimer(A6)

		lea	sc_Bitmap(A3),a0		* BitmStr
		SYSCALL	InitDrawBob			* Init BobRoutine

.MenuLoop:	bsr	DelayBlank
		moveq	#236/2,d0
		lsl.w	#1,d0
		bsr	RasterDelay			* Wait for RasterLine 150

		lea	sc_Bitmap(A3),a1
		SYSCALL	RestoreBobList

		bsr	CreateFX

		lea	sc_Bitmap(A3),a1
		SYSCALL	DrawBobList

		SYSCALL	GetKey

		addq.b	#1,MenuCnt(A6)
		cmp.b	#6,MenuCnt(a6)
		bne.s	.MenuLoop

		clr.b	MenuCnt(A6)
		bsr	GetJoy
		tst.b	d1				* JoyStick wurde
		bne.s	.MoveStick			* bewegt -->

		addq.w	#1,d7
		cmp.w	#1000/5,d7
		bne.s	.TooHigh

		not.b	WhichDemoFlag(A6)
		bne.s	.GameDemo

		move.b	#3,MenuOption(A6)
		bra.s	.Select

.GameDemo:	st.b	DemoFlag(A6)
		clr.b	MenuOption(A6)
		bra.s	.Select

.MoveStick:	moveq	#0,d7				* Timer
		add.b	d1,MenuOption(a6)
		bpl.s	.TooLow
		clr.b	MenuOption(a6)
.TooLow:	cmp.b	#3,MenuOption(a6)
		ble.s	.TooHigh
		move.b	#3,MenuOption(a6)

.TooHigh:	bsr	SetMenuText
		bsr	CheckJoy
		bne	.MenuLoop

.Release:	bsr	CheckJoy
		beq.s	.Release

.Select:	move.b	MenuOption(a6),d1		* Selected Option
		beq.s	.StartGame			* Start Game -->
		cmp.b	#1,d1				* Continue Game
		beq.s	.ContinueGame			* Yes -->
		cmp.b	#2,d1				* HiScore
		beq.s	.ShowHiScore			* Yes -->
		cmp.b	#3,d1				* Effects ON/OFF
		bne	.MenuLoop

		bsr	HowToPlay
		bra	.MenuLoop

.ShowHiScore:	bsr.s	ShowHiScore
		bra	.MenuLoop

.StartGame:	bsr	FadeOutMenu
		bsr	FreeBobs
		clr.b	ContinueCnt(A6)			* 2 more tries
		clr.w	HighLevel(A6)			* Continue
		moveq	#0,d0				* Level 1
		rts

.ContinueGame:	cmp.b	#2,ContinueCnt(A6)		* Cnt==2
		beq	.NoContinue			* --> No 'Continue'

		addq.b	#1,ContinueCnt(A6)		* Cnt ++

		bsr	FreeBobs
		bsr	FadeOutMenu
		move.w	HighLevel(A6),d0		* Continue
		rts

.NoContinue:	moveq	#50,d0				* Top Edge
		move.w	#172,d1				* Width
		moveq	#44,d2				* Height

		bra	.MenuLoop


*****************************************************************************

FadeOutMenu:	move.l	a3,a0
		moveq	#125,d0
		lsl.w	#2,d0
		bsr	FadeOut
							*** BOBS FREE'EN
		move.l	MenuWindow(A6),a0
		bsr	CloseWindow

		move.l	a3,a0
		bra	CloseScreen


****************************************************************************

ShowHiScore:	movem.l	d0-d7/a0-a6,-(sp)
		moveq	#0,d7

		lea	HiScoreScreen(pc),a0
		bsr	OpenScreen
		move.l	d0,a3				* A3=Screen

		move.l	#FN_HISCORE,d0
		bsr	LoadPic


		move.l	a3,a0				* Screen
		lea	CMap,a1
		bsr	LoadRGB				* Show Screen

		lea	sc_Bitmap(a3),a1		* BitmStr
		lea	HiScoreWindow(pc),a0		* MenuWindow
		bsr	OpenWindow			* Open it
		move.l	d0,a2				* A2=Window

		move.l	d0,a0				* Window
		bsr	PrintHiScores

		move.l	a3,a0				* Screen
		moveq	#-4,d1				* Y-Value
		move.l	a3,a0
		move.w	#292/4-1,d2
		moveq	#0,d3

.ScrollUp:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen
		SYSCALL	GetKey

;;		cmp.w	#16,d3
;;		blo.s	.NoAbort
		bsr	CheckJoy
		beq.s	.ScrollAborted			* Yes -->

.NoAbort:	addq.w	#1,d3
		dbf	d2,.ScrollUp


.Wait:		bsr	DelayBlank
		addq.w	#1,d7				* Increase Timer
		cmp.w	#1000,d7			* Lange genug gewartet
		beq.s	.ScrollAborted			* ja -->

		SYSCALL	GetKey
		bsr	CheckJoy			* JoyStick
		bne.s	.Wait				* nicht gedrückt -->


.ScrollAborted:	neg.w	d1
.ScrollDown:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen

		SYSCALL	GetKey

		dbf	d3,.ScrollDown

		move.l	a2,a0
		bsr	CloseWindow

		move.l	a3,a0
		bsr	CloseScreen

		movem.l	(sp)+,d0-d7/a0-a6
		rts



****************************************************************************

HowToPlay:	movem.l	d0-d7/a0-a6,-(sp)

		lea	HowToPlayScreen(pc),a0
		bsr	OpenScreen
		move.l	d0,a3				* A3=HowToPlayScreen

		move.l	#FN_HOWTOPLAY,d0
		bsr	LoadPic



		move.l	a3,a0				* Screen
		lea	CMap,a1
		bsr	LoadRGB				* Show Screen


		moveq	#0,d7
		moveq	#-4,d1				* D1=Y-Value
		moveq	#294/4-1,d2			* Count
		moveq	#0,d3
.ScrollUp:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen			* Move first Screen
		addq.w	#1,d3
		SYSCALL	GetKey
		dbf	d2,.ScrollUp


		movem.l	d0-d4/a0-a3,-(sp)

.Wait:		bsr	DelayBlank
		addq.w	#1,d7				* Increase Timer
		cmp.w	#1500,d7			* Lange genug gewartet
		beq.s	.Next				* ja -->

		SYSCALL	GetKey
		bsr	CheckJoy			* JoyStick
		bne.s	.Wait				* nicht gedrückt -->



.Next:		lea	HowToPlayScreen2(pc),a0
		bsr	OpenScreen
		move.l	d0,a3				* A3=HowToPlayScreen

		move.l	#FN_HOWTOPLAY2,d0
		bsr	LoadPic


		move.l	a3,a0				* Screen
		lea	CMap,a1
		bsr	LoadRGB				* Show Screen


		moveq	#0,d7
		moveq	#-2,d1				* D1=Y-Value
		move.w	#212/2-1,d2			* Count
		moveq	#0,d3

.ScrollUp2:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen			* Move second Screen

		addq.w	#1,d3
		SYSCALL	GetKey

		dbf	d2,.ScrollUp2



		movem.l	d0-d4/a0-a3,-(sp)

		bsr	DelayBlank

		lea	HowToPlayScreen3(pc),a0
		bsr	OpenScreen
		move.l	d0,a3				* A3=HowToPlayScreen

		move.l	#FN_HOWTOPLAY3,d0
		bsr	LoadPic


		move.l	a3,a0				* Screen
		lea	CMap,a1				* CMap
		bsr	LoadRGB				* Show Screen


		moveq	#0,d7
		moveq	#-1,d1				* D1=Y-Value
		move.w	#88/1-1,d2			* Count
		moveq	#0,d3
.ScrollUp3:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen			* Move second Screen

		SYSCALL	GetKey
		addq.w	#1,d3
		dbf	d2,.ScrollUp3


.Wait1:		bsr	DelayBlank
		addq.w	#1,d7				* Increase Timer
		cmp.w	#1000,d7			* Lange genug gewartet
		beq.s	.UndWeg				* ja -->

		SYSCALL	GetKey
		bsr	CheckJoy			* JoyStick
		bne.s	.Wait1				* nicht gedrückt -->

.UndWeg:	neg.w	d1				* D1=Y-Value
.ScrollDown3:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen			* Move second Screen

		SYSCALL	GetKey

		dbf	d3,.ScrollDown3


		bsr	CloseScreen

		movem.l	(sp)+,d0-d4/a0-a3



		neg.w	d1				* D1=Y-Value
.ScrollDown2:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen			* Move second Screen
		SYSCALL	GetKey

		dbf	d3,.ScrollDown2

		bsr	CloseScreen

		movem.l	(sp)+,d0-d4/a0-a3


.ScrollAborted:	neg.w	d1
.ScrollDown:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		move.l	a3,a0
		bsr	MoveScreen

		SYSCALL	GetKey

		dbf	d3,.ScrollDown

		bsr	CloseScreen

		movem.l	(sp)+,d0-d7/a0-a6
		rts




****************************************************************************

SetMenuText:	movem.l	d0/a0-a1,-(sp)
		move.l	MenuWindow(A6),a0		* Window
		lea	MenuText21(pc),a1		* CursorText

		move.b	#LEERPFEIL,d0
		move.b	d0,3+MenuText21-MenuText21(a1)
		move.b	d0,3+MenuText22-MenuText21(a1)
		move.b	d0,3+MenuText23-MenuText21(a1)
		move.b	d0,3+MenuText24-MenuText21(a1)	* Alles gelöscht

		move.b	MenuOption(a6),d0
		ext.w	d0
		mulu	#MenuText22-MenuText21,d0
		addq.w	#3,d0
		move.b	#PFEIL,(A1,d0.w)		* Richtigen Pfeil setzen

		bsr	Text

		movem.l	(sp)+,d0/a0-a1
		rts


**************************************************************************

CreateFX:	movem.l	d0-d7/a0-a6,-(sp)
		moveq	#1,d0
		lea	FxTimer(A6),a0
		add.l	d0,(A0)				* FxTimer
		move.l	(A0),d0

		move.l	FxListPtr(a6),a0		* Ptr to EnemyList
		move.l	(A0),d1				* Next Time
		bne.s	.NoEndList

		move.l	4(A0),FxListPtr(A6)
		clr.l	FxTimer(A6)
		bra.s	.NotReached

.NoEndList:	cmp.l	d0,d1				* Time to add new Bob
		bne.s	.NotReached			* no -->

		add.l	#12,FxListPtr(a6)		* Increase Ptr for next entry
		move.l	4(A0),a1			* A1=BobStructure
		move.l	FontBase(a6),2(A1)		* SetData
		SYSCALL	AddBob				* Add this Bob
		move.l	d0,a1
		move.w	8(A0),bob_X(A1)
		move.w	10(A0),bob_Y(A1)

.NotReached:	movem.l	(sp)+,d0-d7/a0-a6
		rts


****************************************************************************

NewHiScore:	movem.l	d0-d7/a0-a6,-(sp)
		st.b	NoKeyFlag(A6)

		lea	PlayerName(pc),a0
		move.l	Score(a6),d0
		bsr	InsertScore			* Insert Score & Name

		move.w	d0,d4				* Kein Eintrag
		beq	.NoHiScore			* --->

		move.w	#170,d0
		move.w	#208,d1
		moveq	#28,d2
		lea	PleaseTxt(pc),a0
		lea	EnterName(pc),a1
		bsr	Message

1$:		st.b	NoKeyFlag(A6)
		move.b	MusicFlag(A6),d7

		moveq	#MasterVolume,d0
		bsr	FadeOutSong

		bsr	SaveScores

		bsr	ChangeSong1

		move.b	d7,MusicFlag(A6)

.NoHiScore:	clr.b	NoKeyFlag(A6)
		movem.l	(sp)+,d0-d7/a0-a6
		rts



EnterName:	lea	HiScoreWindow(pc),a0		* Window
		move.l	ActBitmap(A6),a1
		bsr	OpenWindow
		move.l	d0,a0

		bsr	PrintHiScores

		addq.w	#1,d4
		mulu	#9,d4

		moveq	#12,d0
		bsr	SetAPen				* Color

		moveq	#NUMENTRIES-1,d7		* Anzahl Namen
		moveq	#28,d6				* YPos
		moveq	#1,d5
		lea	HiList,a4			* Liste

		lea	PlayerNameText(pc),a1		* Text to print
		move.b	d4,2(A1)
		lea	PlayerName(pc),a4		* Buffer

.Wait:		bsr	DelayBlank			* Beam Sync

		moveq	#16,d0
		bsr	SetAPen

		moveq	#44,d0				* Linke Ecke
		move.w	d4,d1				* Obere Ecke
		moveq	#8*8,d2				* Breite
		moveq	#8,d3				* Höhe
		bsr	RectFill			* Hintergrund löschen

		moveq	#24,d0
		bsr	SetAPen

		bsr	Text				* Text

.Wait1:		SYSCALL	WaitKey
		tst.b	d0
		beq.s	.Wait1
		cmp.b	#RETURN,d0
		beq.s	.Return
		cmp.b	#DELETE,d0
		beq.s	.Delete
		cmp.b	#BACKSPACE,d0
		beq.s	.Delete

		cmp.l	#PlayerName+7,a4
		beq.s	.Wait
		move.b	d0,(a4)+
		bra.s	.Wait

.Delete:	cmp.l	#PlayerName,a4
		beq.s	.Wait
		move.b	#'.',-(a4)
		bra.s	.Wait

.Return:	bsr	CloseWindow			* Window weg

		move.l	Score(A6),d0			* Score
		bsr	GetPosition			* Position
		lea	PlayerName(pc),a1		* Destination

.strcpy:	move.b	(A1)+,(A0)+
		bne.s	.strcpy
		rts


****************************************************************************

PrintHiScores:	movem.l	d0-d7/a0-a6,-(sp)
		moveq	#NUMENTRIES-1,d7		* Anzahl Namen
		moveq	#18,d6				* YPos
		moveq	#1,d5
		lea	HiList,a4			* Liste

.PrintScores:	moveq	#12,d0				* XPos
		move.w	d6,d1				* YPos
		bsr	Move				* Set Cursor

		lea	HiScoreString(pc),a1		* Text
		lea	Para(A6),a2
		move.l	a2,a3				* Stack

		move.w	d5,(A3)+			* Position
		move.l	a4,(A3)+			* Name
		move.l	NAMESIZE(A4),(A3)+		* Score
		lea	NAMESIZE+4(a4),a4		* Next Name
		
		bsr	Print				* Print it

		addq.w	#1,d5				* Increase Position
		add.w	#9,d6				* Increase YPos
		dbf	d7,.PrintScores

		movem.l	(sp)+,d0-d7/a0-a6
		rts


****************************************************************************

UpDatePanel:	movem.l	d0-d7/a0-a6,-(sp)
		bsr	HandleEnergy

		move.l	PanelWindow(a6),a0
		moveq	#0,d0
		bsr	SetAPen

		addq.b	#1,PanelCnt(A6)
		cmp.b	#4,PanelCnt(A6)
		bne.s	.NotAll

		clr.b	PanelCnt(A6)

.NotAll:	move.b	PanelCnt(A6),d7
		bne.s	.NoScoreChange

		move.l	Score(A6),d0

		IFD	DEBUG
		 move.w	LevelX(A6),d0
		 ext.l	d0
		ENDC

		IFD	MEM
		 SYSCALL	AvailMem			* Avaiable Memory
		 bsr	GetLargest
		ENDC

		IFD	POSITION
		 move.l	DebugBob(A6),a1
		 move.w	bob_X(A1),d0
		 sub.w	#368,d0
		 ext.l	d0
		ENDC

		cmp.l	OldScore(A6),d0
		beq.s	.NoScoreChange

		move.l	d0,OldScore(A6)

		lea	Para(a6),a2			* A2=ParaStack
		move.l	d0,(a2)				* Score to Stack
		lea	PanelString1(pc),a1		* String

		move.w	#132,d0
		moveq	#6,d1
		moveq	#50,d2
		moveq	#8,d3
		bsr	RectFill

		bsr	Print				* Score

.NoScoreChange:	cmp.b	#1,d7
		bne.s	.NoChange

		lea	HiList,a2
		move.l	he_Score(A2),d0			* HiScore	

		cmp.l	Score(A6),d0
		bgt.s	.NoNewHiScore

		move.l	Score(A6),d0			* Score=HiScore

.NoNewHiScore:
		move.l	GameTimer(A6),d0
		divu	#50,d0
		ext.l	d0

		IFD	POSITION
		 move.l	DebugBob(A6),a1
		 move.w	bob_Y(A1),d0
		 ext.l	d0
		ENDC

		cmp.l	OldTimer(a6),d0			* Mem equal
		beq.s	.NoChange			* yes -->

		move.l	d0,OldTimer(a6)			* New value

		IFND	POSITION

		divu	#60,d0				* D0 = Minuten
		move.l	d0,d1
		ext.l	d0		
		swap	d1				* D1 = Sekunden
		ext.l	d1

		ENDC

		lea	Para(a6),a2			* A2=ParaStack
		move.l	d0,(A2)+
		move.l	d1,(A2)
		lea	Para(a6),a2			* A2=ParaStack
		lea	PanelString2(pc),a1		* String

		move.w	#133+8,d0
		moveq	#17,d1
		moveq	#49-8,d2
		moveq	#8,d3
		bsr	RectFill			* Hintergrund löschen

		bsr	Print				* Print

.NoChange:	cmp.b	#-1,ShopTimer(A6)
		beq.s	.NoCheck

		cmp.b	#2,d7
		bne.s	.NoMoneyChange

.NoCheck:	move.l	Money(A6),d0
		cmp.l	OldMoney(A6),d0
		beq.s	.NoMoneyChange

		move.l	d0,OldMoney(A6)

		lea	Para(a6),a2			* A2=ParaStack
		ext.l	d0
		move.l	d0,(A2)
		lea	PanelString3(pc),a1		* String

		move.w	#196+5,d0
		moveq	#6,d1
		moveq	#25,d2
		moveq	#8,d3
		bsr	RectFill

		bsr	Print				* Money

.NoMoneyChange:	cmp.b	#3,d7
		bne.s	.NoCubesChange

		moveq	#0,d0
		move.b	NumCubes(A6),d0
		cmp.b	OldNumCubes(A6),d0
		beq.s	.NoCubesChange

		move.b	d0,OldNumCubes(A6)

		moveq	#25,d1
		sub.l	d0,d1

		lea	Para(a6),a2			* A2=ParaStack
		move.l	d1,(A2)
		lea	PanelString4(pc),a1		* String

		move.w	#196+5,d0
		moveq	#17,d1
		moveq	#25,d2
		moveq	#8,d3
		bsr	RectFill

		bsr	Print				* Money
.NoCubesChange:
		movem.l	(sp)+,d0-d7/a0-a6
		rts


***************************************************************************

	IFD	MEM

GetLargest:	movem.l	d1-d6/a0-a6,-(sp)
		SYSLEA	ChipMRHeader,a1
		lea	mh_First(a1),a2		; Zeiger auf 1. freien Chunk
		moveq	#0,d0			; Largest

2$:		move.l	(a2),a2			; Link zum nächsten Chunk
		cmp.l	#0,a2
		beq.s	1$			; Liste zu Ende ---> 

		cmp.l	mc_Bytes(a2),d0
		bhi.s	2$		

		move.l	mc_Bytes(A2),d0
		bra.s	2$
		
1$:		movem.l	(sp)+,d1-d6/a0-a6
		rts

	ENDC




***************************************************************************

SetSpeed:	move.w	#FAST,Speed(a6)

	IFD	FREEZE
		bra.s	1$
	ENDC
		SYSGET.B CheatFlag,d0
		beq.s	1$

		move.w	#5,Speed(A6)

1$:		tst.b	JumpDelay(a6)
		beq.s	2$
		subq.b	#1,JumpDelay(a6)

2$:		tst.b	HimmelFlag(a6)
		beq.s	3$
		move.w	#1,Speed(A6)
3$:		rts




**************************************************************************

SetMySprite:	movem.l	d0-d1/a0-a1,-(sp)
		lea	CopperSprites+2,a1

		lea	Laterne1,a0
		bsr.s	SetLong
		lea	Laterne2,a0
		bsr.s	SetLong

		move.l	ShowSpr(A6),a0
		moveq	#36*2,d1
		lsl.l	#1,d1

		bsr.s	SetLong
		add.l	d1,a0
		bsr.s	SetLong
		add.l	d1,a0
		bsr.s	SetLong
		add.l	d1,a0
		bsr.s	SetLong

		sub.l	a0,a0
		bsr.s	SetLong
		bsr.s	SetLong

		movem.l	(sp)+,d0-d1/a0-a1
		rts


****************************************************************************

SetLong:	move.l	a0,d0
		move.w	d0,4(A1)
		swap	d0
		move.w	d0,(A1)
		lea	8(A1),a1
		rts


****************************************************************************
* D0 = Top  D2 = Height
****************************************************************************

HideRonny:	movem.l	d0-d7/a0-a6,-(sp)

		move.l	MyBob(A6),a0			* MyBob
		move.l	a0,d1
		beq	.NoBob


		add.w	d0,d2				* D0 = Top
		subq	#1,d2				* D2 = Bottom of Window

		move.w	bob_Y(a0),d1
		sub.w	#32-1,d1			* Oberer Rand des Sprites

		move.l	ShowSpr(A6),a4			* SpriteData to draw in

		lea	0*(36*4)+4(A4),a0
		lea	2*(36*4)+4(A4),a1

		lea	1*(36*4)+4(A4),a2
		lea	3*(36*4)+4(A4),a3		* Alle 4 Sprites

		moveq	#32-1,d3			* Spritehöhe

.ClearLine:	cmp.w	d0,d1
		blo.s	.DontClear

		cmp.w	d2,d1
		bhi.s	.DontClear

		clr.l	(a0)
		clr.l	(a1)
		clr.l	(a2)
		clr.l	(a3)

.DontClear:	lea	4(a0),a0
		lea	4(a1),a1
		lea	4(a2),a2
		lea	4(a3),a3

		addq	#1,d1				* Nächste Zeile

		dbf	d3,.ClearLine

.NoBob:		movem.l	(sp)+,d0-d7/a0-a6
		rts



****************************************************************************
* D0=X / D1=Y1 / D2=Y2 / A0=Sprite
****************************************************************************

SetSprPos:	movem.l	d0-d2/a0,-(sp)
		and.b	#%11111000,3(A0)

		btst	#0,d0
		beq.s	.XEven
		or.b	#1,3(A0)
.XEven:		asr	#1,d0
		move.b	d0,1(A0)

		cmp.w	#256,d1
		blt.s	.YStart
		or.b	#4,3(A0)
.YStart:	move.b	d1,(A0)

		cmp.w	#256,d2
		blt.s	.YStop
		or.b	#2,3(A0)
.YStop:		move.b	d2,2(A0)
		movem.l	(sp)+,d0-d2/a0
		rts


**************************************************************************

FreeBobs:	move.l	a0,-(sp)
.MainBobLoop:	SYSLEA	BobList,a0
		move.l	bob_NextBob(A0),a0
		tst.l	bob_NextBob(A0)			* A0=Kollision
		beq.s	.EndMainLoop			* auslösendes Bob

		bsr	RemoveOneBob
		bra.s	.MainBobLoop

.EndMainLoop:	move.l	(sp)+,a0
		rts


RemoveOneBob:	movem.l	d0/a0-a2,-(sp)

		move.l	bob_LastSaveBuffer(A0),a1
		move.l	bob_LastLastSaveBuffer(A0),a2

		cmp.l	a1,a2
		bgt.s	.Clear

		move.l	a2,a1				* Change LastSaveBuffer
		move.l	a1,d0
		beq.s	.NoBuffer

.Clear:		SYSCALL	FreeMem				* Free Buffer (A1)
.NoBuffer:	move.l	a0,a1				* BobStruktur
		SYSCALL	Remove				* Node entfernen (A1)
		SYSCALL	FreeMem				* freeen
		movem.l	(sp)+,d0/a0-a2
		rts


*****************************************************************************

Play8SVX:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	WonderVars+MyBob,a1
		move.w	bob_X(A1),d1			* RonnyBobXPos
		sub.w	bob_X(A0),d1			* LevelBobXPos
		bpl.s	.Positiv
		neg.w	d1

.Positiv:	lsr.w	#2,d1
		cmp.w	#44,d1
		bls.s	.Laud

		moveq	#44,d1

.Laud:		move.l	d0,a0				* FX-Struct
		move.w	sfx_Volume(A0),d0
		move.w	d0,d2				* D2=OriginalVolume
		sub.w	d1,d0
		move.w	d0,sfx_Volume(A0)		* Volume (relativ zu BobAbstand)

		moveq	#3,d0				* Channel
		bsr	PlayFX				* Play it

		move.w	d2,sfx_Volume(A0)		* Restore OriginalVolume
		movem.l	(sp)+,d0-d7/a0-a6
		rts



*****************************************************************************
* A0 = Screen  A1=Handler (NULL=WaitJoy())
* D0 = File
****************************************************************************

ShowScreen:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	d0,d1
		move.l	a0,a4
		move.l	a1,d7

		bsr	OpenScreen
		move.l	d0,a3

		move.l	d1,d0
		bsr	LoadPic


		move.l	a3,a0				* Screen
		lea	CMap,a1
		bsr	LoadRGB				* Show Screen

		move.l	a3,a0				* Screen
		lea	CMap,a1
		moveq	#125,d0
		lsl.w	#2,d0
		bsr	FadeIn				* Show Screen

		move.l	d7,a2
		move.l	a2,d0
		beq.s	.WaitJoy

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	(a2)
		movem.l	(sp)+,d0-d7/a0-a6
		bra.s	.FadeOut

.WaitJoy:	bsr	WaitJoy

.FadeOut:	moveq	#125,d0
		lsl.w	#2,d0
		bsr	FadeOut
	
		bsr	CloseScreen

		movem.l	(sp)+,d0-d7/a0-a6
		rts



*****************************************************************************
***** ALLE Handler dieses Spiel (CollHandler / FieldHandler etc. ************
*****************************************************************************

GameEnd:	lea	WonderVars,a6
		st.b	NoInt(A6)

		clr.l	bob_CollHandler(A1)

		moveq	#30,d0
		move.w	#216,d1
		moveq	#102,d2
		lea	EndGameTxt(pc),a0
		lea	EndSelect(pc),a1
		bsr	Message

		clr.b	NoInt(A6)
		rts



EndSelect:	lea	EndOption(pc),a1		* Text
		moveq	#0,d0
		bsr	SelectOption
		cmp.b	#1,d0
		bne.s	.Pay
		rts

.Pay:		cmp.l	#99,Money(A6)
		blt.s	.NotEnough

		move.b	#LEVEL_END,EndFlag(A6)
		rts

.NotEnough:	moveq	#70,d0
		move.w	#252,d1
		moveq	#28,d2
		lea	NotEnoughTxt(pc),a0
		sub.l	a1,a1
		bra	Message


AddPanel:	bsr	AddGadget
		tst.w	d0
		beq.s	.NoPlace
		bsr	AllHandler
.NoPlace:	rts



**** JobHandler *************************************************************

Job1Handler:	lea	Job1Field(pc),a0
		bra	AddPanel

Job2Handler:	lea	Job2Field(pc),a0
		bra	AddPanel

Job3Handler:	lea	TakeBonus(pc),a0
		moveq	#3,d0		
		bsr	PlayFX
		lea	Job3Field(pc),a0
		bra	AddGadget

Job4Handler:	lea	Job4Field(pc),a0
		bra	AddPanel

Job5Handler:	lea	Job5Field(pc),a0
		bra	AddPanel

Job6Handler:	lea	Job6Field(pc),a0
		bra	AddPanel

Job7Handler:	lea	Job7Field(pc),a0
		bra	AddPanel

Job8Handler:	lea	Job8Field(pc),a0
		bra	AddPanel

Job9Handler:	lea	Job9Field(pc),a0
		bra	AddPanel

Job10Handler:	lea	Job10Field(pc),a0
		bra	AddPanel

Job11Handler:	lea	Job11Field(pc),a0
		bra	AddPanel

Job12Handler:	lea	Job12Field(pc),a0
		bra	AddPanel

Job13Handler:	lea	Job13Field(pc),a0
		bra	AddPanel

Job14Handler:	lea	Job14Field(pc),a0
		bra	AddPanel

Job15Handler:	lea	Job15Field(pc),a0
		bra	AddPanel

Job16Handler:	lea	Job16Field(pc),a0
		bra	AddPanel

Job17Handler:	lea	Job17Field(pc),a0
		bra	AddPanel

Job18Handler:	lea	Job18Field(pc),a0
		bra	AddPanel

Job19Handler:	lea	Job19Field(pc),a0
		bra	AddPanel

Job20Handler:	lea	Job20Field(pc),a0
		bra	AddPanel

**** SuperJump **************************************************************

Gadget1Handler:	addq.b	#3,SuperJump(A6)		* 3 SuperJumps
		bra	RemoveGadget

**** NoCollision ************************************************************

Gadget2Handler:	add.w	#50*8,NoCollisionTimer(A6)	* Collision OFF
		bra	RemoveGadget

**** Paralizer **************************************************************

Gadget3Handler:	add.w	#50*8,ParalizeTimer(A6)		* No moving & animation
		bsr	ParalizeThem
		bra	RemoveGadget

**** PowerSneeze ************************************************************

Gadget4Handler:	st.b	PowerSneeze(A6)			* Killing all Enemys
		bra	RemoveGadget

**** MagnetoFluct ***********************************************************

Gadget5Handler:	st.b	CollectFlag(A6)			* Collect it
		bra	RemoveGadget

*****************************************************************************

Bonus1Handler:	lea	Gadget1Field(pc),a0
		bra	AddPanel			* Gadget hinzufügen
		
Bonus2Handler:	lea	Gadget2Field(pc),a0
		bra	AddPanel			* Gadget hinzufügen

Bonus3Handler:	lea	Gadget3Field(pc),a0
		bra	AddPanel			* Gadget hinzufügen

Bonus4Handler:	lea	Gadget4Field(pc),a0
		bra	AddPanel			* Gadget hinzufügen

Bonus5Handler:	lea	Gadget5Field(pc),a0
		bra	AddPanel			* Gadget hinzufügen

AllHandler:	lea	TakeBonus(pc),a0
		moveq	#3,d0		
		bsr	PlayFX
		move.l	a1,a0
		move.l	a1,d0
		beq.s	.NoRemove

		SYSCALL	RemBob

.NoRemove:	rts


**** Sneeze *****************************************************************

ShootColl2:	movem.l	d0-d1/a0-a2,-(sp)
;		tst.b	bob_UserData+ud_NumShoot(A0)	* Bob genug getroffen
;		beq.s	.RemoveBob			* ja -->

;		subq.b	#1,bob_UserData+ud_NumShoot(A0)	* Treffer -1

;		moveq	#2,d0				* Time
;		moveq	#24,d1				* Color
;		SYSCALL	FlashBob			* Flash it
;		bra.s	.EndRemove

.RemoveBob:	add.l	#50,WonderVars+Score

		lea	NewExBob(pc),a1
		SYSCALL	AddBob				* Add Explosion
		move.l	d0,a2
		move.w	bob_X(A0),bob_X(A2)
		move.w	bob_Y(A0),bob_Y(A2)

		bsr	CommonRemBob			* Remove LevelBob

		lea	Blopp(pc),a0
		moveq	#3,d0		
		bsr	PlayFX

.EndRemove:	clr.b	ShootDelay(A6)
		movem.l	(sp)+,d0-d1/a0-a2
		rts


****************************************************************************

ShootColl:	move.l	a0,a3				* A3=SchussBob
		move.l	a1,a0				* A1=A0=LevelBob

		tst.b	bob_UserData+ud_NumShoot(A0)	* Bob genug getroffen
		beq.s	.RemoveBob			* ja -->

		subq.b	#1,bob_UserData+ud_NumShoot(A0)	* Treffer -1

		moveq	#2,d0				* Time
		moveq	#24,d1				* Color
		SYSCALL	FlashBob			* Flash it
		bra	.EndRemove

.RemoveBob:	add.l	#50,WonderVars+Score

		lea	NewExBob(pc),a1
		SYSCALL	AddBob				* Add Explosion
		move.l	d0,a2
		move.w	bob_X(A3),bob_X(A2)
		move.w	bob_Y(A3),bob_Y(A2)

		move.l	bob_UserDataPtr(a0),a1
		btst	#SBB_SHOOT,1(A1)
		bne.s	.SchonGetroffen

		bset	#SBB_SHOOT,1(A1)

		lea	ImmerCoinBob(pc),a1
		SYSCALL	AddBob
		move.l	d0,a2
		move.w	bob_X(A3),bob_X(A2)
		move.w	bob_Y(A3),bob_Y(A2)
		sub.w	#20,bob_Y(A2)

.SchonGetroffen:
		bsr	CommonRemBob			* Remove LevelBob

		lea	Blopp(pc),a0
		moveq	#3,d0		
		bsr	PlayFX

.EndRemove:	clr.b	ShootDelay(A6)

		move.l	a3,a0
		SYSCALL	RemBob				* Remove Shoot
		rts

**** TimeBonus *************************************************************

SandUhrColl:	move.l	a1,a0				* BonusBob
		SYSCALL	RemBob				* removen

		moveq	#3,d0
		lea	TakeBonus(pc),a0
		bsr	PlayFX

		add.l	#250,WonderVars+Score
		add.l	#50*60*3,WonderVars+GameTimer
		rts

**** HealthBonus ***********************************************************

HealthColl:	move.l	a1,a0				* BonusBob
		SYSCALL	RemBob				* removen

		moveq	#3,d0
		lea	TakeBonus(pc),a0
		bsr	PlayFX

		add.l	#250,WonderVars+Score

		moveq	#32,d0				* Health
		bra	ChangeHealth			* erhöhen

**** EnergyBons ************************************************************

EnergyColl:	move.l	a1,a0				* BonusBob
		SYSCALL	RemBob				* removen

		moveq	#3,d0
		lea	TakeBonus(pc),a0
		bsr	PlayFX

		add.l	#250,WonderVars+Score

		moveq	#32,d0				* Health
		bra	ChangeEnergy			* erhöhen

**** Cubes *****************************************************************

CubeColl:	lea	WonderVars,a6
		addq.b	#1,NumCubes(A6)			* CubeCounter erhöhen

		add.l	#50,Score(A6)

		moveq	#3,d0
		lea	TakeBonus(pc),a0
		bsr	PlayFX

		move.l	a1,a0				* CubeBob
		SYSCALL	RemBob				* removen
		rts

**** Coins *****************************************************************

CoinColl:	lea	WonderVars,a6
		addq.l	#1,Money(A6)			* CoinCounter erhöhen
		add.l	#50,Score(A6)

		moveq	#3,d0
		lea	TakeBonus(pc),a0
		bsr	PlayFX

		move.l	a1,a0				* CoinBob
		SYSCALL	RemBob				* removen
		rts

**** InvisibleCoin *********************************************************

EmptyColl:	move.l	a1,a2
		lea	ImmerCoinBob(pc),a1
		SYSCALL	AddBob

		move.l	d0,a1
		move.w	bob_X(A2),bob_X(A1)
		move.w	bob_Y(A2),d0
		sub.w	#32,d0
		move.w	d0,bob_Y(A1)

		move.b	WonderVars+DirectionX,d0
		ext.w	d0
		muls	#40,d0
		add.w	d0,bob_X(A1)

		lea	Default(pc),a0
		move.l	a0,bob_UserDataPtr(A1)

		move.l	a2,a0
		SYSCALL	RemBob
		rts

Default:	dc.w	0

**** FrageZeichen **********************************************************

FrageZeichenHandler:
		lea	WonderVars,a6
		add.l	#250,Score(A6)

		lea	TakeBonus(pc),a0
		moveq	#3,d0
		bsr	PlayFX

		moveq	#10,d0
		SYSCALL	Random				* Random 0-6
		lsl.w	#2,d0				* to Ptr
		lea	EventTab(pc),a2			* EventTab
		move.l	(A2,d0.w),a2			* Handler
		jmp	(A2)				* do it ...

**** ShopCollision **********************************************************

ShopColl:	lea	WonderVars,a6
		tst.b	ShopTimer(A6)
		bne	.SchonBesucht

		tst.b	HimmelFlag(A6)			* HimmelFlug
		bne	.SchonBesucht			* ja -->

		move.b	bob_Id(A1),d4
		btst	d4,ShopFlag(A6)
		bne	.SchonBesucht

		move.b	#-1,ShopTimer(A6)

		st.b	NoInt(a6)
		bsr	SoftScroll			* Bitplane eintragen


		moveq	#44,d0
		moveq	#96+8,d2
		bsr	HideRonny

		bsr	OpenMoneyWindow

		lea	ShopWindow(pc),a0		* Window
		lea	ViewBitmStr(pc),a1		* BitmapStructure
		bsr	CalcEdge
		bsr	OpenWindow			* Open ShoppyWindow
		move.l	d0,a4				* ShoppyWindow

		moveq	#8,d7				* Option

.Select:	move.l	Money(A6),d0
		bsr	PrintMoney

		move.l	d7,d0				* Option
		move.l	a4,a0				* Window
		lea	ShopOption(pc),a1		* Text
		bsr	SelectOption
		move.l	d0,d7				* New Option

		cmp.w	#8,d0				* Exit
		beq.s	.Exit				* Yes -->

		bset	d4,ShopFlag(A6)			* ShopFlag

		lea	ShopHandlerTab(pc),a1
		mulu	#6,d0
		move.l	(A1,d0.w),a2			* Handler

		move.w	4(A1,d0.w),d1			* Preis
		ext.l	d1
		cmp.l	Money(A6),d1
		ble.s	.EnoughMoney

		moveq	#40,d0				* Top Edge
		move.w	#270,d1				* Width
		moveq	#54,d2				* Height
		lea	NotEnoughMoney(pc),a0		* Text
		sub.l	a1,a1				* Handler
		bsr	Message
		bra.s	.Select				* Not enough Money -->

.EnoughMoney:	cmp.w	#2,d7
		blo.s	.FoundField		

		lea	Field1(A6),a1
		moveq	#4-1,d0
.CheckField:	tst.l	(A1)+
		beq.s	.FoundField			* kein Platz mehr
		dbf	d0,.CheckField			* frei -->

		moveq	#50,d0				* Top Edge
		move.w	#172,d1				* Width
		moveq	#44,d2				* Height
		lea	NoMorePlace(pc),a0		* Text
		sub.l	a1,a1				* Handler
		bsr	Message
		bra	.Select

.FoundField:	sub.l	d1,Money(A6)			* Sub Money
		jsr	(A2)
		bra	.Select
		
.Exit:		moveq	#100,d0
		lsl.l	#1,d0
		bsr	WaitRaster

		move.l	a4,a0
		bsr	CloseWindow
		move.l	a3,a0
		bsr	CloseWindow

		clr.b	NoInt(A6)

.SchonBesucht:	rts


*****************************************************************************

SHandler1:	moveq	#32,d0				* Health
		bsr	ChangeHealth			* erhöhen
		bra	ShowValue

SHandler2:	moveq	#32,d0				* Energy
		bsr	ChangeEnergy			* erhöhen
ShowValue:	moveq	#32-1,d2
.Loop:		bsr	DelayBlank
		bsr	UpDatePanel
		dbf	d2,.Loop
		rts

SHandler3:	lea	Gadget1Field(pc),a0
		bra	AddGadget			* Gadget hinzufügen

SHandler4:	lea	Gadget2Field(pc),a0
		bra	AddGadget			* Gadget hinzufügen

SHandler5:	lea	Gadget5Field(pc),a0
		bra	AddGadget			* Gadget hinzufügen

SHandler6:	lea	Gadget3Field(pc),a0
		bra	AddGadget			* Gadget hinzufügen

SHandler7:	lea	Gadget4Field(pc),a0
		bra	AddGadget			* Gadget hinzufügen

SHandler8:	add.l	#50*60*1,WonderVars+GameTimer
		rts
		
*****************************************************************************

SelectOption:	movem.l	d1-d7/a0-a6,-(sp)
		move.l	d0,d7
		move.l	a1,a4

.Loop:		move.l	a4,a2
		moveq	#0,d6				* Zeilenzähler
.TxtLoop:	move.l	(A2)+,d0
		beq.s	.LastTxt

		move.l	d0,a1
		move.b	#24,1(A1)			* TextFarbe
		cmp.w	d6,d7
		bne.s	.NotSelected

		move.b	#12,1(A1)			* TextFarbe

.NotSelected:	bsr	UpDatePanel			* Panel refresh

		bsr	Text				* Zeile schreiben
		addq.w	#1,d6				* Zeilenzähler++
		bra.s	.TxtLoop

.LastTxt:	move.l	#300*5,d0
		bsr	RasterDelay

		move.l	d0,-(sp)
		SYSCALL	GetKey
		move.l	(sp)+,d0

		bsr	CheckJoy			* JoyStickButton
		beq.s	.End				* Gedrückt -> Ende

		bsr	GetJoy				* JoyStick
		tst.w	d1				* Y-Richtung
		beq.s	.LastTxt			* keine Bewegung

		add.w	d1,d7
		tst.w	d7
		bpl.s	.TooLow

	;	moveq	#0,d7
		move.w	d6,d7
		subq	#1,d7

.TooLow:	cmp.w	d6,d7
		blt.s	.TooHigh

	;	move.w	d6,d7
	;	subq.w	#1,d7

		moveq	#0,d7

.TooHigh:	bra.s	.Loop

.End:		bsr	CheckJoy			* Warten bis er
		beq.s	.End				* loslässt

		move.w	d7,d0
		movem.l	(sp)+,d1-d7/a0-a6
		rts

*****************************************************************************

AddMoney:	move.l	a1,a0				* BonusBob
		SYSCALL	RemBob				* removen

		moveq	#10,d0
		SYSCALL	Random
		addq.l	#1,d0				* Zahl zwischen 1-10
AddMoney2:	add.l	d0,Money(A6)			* addieren
		rts

*****************************************************************************

SubMoney:	move.l	a1,a0				* BonusBob
		SYSCALL	RemBob				* removen

		moveq	#10,d0
		SYSCALL	Random
		addq.l	#1,d0				* Zahl zwischen 1-10

		sub.l	d0,Money(A6)			* abziehen
		bgt.s	.NotZero			* aber keine negativen
		clr.l	Money(A6)			* Zahlen zulassen
		moveq	#-1,d0
.NotZero:	rts
		
*****************************************************************************

SubScore:	move.l	a1,a0				* BonusBob
		SYSCALL	RemBob				* removen

		moveq	#10,d0
		SYSCALL	Random
		addq	#1,d0				* Zahl zwischen
		mulu	#100,d0				* 100-1000 abziehen
		sub.l	d0,Score(A6)			* aber keine negativen
		bgt.s	.NotZero			* Zahlen zulassen	
		clr.l	Score(A6)
.NotZero:	rts

*****************************************************************************

ChangeSong1:	movem.l	d0-d7/a0-a6,-(sp)
		moveq	#1,d0				* Song
		move.l	#FN_GAMESONG1,d1		* File
		bsr	ChangeIt
		move.w	#7,SongSpeed(A6)		* Speed
		movem.l	(sp)+,d0-d7/a0-a6		
		rts		

ChangeSong2:	movem.l	d0-d7/a0-a6,-(sp)
		moveq	#2,d0				* Song
		move.l	#FN_GAMESONG2,d1		* File
		bsr	ChangeIt

		move.w	#6,SongSpeed(A6)		* Speed
		movem.l	(sp)+,d0-d7/a0-a6
		rts

ChangeSong3:	movem.l	d0-d7/a0-a6,-(sp)
		moveq	#0,d0				* Song
		move.l	#FN_INTROSONG,d1		* File

		move.w	#6,SongSpeed(A6)		* Speed
		movem.l	(sp)+,d0-d7/a0-a6
		rts


ChangeIt:	movem.l	d0-d7/a0-a6,-(sp)
		move.l	d0,d3

		st.b	NoKeyFlag(A6)
		move.b	MusicFlag(A6),d2

		moveq	#MasterVolume,d0
		bsr	FadeOutSong			* ausblenden

		move.l	d1,d0				* File
		move.l	SongPtr,a0
		SYSCALL	ReadFile			* Load GameSongI
		
		move.l	d3,d0				* Song
		bsr	SetSound			* Start Sound

		move.b	d2,MusicFlag(A6)
		clr.b	NoKeyFlag(A6)

		movem.l	(sp)+,d0-d7/a0-a6
		rts

FadeOutSong:	movem.l	d0-d2,-(sp)
		move.w	d0,d2
		moveq	#%1111,d0			* Stimmen
		moveq	#50,d1				* Zeit
		bsr	LockVoices

.FadeOut:	move.l	#10*50,d0
		bsr	RasterDelay

		move.w	d2,aud0+audvol(A5)
		move.w	d2,aud1+audvol(A5)
		move.w	d2,aud2+audvol(A5)
		move.w	d2,aud3+audvol(A5)

		dbf	d2,.FadeOut

		st.b	MusicFlag(a6)			* Disable Sound

		movem.l	(sp)+,d0-d2
		rts


**************** Bobs *******************************************************

** FlaschenBobs für MenuShow ************************************************

BottleBob1:	SETDATA		0
		SETANIM		BottleAnim1
		SETANIMSPEED	3
		GOTO		BottleGlobal

BottleBob2:	SETDATA		0
		SETANIM		BottleAnim2
		SETANIMSPEED	5
		GOTO		BottleGlobal

BottleBob3:	SETDATA		0
		SETANIM		BottleAnim4
		SETANIMSPEED	5
BottleGlobal:	SETFLAGS	BOBF_NODOUBLE
		ENDE

BottleAnim1:	ANIMTO		45,40
		REMOVE

BottleAnim2:	ANIMTO		54,60
		REMOVE

BottleAnim4:	ANIMTO		46,51
		ANIMTO		43,40
		REMOVE

**** PanelBobs **************************************************************

NewKarteBobs:	SETDATA		Wegmarkierung,WonderVars+KarteBobBase
		SETFLAGS	BOBF_NOLIST|BOBF_NORESTORE|BOBF_NODOUBLE
		SETCLIP		0,0,352,257,CLIPF_ALL
		ENDE

**** PanelBobs **************************************************************

NewPanelBobs:	SETDATA		JobBob1,WonderVars+ImmerBobBase
		SETFLAGS	BOBF_NOLIST|BOBF_NORESTORE|BOBF_NODOUBLE
		ENDE

**** RonnyBob ***************************************************************

MyNewBob:	SETDATA		0
		SETANIM		WalkRight
		SETFLAGS	BOBF_NORESTORE|BOBF_NODRAW|BOBF_NOANIM|BOBF_NOMOVE
		SETANIMSPEED	4
		SETID		RONNY_ID
		SETHITMASK	RONNY_COLL
		SETMEMASK	RONNY_HITCOLL
		SETCOLLHANDLER	FallHandler
		ENDE

WalkLeft:	POKEB		WonderVars+WalkFlag,1
		dc.w		LWALK+1
		dc.w		LWALK+2
		dc.w		LWALK+3
		dc.w		LWALK+2
		dc.w		LWALK
		dc.w		LWALK+4
		dc.w		LWALK+5
		dc.w		LWALK+6
		dc.w		LWALK+5
		dc.w		LWALK+4
		LOOP

WalkRight:	POKEB		WonderVars+WalkFlag,1
		dc.w		RWALK
		dc.w		RWALK+1
		dc.w		RWALK+2
		dc.w		RWALK+3
		dc.w		RWALK+2
		dc.w		RWALK
		dc.w		RWALK+4
		dc.w		RWALK+5
		dc.w		RWALK+6
		dc.w		RWALK+5
		dc.w		RWALK+4
		LOOP

SprungLeft:	POKEB		WonderVars+WalkFlag,0
		dc.w		LSPRUNG
		dc.w		LSPRUNG+1
		dc.w		LSPRUNG+2
		dc.w		LSPRUNG+3
		dc.w		LSPRUNG+2
		dc.w		LSPRUNG+1
		dc.w		LSPRUNG
		ENDE

SprungRight:	POKEB		WonderVars+WalkFlag,0
		dc.w		RSPRUNG
		dc.w		RSPRUNG+1
		dc.w		RSPRUNG+2
		dc.w		RSPRUNG+3
		dc.w		RSPRUNG+2
		dc.w		RSPRUNG+1
		dc.w		RSPRUNG
		ENDE

DuckenLeft:	POKEB		WonderVars+WalkFlag,0
		dc.w		LDUCK+2
		dc.w		LDUCK+1
DuckenLeft2:	dc.w		LDUCK
		dc.w		LDUCK
		dc.w		LDUCK
		dc.w		LDUCK+1
		dc.w		LDUCK+2
		POKEB		WonderVars+DuckFlag,0
		ENDE

DuckenRight:	POKEB		WonderVars+WalkFlag,0
		dc.w		RDUCK+2
		dc.w		RDUCK+1
DuckenRight2:	dc.w		RDUCK
		dc.w		RDUCK
		dc.w		RDUCK
		dc.w		RDUCK+1
		dc.w		RDUCK+2
		POKEB		WonderVars+DuckFlag,0
		ENDE

StairUp:	POKEB		WonderVars+WalkFlag,1
		dc.w		TREPPE+0
		dc.w		TREPPE+1
		dc.w		TREPPE+2
		LSIGNAL		1
		dc.w		TREPPE+1
		LSIGNAL		1
		dc.w		TREPPE+0
		dc.w		TREPPE+0
		dc.w		TREPPE+3
		dc.w		TREPPE+4
		LSIGNAL		1
		dc.w		TREPPE+3
		LSIGNAL		1
		dc.w		TREPPE+0
		LOOP

StairUpMove:	LWAIT		1
		UP		1
		LWAIT		1
		UP		1
		LWAIT		1
		UP		1
		LWAIT		1
		UP		1
		LOOP

StairDown:	POKEB		WonderVars+WalkFlag,1
		dc.w		TREPPE+0
		LSIGNAL		1
		dc.w		TREPPE+1
		LSIGNAL		1
		dc.w		TREPPE+2
		dc.w		TREPPE+1
		dc.w		TREPPE+0
		dc.w		TREPPE+0
		LSIGNAL		1
		dc.w		TREPPE+3
		LSIGNAL		1
		dc.w		TREPPE+4
		dc.w		TREPPE+3
		dc.w		TREPPE+0
		LOOP

StairDownMove:	LWAIT		1
		DOWN		1
		LWAIT		1
		DOWN		1
		LWAIT		1
		DOWN		1
		LWAIT		1
		DOWN		1
		LOOP

HimmelMove:	UP		1
		CPUJUMP		MoveBallon,WonderVars
		LOOP

FallAnimLeft:	ANIMTO		LFALL,LFALL+10
		CPUJUMP		AddSternliBob,WonderVars

		DELAY		36

		ANIMTO		LFALL+9,LFALL
		CPUJUMP		SetHimmelMove,WonderVars
		POKEB		WonderVars+SturzFlag,0
		DELAY		2
		ENDE

FallAnimRight:	ANIMTO		RFALL,RFALL+10
		CPUJUMP		AddSternliBob,WonderVars

		DELAY		36

		ANIMTO		RFALL+9,RFALL
		CPUJUMP		SetHimmelMove,WonderVars
		POKEB		WonderVars+SturzFlag,0
		DELAY		2
		ENDE

NewSternliBob:	SETDATA		SternliBob,WonderVars+ImmerBobBase
		SETANIM		SternliAnim
		SETANIMSPEED	2
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETPRI		70
		ENDE

SternliAnim:	FOR		4
		 CPUJUMP	Play8SVX,RonnyKO
		 ANIMTO		0,8
		NEXT
		REMOVE

NewBallonBob:	SETDATA		BallonBob,WonderVars+ImmerBobBase
		SETANIM		BallonAnim
		SETANIMSPEED	4
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETPRI		80
		ENDE

BallonAnim:	ANIMTO		0,3
		ENDE

BallonMove:	UP		1
		LOOP

BallonAnim2:	SETMOVE		BallonMove
		ANIMTO		3,0
		REMOVE
		ENDE

**** SchussBob **************************************************************

NewSchussBob:	SETDATA		SchussBob,WonderVars+ImmerBobBase
		SETANIM		NewSchussAnim
		SETMOVE		SchussMove
		SETANIMSPEED	2
		SETMOVESTEP	6
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETPRI		-32
		SETHITMASK	SHOOT_COLL
		ENDE

NewSchussAnim:	ANIMTO		0,7
		LOOP

SchussMove:	RIGHT		16
		REMOVE
		ENDE
		
****  Explosions Bob ********************************************************

NewExBob:	SETDATA		ExplosionsBob,WonderVars+ImmerBobBase
		SETANIM		NewExAnim
		SETANIMSPEED	2
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETPRI		64
		ENDE

NewExAnim:	ANIMTO		0,15
		REMOVE
		ENDE

**** Debug Bob **************************************************************

NewDebugBob:	SETDATA		0
		SETX		-100
		SETY		100
		SETCLIP		0,0,0,0,CLIPF_ALL
		ENDE

**** Extra's ****************************************************************

ImmerHonkBob:	SETDATA		HonkBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Bonus2Handler
		GOTO		ExtraGlobal

ImmerJumpBob:	SETDATA		JumpBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Bonus1Handler
		GOTO		ExtraGlobal

ImmerBombBob:	SETDATA		BombBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Bonus4Handler
		GOTO		ExtraGlobal

ImmerCheeseBob:	SETDATA		CheeseBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Bonus3Handler
		GOTO		ExtraGlobal

ImmerMagnetoBob:
		SETDATA		MagnetoBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Bonus5Handler
ExtraGlobal:	SETUSERFLAGS	BOBF_REMOVE|BOBF_COLLECTABLE
		SETMEMASK	RONNY_COLL
		ENDE

**** FrageZeichenBobs *******************************************************

ImmerFrageZeichen:
		SETDATA		FrageZeichen0,WonderVars+ImmerBobBase
		SETANIM		FrageZeichenAnim
		SETCOLLHANDLER	FrageZeichenHandler
		SETANIMSPEED	2
		GOTO		ExtraGlobal

**** KistenBobs *************************************************************

ImmerCubeBob1:	SETDATA		KistenBob1,WonderVars+ImmerBobBase
		GOTO		GlobalCube

ImmerCubeBob2:	SETDATA		KistenBob2,WonderVars+ImmerBobBase
		GOTO		GlobalCube

ImmerCubeBob3:	SETDATA		KistenBob3,WonderVars+ImmerBobBase
		GOTO		GlobalCube

ImmerCubeBob4:	SETDATA		KistenBob4,WonderVars+ImmerBobBase
GlobalCube:	SETANIM		NewKistenAnim
		SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_COLLECTABLE
		SETPRI		32
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	CubeColl
		ENDE

NewKistenAnim:	ANIMTO		0,4
		LOOP

****  GetJobBob *************************************************************

ImmerGetJobBob:	SETDATA		WolkenBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job1Handler
		SETANIM		NewLostAnim
		GOTO		GetJobGlobal2

ImmerGetJobBob2:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job2Handler
		GOTO		GetJobGlobal

ImmerGetJobBob3:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job3Handler
		GOTO		GetJobGlobal

ImmerGetJobBob4:
		SETDATA		WolkenBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job4Handler
		SETANIM		NewLostAnim
		GOTO		GetJobGlobal2

ImmerGetJobBob5:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job5Handler
		GOTO		GetJobGlobal

ImmerGetJobBob6:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job6Handler
		GOTO		GetJobGlobal

ImmerGetJobBob7:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job7Handler
		GOTO		GetJobGlobal

ImmerGetJobBob8:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job8Handler
		GOTO		GetJobGlobal

GetJobGlobal:	SETANIM		NewGetJobAnim
GetJobGlobal2:	SETANIMSPEED	2
		SETPRI		68
		SETUSERFLAGS	BOBF_REMOVE
		SETMEMASK	RONNY_COLL
		ENDE

ImmerGetJobBob9:
		SETDATA		WolkenBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job9Handler
		SETANIM		NewLostAnim
		GOTO		GetJobGlobal2

ImmerGetJobBob10:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job10Handler
		GOTO		GetJobGlobal

ImmerGetJobBob11:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job11Handler
		GOTO		GetJobGlobal

ImmerGetJobBob12:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job12Handler
		GOTO		GetJobGlobal

ImmerGetJobBob13:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job13Handler
		GOTO		GetJobGlobal

ImmerGetJobBob14:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job14Handler
		GOTO		GetJobGlobal

ImmerGetJobBob15:
		SETDATA		WolkenBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job15Handler
		SETANIM		NewLostAnim
		GOTO		GetJobGlobal2

ImmerGetJobBob16:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job16Handler
		GOTO		GetJobGlobal

ImmerGetJobBob17:
		SETDATA		WolkenBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job17Handler
		SETANIM		NewLostAnim
		GOTO		GetJobGlobal2

ImmerGetJobBob18:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job18Handler
		GOTO		GetJobGlobal

ImmerGetJobBob19:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job19Handler
		GOTO		GetJobGlobal

ImmerGetJobBob20:
		SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETCOLLHANDLER	Job20Handler
		GOTO		GetJobGlobal


NewGetJobSub:	SETDATA		GetJobBob,WonderVars+ImmerBobBase
		SETIMAGE	9
		ENDE

NewGetJobAnim:	ADDDAUGHTER	NewGetJobSub,3,29
		FOREVER
		 ANIMTO		0,8
		NEXT

NewLostAnim:	SETANIMSPEED	3
		ANIMTO		0,13
		LOOP

*****  Shop Bobs ************************************************************

ImmerShopBob1:	SETDATA		ShopBob1,WonderVars+ImmerBobBase
		SETID		SHOP1_ID
		SETUSERFLAGS	BOBF_REMOVE
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	ShopColl
		SETPRI		-51
		ENDE


**** InvisibleCoinBob *******************************************************

ImmerSandUhr:	SETDATA		SandUhr0,WonderVars+ImmerBobBase
		SETANIM		1$
		SETANIMSPEED	3
		SETCOLLHANDLER	SandUhrColl
		GOTO		BonusGlobal

1$:		ANIMTO		0,5
		LOOP

**** BonusBob1 **************************************************************

ImmerBonusBob1:	SETDATA		BonusBob1,WonderVars+ImmerBobBase
		SETANIM		BonusBob1Anim
		SETANIMSPEED	3
		SETCOLLHANDLER	HealthColl
		GOTO		BonusGlobal

FrageZeichenAnim:
BonusBob1Anim:	ANIMTO		0,19
		LOOP

**** BonusBob3 **************************************************************

ImmerBonusBob3:	SETDATA		BonusBob3,WonderVars+ImmerBobBase
		SETANIM		BonusBob3Anim
		SETCOLLHANDLER	EnergyColl
BonusGlobal:	SETUSERFLAGS	BOBF_REMOVE|BOBF_COLLECTABLE
		SETMEMASK	RONNY_COLL
		ENDE


BonusBob3Anim:	ANIMTO		0,15
		dc.w		15,15,15
		LOOP

**** InvisibleCoinBob *******************************************************

ImmerEmptyBob:	SETDATA		EmptyBob,WonderVars+ImmerBobBase
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	EmptyColl
ImmerGlobal:	SETUSERFLAGS	BOBF_REMOVE
		SETCLIP		0,0,0,0,CLIPF_ALL
		ENDE


**** BusStopBob ****************************************************************

ImmerBusStop1:	SETDATA		BusStop1,WonderVars+ImmerBobBase
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	ReachedBusStop
		GOTO		ImmerGlobal


ImmerBusStop2:	SETDATA		BusStop2,WonderVars+ImmerBobBase
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	ReachedBusStop
		GOTO		ImmerGlobal

ImmerBusStop3:	SETDATA		BusStop3,WonderVars+ImmerBobBase
		GOTO		ImmerGlobal

**** CloudBob ****************************************************************

**** CoinBob ****************************************************************

ImmerCoinBob:	SETDATA		CoinBob,WonderVars+ImmerBobBase
		SETANIM		NewCoinAnim
		SETMOVE		NewCoinMove
		SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_COLLECTABLE
		SETMEMASK	RONNY_COLL
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETCOLLHANDLER	CoinColl
		ENDE

NewCoinAnim:	ANIMTO		9,0
		LOOP

NewCoinMove:	CPUJUMP		Coin,0			* Init
		FOR		25000
		 CPUJUMP	Coin,1
		 DELAY		1
		NEXT
		CPUJUMP		CommonRemBob,0
		ENDE

Coin:		lea		WonderVars,a6
		lea		bob_UserData(A0),a1	* FallDistanz
		tst.b		d0			* Init
		bne.s		.NoInit			* no -->

		move.l		bob_UserDataPtr(A0),a2
		move.b		(A2),ud_XMove(A1)	* X-Move
		move.b		#1,ud_FallingDist(A1)	* StartFallDistanz
		rts
	
.NoInit:	move.l		a0,a2			* Bob
		move.b		ud_XMove(A1),d2

		cmp.w		#$80,d2
		beq.s		.NoX
		ext.w		d2
		add.w		d2,bob_X(A0)

.NoX:		move.b		ud_FallingDist(A1),d2	* FallDist
		ext.w		d2
	
		move.w		bob_X(A0),d0
		move.w		bob_Y(A0),d1
		add.w		d2,d1
		cmp.w		#195,d1
		blt.s		.ImBild

		bra		CommonRemBob
		
.ImBild:	tst.w		d2
		ble.s		3$

		bsr		GetElem
		bsr		GetInfo
		btst		#LEVB_StandFlag,d0
		bne.s		1$

3$:		add.w		d2,bob_Y(a2)
		move.b		JumpCnt+3(a6),d0
		and.b		#$F,d0			* Increment Speed
		bne.s		1$
		cmp.b		#12,ud_FallingDist(A1)
		beq.s		6$
		addq.b		#1,ud_FallingDist(A1)
6$:		rts


1$:		;move.w		bob_Y(A2),d3
		;and.w		#$F,d3
		;cmp.w		#12,d3
		;bls.s		3$

		cmp.b		#1,ud_FallingDist(A1)	* Bob am Boden
		beq.s		2$			* ja -->
		
		add.w		#15,bob_Y(A0)
		and.w		#~15,bob_Y(A0)
		subq.w		#1,bob_Y(A0)
		
		subq.b		#2,ud_FallingDist(A1)	* Erniedrigen

		cmp.b		#$80,ud_XMove(A1)
		bne.s		7$

		addq.b		#2,ud_FallingDist(A1)

7$:		move.b		ud_FallingDist(A1),d0	* Distanz
		neg.b		ud_FallingDist(A1)	* nach oben

		lea		Aufprall(pc),a0		* Fx
		move.w		sfx_Volume(A0),d1	* OldVolume

		lsl.w		#2,d0			* 8
		cmp.w		#64,d0			* >64
		bls.s		5$			* nein -->
		moveq		#64,d0	
5$:		cmp.w		#20,d0			* <20
		bgt.s		4$			* nein -->
		moveq		#20,d0
4$:		move.w		d0,sfx_Volume(A0)

		moveq		#3,d0
		bsr		PlayFX
		move.w		d1,sfx_Volume(A0)
2$:		rts

*****************************************************************************

ImmerHaus13Bob:	SETDATA		HausNummer13Bob,WonderVars+ImmerBobBase
		SETID		HAUS13_ID
		SETUSERFLAGS	BOBF_REMOVE
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		SETPRI		-50
		ENDE


ImmerHaus64Bob:	SETDATA		HausNummer64Bob,WonderVars+ImmerBobBase
		SETID		HAUS1_ID
		SETUSERFLAGS	BOBF_REMOVE
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		SETPRI		-50
		ENDE



Job1Done:	lea	WonderVars,a6
		st.b	NoInt(A6)

		move.b	bob_Id(A1),d4			* This Bobs ID
		lea	Field1(A6),a1			* Start der Fields
		moveq	#4-1,d1				* NumFields

.SearchField:	tst.l	(A1)+				* Field belegt
		beq.s	.FieldEmpty			* Nein -->

		move.l	-4(A1),a0			* FieldEntry

		btst	#FDB_JOB,fd_Flags+1(A0)		* Job ?
		bne.s	.GotField			* ja -->

		btst	#FDB_PROPERTIE,fd_Flags+1(A0)	* Job ?
		beq.s	.FieldEmpty

.GotField:	ext.w	d4
		cmp.w	fd_HausNummer(A0),d4
		bne.s	.FieldEmpty

		move.w	fd_Money2(A0),d2		* Money
		ext.l	d2
		add.l	d2,Money(A6)

		bsr	RemoveGadget

		move.l	a0,a2				* Field

		move.l	fd_Text2(a2),a0
		move.w	(a0)+,d0			* TopEdge
		move.w	(A0)+,d1			* Width
		move.w	(a0)+,d2			* Height
		sub.l	a1,a1				* Handler

		bsr	HideRonny			* Sprite verstecken
		bsr	Message				* Message ausgeben

		move.l	fd_Handler2(A2),a0
		move.l	a0,d0
		beq.s	.End

		jsr	(A0)

		bra.s	.End

.FieldEmpty:	dbf	d1,.SearchField
.End:		clr.b	NoInt(A6)
		rts

*****************************************************************************

		*** BitmStructures ***

ViewBitmStr:	dc.w	ScrWidth			* 0 ScrWidth in Bytes
		dc.w	ScrHeight			* 2 ScrHeight in Pixels
		dc.b	0				* 4 Pad
		dc.b	ScrDepth			* 5 Depth
		dc.w	0				* 6 Flags
		dc.l	0,0,0,0,0,0			* 5 Pointers to Bitmap

DrawBitmStr:	dc.w	ScrWidth			* 0 ScrWidth in Bytes
		dc.w	ScrHeight			* 2 ScrHeight in Pixels
		dc.b	0				* 4 Pad
		dc.b	ScrDepth			* 5 Depth
		dc.w	0				* 6 Flags
		dc.l	0,0,0,0,0,0			* 5 Pointers to Bitmap

PanelBitmStr:	dc.w	40				* 0 ScrWidth in Bytes
		dc.w	32				* 2 ScrHeight in Pixels
		dc.b	0				* 4 Pad
		dc.b	6				* 5 Depth
		dc.w	0				* 6 Flags
		dc.l	0,0,0,0,0,0			* 5 Pointers to Bitmap

FxPanelBitmStr:	dc.w	40				* 0 ScrWidth in Bytes
		dc.w	32				* 2 ScrHeight in Pixels
		dc.b	0				* 4 Pad
		dc.b	1				* 5 Depth
		dc.w	0				* 6 Flags
		dc.l	0,0,0,0,0,0			* 5 Pointers to Bitmap

		*** Screens & Windows ***

NewTitelScreen:	dc.w	-16				* Left Edge
		dc.w	-16				* Top Edge
		dc.w	352				* Width
		dc.w	290				* Height
		dc.w	6				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

NewMenuScreen:	dc.w	-16				* Left Edge
		dc.w	-16				* Top Edge
		dc.w	352				* Width
		dc.w	290				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

NewLabelScreen:	dc.w	-16				* Left Edge
		dc.w	-16-4				* Top Edge
		dc.w	352				* Width
		dc.w	290				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

HiScoreScreen:	dc.w	-16				* Left Edge
		dc.w	276				* Top Edge
		dc.w	352				* Width
		dc.w	290				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

EndScreen:	dc.w	-16				* Left Edge
		dc.w	276				* Top Edge
		dc.w	352				* Width
		dc.w	290				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

HowToPlayScreen:dc.w	-16				* Left Edge
		dc.w	276				* Top Edge
		dc.w	352				* Width
		dc.w	232				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

HowToPlayScreen2:
		dc.w	0				* Left Edge
		dc.w	276				* Top Edge
		dc.w	320				* Width
		dc.w	121				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

HowToPlayScreen3:
		dc.w	0				* Left Edge
		dc.w	276				* Top Edge
		dc.w	320				* Width
		dc.w	52				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

NewKarteScreen:	dc.w	-16				* Left Edge
		dc.w	-2				* Top Edge
		dc.w	352				* Width
		dc.w	257				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

NewStarScreen:	dc.w	0				* Left Edge
		dc.w	272				* Top Edge
		dc.w	320				* Width
		dc.w	256				* Height
		dc.w	6				* Depth
		dc.w	HAM				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

NewBusScreen:	dc.w	72				* Left Edge
		dc.w	36				* Top Edge
		dc.w	192				* Width
		dc.w	183				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

PresentsScreen:	dc.w	124				* Left Edge
		dc.w	118				* Top Edge
		dc.w	80				* Width
		dc.w	20				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

ProductionScreen:
		dc.w	110				* Left Edge
		dc.w	118				* Top Edge
		dc.w	96				* Width
		dc.w	9				* Height
		dc.w	5				* Depth
		dc.w	0				* ViewModes
		dc.l	0				* BitmStr
		dc.l	0				* ColorPalette

NewStarWindow:	dc.w	0				* Left Edge	
		dc.w	0				* Top Edge
		dc.w	192				* Width in Pixels				
		dc.w	183				* Height in Pixels
		dc.b	0				* APen
		dc.b	0				* BPen
		dc.w	WNF_NOBACKSAVE+WNF_BORDERLESS	* WindowFlags
		dc.w	DM_JAM				* DrawMode
		dc.l	0				* This Windows Titel
		dc.l	0				* Font

NewEndWindow:	dc.w	12				* Left Edge	
		dc.w	12+4				* Top Edge
		dc.w	326				* Width in Pixels				
		dc.w	92				* Height in Pixels
		dc.b	27				* APen
		dc.b	10				* BPen
		dc.w	0				* WindowFlags
		dc.w	0				* DrawMode
		dc.l	0				* This Windows Titel
		dc.l	0				* Font

NewEndWindow2:	dc.w	32				* Left Edge	
		dc.w	12+4				* Top Edge
		dc.w	282				* Width in Pixels				
		dc.w	92				* Height in Pixels
		dc.b	27				* APen
		dc.b	10				* BPen
		dc.w	0				* WindowFlags
		dc.w	0				* DrawMode
		dc.l	0				* This Windows Titel
		dc.l	0				* Font

NewPanelWindow:	dc.w	0				* Left Edge	
		dc.w	0				* Top Edge
		dc.w	320				* Width in Pixels				
		dc.w	32				* Height in Pixels
		dc.b	1				* APen
		dc.b	0				* BPen
		dc.w	WNF_NOBACKSAVE+WNF_BORDERLESS+WNF_FASTTEXT	* WindowFlags
		dc.w	DM_JAM				* DrawMode
		dc.l	0				* This Windows Titel
		dc.l	NewPanelFont			* Font

NewMenuWindow:	dc.w	0				* Left Edge	
		dc.w	0				* Top Edge
		dc.w	352				* Width in Pixels				
		dc.w	290				* Height in Pixels
		dc.b	17				* APen
		dc.b	0				* BPen
		dc.w	WNF_NOBACKSAVE+WNF_BORDERLESS	* WindowFlags
		dc.w	DM_OR				* DrawMode
		dc.l	0				* This Windows Titel
		dc.l	NewFont				* Font

GameOverWindow:	dc.w	0				* Left Edge	
		dc.w	32				* Top Edge
		dc.w	160				* Width in Pixels				
		dc.w	60				* Height in Pixels
		dc.b	12				* APen
		dc.b	16				* BPen
		dc.w	0				* WindowFlags
		dc.w	DM_OR				* DrawMode
		dc.l	GameOverText			* This Windows Titel
		dc.l	0				* Font

MsgWindow:	dc.w	0				* Left Edge	
		dc.w	32				* Top Edge
		dc.w	160				* Width in Pixels				
		dc.w	60				* Height in Pixels
		dc.b	12				* APen
		dc.b	16				* BPen
		dc.w	0				* WindowFlags
		dc.w	DM_OR				* DrawMode
		dc.l	RonnyText			* This Windows Titel
		dc.l	0				* Font

HiScoreWindow:	dc.w	86				* Left Edge	
		dc.w	48				* Top Edge
		dc.w	180				* Width in Pixels
		dc.w	114				* Height in Pixels
		dc.b	12				* APen
		dc.b	16				* BPen
		dc.w	0				* WindowFlags
		dc.w	DM_OR				* DrawMode
		dc.l	HiText				* This Windows Titel
		dc.l	0				* Font

ShopWindow:	dc.w	0				* Left Edge
		dc.w	44				* Top Edge
		dc.w	198				* Width in Pixels
		dc.w	96+8				* Height in Pixels
		dc.b	12				* APen
		dc.b	15				* BPen
		dc.w	0				* WindowFlags
		dc.w	DM_OR				* DrawMode
		dc.l	ShopTitelText			* This Windows Titel
		dc.l	0				* Font

ShopWindow2:	dc.w	0				* Left Edge
		dc.w	16				* Top Edge
		dc.w	142				* Width in Pixels
		dc.w	16				* Height in Pixels
		dc.b	12				* APen
		dc.b	15				* BPen
		dc.w	0				* WindowFlags
		dc.w	DM_OR				* DrawMode
		dc.l	0				* This Windows Titel
		dc.l	0				* Font

		*** Font ***

NewFont:	dc.w	15				* FontWidth (NonProportional Print)
		dc.w	16				* FontHeight
		dc.w	0				* SpaceWidth
		dc.w	1				* Distance beetwen Chars
		dc.w	0 ;FOF_NOPROP			* FontFlags (NOPROP)
		dc.l	0				* FontBob
		dc.l	AsciiTab			* AsciiTab

NewPanelFont:	dc.w	7				* FontWidth (NonProportional Print)
		dc.w	8				* FontHeight
		dc.w	0				* SpaceWidth
		dc.w	1				* Distance beetwen Chars
		dc.w	FOF_NOPROP			* FontFlags (NOPROP)
		dc.l	0				* FontBob
		dc.l	PanelAsciiTab			* AsciiTab


************************************************************************************
* SuperJump
Gadget1Field:	dc.w	0				* LevelX (unused)
		dc.w	250				* Score +=250
		dc.w	1				* Money +=1
		dc.w	0
		dc.w	8				* BobNummer
		dc.w	0				* Flags
		dc.l	0				* Name (unused)
		dc.l	0
		dc.l	Gadget1Handler			* Handler

* NoCollision
Gadget2Field:	dc.w	0				* LevelX (unused)
		dc.w	250				* Score +=100
		dc.w	1				* Money +=1
		dc.w	0
		dc.w	6				* BobNummer
		dc.w	0				* Flags
		dc.l	0				* Name (unused)
		dc.l	0
		dc.l	Gadget2Handler			* Handler
* Paralize
Gadget3Field:	dc.w	0				* LevelX (unused)
		dc.w	250				* Score +=100
		dc.w	3				* Money +=3
		dc.w	0
		dc.w	9				* BobNummer
		dc.w	0				* Flags
		dc.l	0				* Name (unused)
		dc.l	0
		dc.l	Gadget3Handler			* Handler
* Sneeze
Gadget4Field:	dc.w	0				* LevelX (unused)
		dc.w	100				* Score +=100
		dc.w	5				* Money +=5
		dc.w	0
		dc.w	7				* BobNummer
		dc.w	0				* Flags
		dc.l	0				* Name (unused)
		dc.l	0
		dc.l	Gadget4Handler			* Handler
* Collect
Gadget5Field:	dc.w	0				* LevelX (unused)
		dc.w	100				* Score +=100
		dc.w	2				* Money +=2
		dc.w	0
		dc.w	5				* BobNummer
		dc.w	0				* Flags
		dc.l	0				* Name (unused)
		dc.l	0
		dc.l	Gadget5Handler			* Handler

Job1Field:	dc.w	HAUS1_ID			* HausID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	50				* Money
		dc.w	0				* BobNummer
		dc.w	FDF_PROPERTIE			* Flags
		dc.l	Job1Text			* Text
		dc.l	Job1Text2			* Text
		dc.l	0				* Handler
		dc.l	0

Job2Field:	dc.w	LADY1_ID			* HausID
		dc.w	2500				* Score
		dc.w	30				* Money
		dc.w	0				* Money
		dc.w	3				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job2Text			* Name
		dc.l	Job2Text2			* Name
		dc.l	0				* Handler
		dc.l	Job3Handler			* Handler2

Job3Field:	dc.w	LADY2_ID			* HausID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	35				* Money
		dc.w	3				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	0				* Name
		dc.l	Job3Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job4Field:	dc.w	HAUS13_ID			* HausID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	35				* Money
		dc.w	4				* BobNummer
		dc.w	FDF_PROPERTIE			* Flags
		dc.l	Job4Text			* Name
		dc.l	Job4Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job5Field:	dc.w	HAUS1_ID			* HausID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	40				* Money
		dc.w	0				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job5Text			* Name
		dc.l	Job5Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job6Field:	dc.w	LADY1_ID			* HausID
		dc.w	2500				* Score
		dc.w	12				* Money
		dc.w	0				* Money
		dc.w	3				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job6Text			* Name
		dc.l	Job6Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job7Field:	dc.w	HERR1_ID			* HausID
		dc.w	2500				* Score
		dc.w	20				* Money
		dc.w	0				* Money
		dc.w	4				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job7Text			* Name
		dc.l	Job7Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job8Field:	dc.w	HERR2_ID			* HausID
		dc.w	2500				* Score
		dc.w	20				* Money
		dc.w	0				* Money
		dc.w	2				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job8Text			* Name
		dc.l	Job8Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job9Field:	dc.w	LADY1_ID			* HausID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	30				* Money
		dc.w	3				* BobNummer
		dc.w	FDF_PROPERTIE			* Flags
		dc.l	Job9Text			* Name
		dc.l	Job9Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job10Field:	dc.w	LADY2_ID			* HausID
		dc.w	2500				* Score
		dc.w	15				* Money
		dc.w	0				* Money
		dc.w	2				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job10Text			* Name
		dc.l	Job10Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job11Field:	dc.w	LADY3_ID			* HausID
		dc.w	2500				* Score
		dc.w	10				* Money
		dc.w	30				* Money
		dc.w	4				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job11Text			* Name
		dc.l	Job11Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job12Field:	dc.w	LADY1_ID			* ID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	30				* Money
		dc.w	4				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job12Text			* Name
		dc.l	Job12Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job13Field:	dc.w	LADY2_ID			* ID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	35				* Money
		dc.w	3				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job13Text			* Name
		dc.l	Job13Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job14Field:	dc.w	LADY1_ID			* ID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	35				* Money
		dc.w	3				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job14Text			* Name
		dc.l	Job14Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job15Field:	dc.w	LADY2_ID			* ID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	35				* Money
		dc.w	4				* BobNummer
		dc.w	FDF_PROPERTIE			* Flags
		dc.l	Job15Text			* Name
		dc.l	Job15Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job16Field:	dc.w	HERR1_ID			* ID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	30				* Money
		dc.w	2				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job16Text			* Name
		dc.l	Job16Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job17Field:	dc.w	LADY1_ID			* ID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	15				* Money
		dc.w	4				* BobNummer
		dc.w	FDF_PROPERTIE			* Flags
		dc.l	Job17Text			* Name
		dc.l	Job17Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job18Field:	dc.w	LADY2_ID			* ID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	30				* Money
		dc.w	4				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job18Text			* Name
		dc.l	Job18Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job19Field:	dc.w	LADY1_ID			* ID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	20				* Money
		dc.w	3				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job19Text			* Name
		dc.l	Job19Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

Job20Field:	dc.w	LADY2_ID			* ID
		dc.w	2500				* Score
		dc.w	0				* Money
		dc.w	20				* Money
		dc.w	4				* BobNummer
		dc.w	FDF_JOB				* Flags
		dc.l	Job20Text			* Name
		dc.l	Job20Text2			* Name
		dc.l	0				* Handler
		dc.l	0				* Handler

		CNOP	0,2

************************************************************************************

	IFND	GERMAN
		INCLUDE	"english.i"
	ENDC
	IFD	GERMAN
		INCLUDE	"deutsch.i"
	ENDC
		
************************************************************************************

FxList:		dc.l	40,BottleBob1			* Time/Bob
		dc.w	140,91				* X/Y
		dc.l	80,BottleBob1
		dc.w	76,49
		dc.l	110,BottleBob2
		dc.w	108,120
		dc.l	150,BottleBob1
		dc.w	124,133
		dc.l	190,BottleBob1
		dc.w	156,175
		dc.l	230,BottleBob3
		dc.w	220,133
		dc.l	280,BottleBob1
		dc.w	76,175
		dc.l	320,BottleBob2
		dc.w	172,36
;		dc.l	365,BottleBob1
;		dc.w	268,91
		dc.l	410,BottleBob3
		dc.w	108,133
		dc.l	455,BottleBob1
		dc.w	140,175
		dc.l	500,BottleBob2
		dc.w	172,78
		dc.l	550,BottleBob1
		dc.w	268,133
		dc.l	590,BottleBob2
		dc.w	220,36
		dc.l	630,BottleBob3
		dc.w	156,175
		dc.l	670,BottleBob1
		dc.w	76,91
		dc.l	0,FxList

	******  AsciiTab  ******

AsciiTab:	dc.b	  0,39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,37,42,0
		;	    !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /
		dc.b	 1, 2, 3, 4, 5, 6, 7, 8, 9,10, 0, 0, 0, 0, 0,38
		;	 0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?
		dc.b	 0,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25
		;	 @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O
		dc.b	26,27,28,29,30,31,32,33,34,35,36
		;	 P  Q  R  S  T  U  V  W  X  Y  Z
		dc.b	 0, 0, 0, 0, 0, 0
		;	 [  \  ]  ^  _  `
		dc.b	11,12,13,14,15,16,17,18,19,20,21,22,23,24,25
		;	 a  b  c  d  e  f  g  h  i  j  k  l  m  n  o
		dc.b	26,27,28,29,30,31,32,33,34,35,36,11,11,11,11,11
		;	 p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~  
		dc.b	52,53,40,41,42,43,44,45

PanelAsciiTab:	dc.b	 10,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		;	    !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /
		dc.b	 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11
		;	 0  1  2  3  4  5  6  7  8  9, :

		CNOP	0,2

****************************************************************************

EventTab:	dc.l	EnergyColl
		dc.l	Bonus1Handler
		dc.l	Bonus3Handler
		dc.l	AddMoney
		dc.l	Bonus4Handler
		dc.l	HealthColl
		dc.l	Bonus5Handler
		dc.l	Bonus2Handler
		dc.l	HealthColl
		dc.l	EnergyColl

****************************************************************************

JobOption:	dc.l	JTxt1
		dc.l	JTxt2
		dc.l	JTxt3
		dc.l	0

JobOption2:	dc.l	JTxt5
		dc.l	JTxt6
		dc.l	0

ShopOption:	dc.l	STxt1
		dc.l	STxt2
		dc.l	STxt3
		dc.l	STxt4
		dc.l	STxt5
		dc.l	STxt6
		dc.l	STxt7
		dc.l	STxt8
		dc.l	STxt9
		dc.l	0

EndOption:	dc.l	ETxt1
		dc.l	ETxt2
		dc.l	0

ShopHandlerTab:	dc.l	SHandler1
		dc.w	5
		dc.l	SHandler2
		dc.w	5
		dc.l	SHandler3
		dc.w	3
		dc.l	SHandler4
		dc.w	3
		dc.l	SHandler5
		dc.w	10
		dc.l	SHandler6
		dc.w	3
		dc.l	SHandler7
		dc.w	5
		dc.l	SHandler8
		dc.w	10

****************************************************************************

LevelTab:

* Level 1 (Stadt I einfach)
		dc.l	FN_CHAR1			* CharacterSet
		dc.l	FN_LEVEL3			* LevelDaten
		dc.l	FN_LEVEL3BOB			* BobFile
		dc.l	Flags1				* Flags
		dc.l	EnemyList3-sb_SIZEOF
		dc.l	EnemyList3			* EnemyList
		dc.l	Level3BobTab
		dc.l	Level3ColorMap
		dc.l	LoadClouds
		dc.w	CLF_AUTOMOVE
		dc.w	174
		dc.l	0	;ChangeSong1

* Level 2 (U'grund)
		dc.l	FN_CHAR5			* CharacterSet
		dc.l	FN_LEVEL5			* LevelDaten
		dc.l	FN_LEVEL5BOB			* BobFile
		dc.l	Flags5				* Flags
		dc.l	EnemyList5-sb_SIZEOF
		dc.l	EnemyList5			* EnemyList
		dc.l	Level5BobTab
		dc.l	Level5ColorMap
		dc.l	LoadStein
		dc.w	0
		dc.w	158
		dc.l	ChangeSong2

* Level 3 (Park einfach !!!)
		dc.l	FN_CHAR2			* CharacterSet
		dc.l	FN_LEVEL9			* LevelDaten
		dc.l	FN_LEVEL2BOB			* BobFile
		dc.l	Flags2				* Flags
		dc.l	EnemyList9-sb_SIZEOF
		dc.l	EnemyList9			* EnemyList
		dc.l	Level9BobTab
		dc.l	Level2ColorMap
		dc.l	LoadClouds
		dc.w	CLF_AUTOMOVE
		dc.w	174
		dc.l	ChangeSong3

* Level 4 (Büro)
		dc.l	FN_CHAR4			* CharacterSet
		dc.l	FN_LEVEL4			* LevelDaten
		dc.l	FN_LEVEL4BOB			* BobFile
		dc.l	Flags4				* Flags
		dc.l	EnemyList4-sb_SIZEOF
		dc.l	EnemyList4			* EnemyList
		dc.l	Level4BobTab
		dc.l	Level4ColorMap
		dc.l	LoadNeon			* Fluoreszenz-Beleuchtung
		dc.w	0
		dc.w	174
		dc.l	ChangeSong1

* Level 5 (Stadt II)
		dc.l	FN_CHAR1			* CharacterSet
		dc.l	FN_LEVEL1			* LevelDaten
		dc.l	FN_LEVEL1BOB			* BobFile
		dc.l	Flags1				* Flags
		dc.l	EnemyList1-sb_SIZEOF
		dc.l	EnemyList1			* EnemyList
		dc.l	Level1BobTab
		dc.l	Level2ColorMap
		dc.l	LoadClouds
		dc.w	CLF_AUTOMOVE
		dc.w	174
		dc.l	ChangeSong2

* Level 6 (U'grund)
		dc.l	FN_CHAR5			* CharacterSet
		dc.l	FN_LEVEL6			* LevelDaten
		dc.l	FN_LEVEL2BOB			* BobFile
		dc.l	Flags5				* Flags
		dc.l	EnemyList6-sb_SIZEOF
		dc.l	EnemyList6			* EnemyList
		dc.l	Level6BobTab
		dc.l	Level5ColorMap
		dc.l	LoadStein
		dc.w	0
		dc.w	174
		dc.l	ChangeSong3

* Level 7 (Hafen !!!)
		dc.l	FN_CHAR8			* CharacterSet
		dc.l	FN_LEVEL8			* LevelDaten
		dc.l	FN_LEVEL5BOB			* BobFile
		dc.l	Flags8				* Flags
		dc.l	EnemyList8-sb_SIZEOF
		dc.l	EnemyList8			* EnemyList
		dc.l	Level8BobTab
		dc.l	Level3ColorMap
		dc.l	LoadClouds			
		dc.w	0
		dc.w	174
		dc.l	ChangeSong1

* Level 8 (Park)
		dc.l	FN_CHAR2			* CharacterSet
		dc.l	FN_LEVEL2			* LevelDaten
		dc.l	FN_LEVEL2BOB			* BobFile
		dc.l	Flags2				* Flags
		dc.l	EnemyList2-sb_SIZEOF
		dc.l	EnemyList2			* EnemyList
		dc.l	Level2BobTab
		dc.l	Level1ColorMap
		dc.l	LoadClouds
		dc.w	CLF_AUTOMOVE
		dc.w	174
		dc.l	ChangeSong2

* Level 9 (Büro II)
		dc.l	FN_CHAR4			* CharacterSet
		dc.l	FN_LEVEL7			* LevelDaten
		dc.l	FN_LEVEL4BOB			* BobFile
		dc.l	Flags4				* Flags
		dc.l	EnemyList7-sb_SIZEOF
		dc.l	EnemyList7			* EnemyList
		dc.l	Level7BobTab
		dc.l	Level4ColorMap
		dc.l	LoadNeon			* Fluoreszenz-Beleuchtung
		dc.w	0
		dc.w	174
		dc.l	ChangeSong3

		dc.l	0				* Ende


**************************************************************************

RonnyKO:	SoundFX	sfx_RonnyKO,4544,508,64		* Tschiip tschip
TakeBonus:	SoundFX sfx_TakeBonus,5516,508,64
Blopp:		SoundFX	sfx_Blopp,598,690,55		* unbedingt >44 (Play8SVX)
Aufprall:	SoundFX	sfx_Aufprall,2630,250,64
BusFahrt:	SoundFX sfx_BusFahrt,45294,430,64


**************************************************************************


ShortDelay:	move.l	#500*50,d0
		bra	RasterDelay


LongDelay:	move.l	#1500*50,d0
		bra	RasterDelay


ExtraDelay:	move.w	#3500,d1

2$:		moveq	#50,d0
		bsr	RasterDelay

		SYSCALL	GetKey
		bsr	CheckJoy
		beq.s	1$

		dbf	d1,2$

1$:		rts




* D0 = FileName
* A3 = BitmStr

LoadPic:	movem.l	d0-d3/a0-a3,-(sp)

		lea	sc_Bitmap(a3),a3		* BitmStr
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

		movem.l	(sp)+,d0-d3/a0-a3
		rts



	IFD	INTRO

StarByte:	movem.l	d0-d7/a0-a6,-(sp)

		lea	NewStarScreen(pc),a0
		bsr	OpenScreen
		move.l	d0,a3


		move.l	#FN_STARBYTE,d0
		bsr	LoadPic


		move.l	a3,a0				* Screen
		lea	CMap,a1
		bsr	LoadRGB				* Show Screen

		moveq	#-2,d1				* Y-Value
		move.l	a3,a0
		move.w	#272/2-1,d2
		moveq	#0,d3

.ScrollUp:	bsr	DelayBlank
		moveq	#0,d0				* X-Value
		bsr	MoveScreen
		addq.w	#1,d3

		SYSCALL	GetKey
		bsr	CheckJoy			* JoyStick
		beq.s	.AbortScroll			* gedrückt -->

		dbf	d2,.ScrollUp

		bsr	LongDelay

		move.l	a3,a0

.AbortScroll:	neg.w	d1

.ScrollDown:	bsr	DelayBlank
		bsr	MoveScreen
		SYSCALL	GetKey
		dbf	d3,.ScrollDown

		move.l	a3,a0				* Screen I
		bsr	CloseScreen

		movem.l	(sp)+,d0-d7/a0-a6
		rts


	ENDC




CopyCL:		movem.l	d0-d7/a0-a6,-(sp)

		lea	GfxBase,a0
		move.l	gfx_ViewCpr(A0),a0		* CopperListe

		lea	$07f00000,a1
		move.l	#250,d0
1$:		move.	(a0)+,(a1)+
		dbf	d0,1$


		movem.l	(sp)+,d0-d7/a0-a6
		rts





		SECTION	MyBss,BSS

WonderVars:	DS.B	WonderVar_SIZEOF
CMap:		DS.W	64

