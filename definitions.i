
PAL:	EQU	16*16
NTSC:	EQU	12*16

MasterVolume:	EQU	10		; Lautstärke des Songs
MasterFXVolume:	EQU	64		; Lautstärke der FX's

*****************************************************************************
*	DEFINITIONS FOR  :  W O N D E R G I R L 			    *
*****************************************************************************

ScrWidth:	EQU	50					* ScrWidht in Bytes
ScrHeight:	EQU	NTSC					* ScrHeight in Pixels
ScrDepth:	EQU	5					* ScreenDepth
Plane_SIZEOF:	EQU	ScrWidth*ScrHeight
Scr_SIZEOF:	EQU	ScrDepth*Plane_SIZEOF

NumCharPlanes:	EQU	ScrDepth

PARASIZE:	EQU	100

NAMESIZE:	EQU	8
NUMENTRIES:	EQU	10					* HiScore

END_GAME:	EQU	1
OUT_OF_ENERGY:	EQU	2
OUT_OF_HEALTH:	EQU	3
LEVEL_END:	EQU	4
OUT_OF_TIME:	EQU	5
DEMO_END:	EQU	6

SLOW:		EQU	1
FAST:		EQU	2

CLOUD_ID:	EQU	1
RONNY_ID:	EQU	2
SHOP1_ID:	EQU	3
SHOP2_ID:	EQU	4
SHOP3_ID:	EQU	5
HAUS1_ID:	EQU	6
HAUS13_ID:	EQU	7
LADY1_ID:	EQU	8
LADY2_ID:	EQU	9
LADY3_ID:	EQU	10
HERR1_ID:	EQU	11
HERR2_ID:	EQU	12

RETURN:		EQU	10
DELETE:		EQU	8
BACKSPACE:	EQU	7

PFEIL:		EQU	128
LEERPFEIL:	EQU	129
TURNSTART:	EQU	130
TURNSTOP:	EQU	135

LWALK:		EQU	0
LWALKEND:	EQU	6
LDUCK:		EQU	7
LDUCKEND:	EQU	9
LSPRUNG:	EQU	10
LSPRUNGEND:	EQU	13
LFALL:		EQU	14
LFALLEND:	EQU	24

TREPPE:		EQU	25
TREPPEEND:	EQU	29

RWALK:		EQU	30
RWALKEND:	EQU	36
RDUCK:		EQU	37
RDUCKEND:	EQU	39
RSPRUNG:	EQU	40
RSPRUNGEND:	EQU	43
RFALL:		EQU	44
RFALLEND:	EQU	54

SHOOT_COLL:	EQU	%00000001
RONNY_COLL:	EQU	%00000010

RONNY_HITCOLL:	EQU	%10000000
RONNY_STURZ:	EQU	%11000000

		IFND	SZ_PANEL
		 SZ_PANEL:	EQU	7744
		ENDC

FileSize:	EQU	-4

SETBOB:		MACRO
		IFEQ	NARG-5
		 dc.w	\1,\2,\3			* XPos,YPos,Flags
		 dc.b	\4,\5				* Bob
		ENDC
		IFNE	NARG-5
		 FAIL	<"ERROR : SETBOB NEEDS 5 ARGS">
		ENDC
		ENDM

MOVEWAY:	MACRO
		 dc.b	\1,\2
		ENDM

WAYCOLOR:	MACRO
		dc.b	$10,\1
		ENDM


	BITDEF	BOB,REMOVE,0		* Will Remove Bob if not on Screen
	BITDEF	BOB,ENEMY,1		* This Bob is an EnemyBob
	BITDEF	BOB,COLLECTABLE,2	* This Bob is an Collectable
	BITDEF	BOB,ENEMY2,3		* This Bob is an EnemyBob

	BITDEF	FD,JOB,0		* This is a Job (no gadget)
	BITDEF	FD,PROPERTIE,1		* This is a Job (no gadget)

	BITDEF	SB,ONCE,0		* This Bob appears only one time (pro Level)
	BITDEF	SB,VISIBLE,1		* Bob is currently on screen
	BITDEF	SB,SHOOT,2		* Bob wurde einmal abgeschossen

	BITDEF	CL,AUTOMOVE,0		* Clouds move toujours (ah oui, mon petit)

	BITDEF	LEV,StandFlag,0
	BITDEF	LEV,WandFlag,1
	BITDEF	LEV,LeiterFlag,2
	BITDEF	LEV,SturzFlag,3


	STRUCTURE UserDataStructure,0
		BYTE	ud_NumShoot
		BYTE	ud_RemoveTimer
		BYTE	ud_FallingDist
		BYTE	ud_XMove

	STRUCTURE SoundFXStructure,0
		STRUCT	sfx_RonnyKO,4544
		STRUCT	sfx_TakeBonus,5516
		STRUCT	sfx_Blopp,598
		STRUCT	sfx_Hupe,3710
		STRUCT	sfx_Blip,1820
		STRUCT	sfx_Aufprall,2630
		STRUCT	sfx_Spacer,1524
		STRUCT	sfx_DampfLok,2328
		STRUCT	sfx_BusFahrt,45294

	STRUCTURE LevelBobStructure,0
		WORD	sb_XPos
		WORD	sb_YPos
		WORD	sb_Flags
		BYTE	sb_BobRight
		BYTE	sb_BobLeft
		LABEL	sb_SIZEOF

	STRUCTURE LevelStructure,0
		LONG	FN_CHAR
		LONG	FN_LEVEL
		LONG	FN_BOBS
		LONG	PTR_FLAGS
		LONG	PTR_ENEMYLEFT
		LONG	PTR_ENEMYRIGHT
		LONG	PTR_LEVELBOBTAB
		LONG	PTR_COLORMAP
		LONG	PTR_CLOUDHANDLER
		WORD	PTR_CLOUDFLAGS
		WORD	RONNY_Y
		LONG	PTR_SONGHANDLER
		LABEL	LEVEL_TAB_SIZE

	STRUCTURE WayStructure,0
		LONG	PTR_WAYTAB
		LONG	PTR_TEXT
		BYTE	BOB1
		BYTE	BOB2
		BYTE	BOB3
		BYTE	PAD_BYTE
		LABEL	WAY_TAB_SIZE


	STRUCTURE Field,0
		WORD	fd_HausNummer
		WORD	fd_Score
		WORD	fd_Money
		WORD	fd_Money2
		WORD	fd_BobNum
		WORD	fd_Flags
		LONG	fd_Text
		LONG	fd_Text2
		LONG	fd_Handler
		LONG	fd_Handler2

	STRUCTURE WonderStruct,0

		LONG	ScrSize				* Size of Screen
		LONG	Score				* Score
		LONG	OldScore			* OldScore
		LONG	Money				* Money
		LONG	OldMoney			* OldMoney
		LONG	HiScore
		LONG	OldTimer
		LONG	MenuScreen			* ScreenMenu
		LONG	MenuWindow			* WindowStructure
		LONG	PanelWindow			* WindowStructure
		LONG	FxPanelWindow			* WindowStructure
		LONG	PanelBase			* PanelBase
		LONG	MenuBase			* MenuBase
		LONG	PictureBase			* Address for BackPic
		LONG	CharBase			* baseAddress for Char
		LONG	LevelBase			* BaseAddress for Level
		LONG	FontBase			* BaseAddress for Font
		LONG	BobBase				* BaseAddress for Bobs
		LONG	KarteBobBase			* BaseAddress for Bobs
		LONG	ImmerBobBase			* BaseAddress for ImmerBobs
		LONG	FinalBobBase			* BaseAddress for Bobs
		LONG	VBCounter			* VerticalBlank Counter
		LONG	OldVBCounter			* VerticalBlank Counter
		LONG	MyBob				* MyBob
		LONG	BallonBobBase			* BallonBob
		LONG	Time				* Game Time
		LONG	LEnemyListPtr			* Ptr to EnemyList
		LONG	REnemyListPtr			* Ptr to EnemyList
		LONG	LevelBobTab			* Conversion Tab for LevelBobs
		LONG	FxTimer				* Timer for BottleFX
		LONG	FxListPtr			* Pointer to BottleFXList
		LONG	ShowSpr
		LONG	CloudPtr
		LONG	ActLevelPtr			* Ptr to LevelStrct
		LONG	LevelFlags			* ElemFlags
		LONG	FieldBob			* FieldBob
		LONG	Field1
		LONG	Field2
		LONG	Field3
		LONG	Field4				* PanelFields
		LONG	DebugBob
		LONG	DebugPtr
		LONG	FXBase				* BaseAddress for SoundFX
		LONG	ActBitmap			* BaseAddress for SoundFX
		LONG	ActWayPtr
		LONG	GameTimer

		WORD	FallingDist			* FallingDistance
		WORD	LevelX				* Level X-Coord
		WORD	LastLevelX			* LastLevel X-Coord
		WORD	SizeX				* NumCharsX
		WORD	SizeY				* NumCharsY
		WORD	PixelSizeX			* PixelX
		WORD	PixelSizeY			* PixelY
		WORD	Speed				* MyBob Speed
		WORD	ScrollX				* ScrollX
		WORD	ScrollY				* ScrollY
		WORD	Energy				* Energy
		WORD	EnergyIst			* Energy
		WORD	Health				* Health
		WORD	HealthIst			* Health
		WORD	NoCollisionTimer		* Timer for OFF-Collision
		WORD	ParalizeTimer			* Timer for Paralizing
		WORD	ExtraMoney			* ExtraMoney
		WORD	DebugX
		WORD	DebugY
		WORD	HighLevel
		WORD	ActLevel
		WORD	SongSpeed

		STRUCT	Sprite1,4*36*4			* Buffer for PlayerSprite1
		STRUCT	Para,PARASIZE			* ParameterStack

		BYTE	ShootDelay			* Delay for Shoot
		BYTE	ShootValue			* Actual Delay
		BYTE	FlipFlag			* FlipFLag
		BYTE	EndFlag				* EndFlag
		BYTE	StairFlag			* StairFlag
		BYTE	FallingFlag			* FallingFlag
		BYTE	JumpingFlag			* JumpingFlag
		BYTE	StandFlag			* StandFlag
		BYTE	CloudFlag			* CloudFlag
		BYTE	DuckFlag			* Bob geduckt
		BYTE	WalkFlag			* Bob is moving
		BYTE	HimmelFlag			* HimmelFahrt
		BYTE	SturzFlag			* SturzFlag

		BYTE	JumpDelay			* Delay for Jump
		BYTE	MenuOption			* Actual MenuOption
		BYTE	NoInt				* Disable Interrupt
		BYTE	MusicFlag			* MusicFlag
		BYTE	FxFlag				* EffectsFlag
		BYTE	MenuCnt				* Counter for JoystickAsk
		BYTE	DirectionX			* Letzt gewählte Richtung
		BYTE	DirectionY			* Letzt gewählte Richtung
		BYTE	DirX				* MoveDirection 
		BYTE	DirY				* MoveDirection 
		BYTE	LastDirX			* Last MoveDirection 
		BYTE	LastDirY			* Last MoveDirection 
		BYTE	SuperJump			* SuperJumpFlag
		BYTE	PowerSneeze			* SneezeFlag
		BYTE	CollectFlag			* CollectFlag
		BYTE	NumCubes			* Anzahl gesammelte Cubes
		BYTE	OldNumCubes
		BYTE	CycleFlag			* ColorCycle INT on
		BYTE	NoLeftFlag
		BYTE	NoRightFlag
		BYTE	JumpCnt
		BYTE	ShopFlag
		BYTE	ShopTimer			* Shopping verweigern
		BYTE	NoKeyFlag			* Keine Key abfragen aus INT
		BYTE	PanelCnt
		BYTE	GameFlag			* Game on/off
		BYTE	ContinueCnt
		BYTE	DrawFlipFlag
		BYTE	LowMemFlag
		BYTE	DemoFlag
		BYTE	WhichDemoFlag

		LABEL	WonderVar_SIZEOF


	STRUCTURE hientrystrct,0
		STRUCT	he_Name,NAMESIZE
		LONG	he_Score
		LABEL	he_SIZEOF

	STRUCTURE hiliststrct,0
		STRUCT	hl_Entries,he_SIZEOF*NUMENTRIES
		LABEL	hl_SIZEOF
