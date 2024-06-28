************************************************************************************
***  Level8
************************************************************************************

		XDEF	EnemyList6
		XDEF	Level6BobTab

		XREF	GlobalAtom,GlobalBlatt,GlobalLEinrad,GlobalSkate
		XREF	Tropfen3,GlobalBall,GlobalWasser
		XREF	GlobalKessel,GlobalSeife,GlobalEinrad
		XREF	PlattGlobal,DameGlobal

		XREF	ShootColl,RonnyColl,EnergyColl,HealthColl

		XREF	FallHandler,CommonRemBobTest,CommonRemBob,WonderVars
		XREF	GetElem,GetInfo,ShopColl

		XREF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XREF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XREF	ImmerCoinBob,Coin,ImmerEmptyBob
		XREF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XREF	ImmerGetJobBob9,ImmerGetJobBob10,ImmerGetJobBob11
		XREF	ImmerBusStop2,ImmerExit,ImmerSandUhr

		XREF	ImmerHaus64Bob,Job1Done
		XREF	Play8SVX

		XREF	Global,Tropfen2,GlobalHund2,LBieneFast2,LBieneSlow2
		XREF	FussGlobal,LFassSubMove,SeifenGlobal,HutGlobal
		XREF	BlauKopfGlobal,SchereGlobal
		XREF	GlobalClown

		XREF	Lev2Apfel,Lev2Einrad,Lev2EinradL,Lev2KackVogel
		XREF	Lev2Blatt,Lev2WeissBall,Lev2Wasser,Lev2Hydrant
		XREF	Lev2LBieneFast,Lev2LBieneSlow,Lev2RedCar
		XREF	Lev2SkateBoarder,Lev2Kugel,Lev2RotBall
		XREF	Lev2Hund,Lev2BlauKopf,Lev2Flieger
		XREF	Lev2HüpfClown,Lev2Kessel,Lev2Schere
		XREF	Lev2HerrLR,Lev2DameBonus,Lev2HerrLRBonus
		XREF	Lev2SeifenBlase,Lev2Dame

		INCLUDE "myexec.i"
		INCLUDE	"drawbob.i"
		INCLUDE	"sfx.i"
		INCLUDE	"definitions.i"
		INCLUDE	"Gfx/Level2Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"

	STRUCTURE Level6bobStructure,0

		BYTE	Level6Dummy
		BYTE	Level6CoinBob
		BYTE	Level6CubeBob1
		BYTE	Level6CubeBob2
		BYTE	Level6CubeBob3
		BYTE	Level6CubeBob4
		BYTE	Level6JumpBob
		BYTE	Level6CheeseBob
		BYTE	Level6BombBob
		BYTE	Level6MagnetoBob
		BYTE	Level6HonkBob
		BYTE	Level6BonusBob1
		BYTE	Level6BonusBob3
		BYTE	Level6FrageZeichen
		BYTE	Level6Haus64Bob
		BYTE	Level6EmptyBob
		BYTE	Level6GetJobBob
		BYTE	Level6GetJobBob2
		BYTE	Level6GetJobBob3
		BYTE	Level6BusStop
		BYTE	Level6SandUhr

		BYTE	Level6Blatt
		BYTE	Level6Einrad
		BYTE	Level6EinradL
		BYTE	Level6RedCar
		BYTE	Level6Atom
		BYTE	Level6AtomX
		BYTE	Level6SeifenBlase
		BYTE	Level6SeifenBlaseX
		BYTE	Level6SkateBoarder
		BYTE	Level6Schere
		BYTE	Level6Dame
		BYTE	Level6DameBonus
		BYTE	Level6DameBonus2
		BYTE	Level6DameBonus3
		BYTE	Level6HerrLR
		BYTE	Level6LBieneFast
		BYTE	Level6LBieneSlow
		BYTE	Level6RotBall
		BYTE	Level6WeissBall
		BYTE	Level6HüpfClown
		BYTE	Level6Hydrant
		BYTE	Level6Wasser
		BYTE	Level6Hund
		BYTE	Level6BlauKopf
		BYTE	Level6BlauKopfX
		BYTE	Level6AmigaBall
		BYTE	Level6Plattform
		BYTE	Level6Tropfen
		BYTE	Level6Tropfen3
		BYTE	Level6Kessel
		BYTE	Level6Kugel

Level6BobTab:	dc.l	0			* Dummy
		dc.l	ImmerCoinBob
		dc.l	ImmerCubeBob1
		dc.l	ImmerCubeBob2
		dc.l	ImmerCubeBob3
		dc.l	ImmerCubeBob4
		dc.l	ImmerJumpBob
		dc.l	ImmerCheeseBob
		dc.l	ImmerBombBob
		dc.l	ImmerMagnetoBob
		dc.l	ImmerHonkBob
		dc.l	ImmerBonusBob1
		dc.l	ImmerBonusBob3
		dc.l	ImmerFrageZeichen
		dc.l	ImmerHaus64Bob
		dc.l	ImmerEmptyBob
		dc.l	ImmerGetJobBob9
		dc.l	ImmerGetJobBob10
		dc.l	ImmerGetJobBob11
		dc.l	ImmerBusStop2
		dc.l	ImmerSandUhr

		dc.l	Lev2Blatt
		dc.l	Lev2Einrad
		dc.l	Lev2EinradL
		dc.l	Lev2RedCar
		dc.l	Lev6Atom
		dc.l	Lev6AtomX
		dc.l	Lev2SeifenBlase
		dc.l	Lev6SeifenBlaseX
		dc.l	Lev2SkateBoarder
		dc.l	Lev2Schere
		dc.l	Lev2Dame
		dc.l	Lev6DameBonus
		dc.l	Lev6DameBonus2
		dc.l	Lev6DameBonus3
		dc.l	Lev2HerrLR
		dc.l	Lev2LBieneFast
		dc.l	Lev2LBieneSlow
		dc.l	Lev2RotBall
		dc.l	Lev2WeissBall
		dc.l	Lev2HüpfClown
		dc.l	Lev2Hydrant
		dc.l	Lev2Wasser
		dc.l	Lev2Hund
		dc.l	Lev6BlauKopf
		dc.l	Lev2BlauKopf
		dc.l	Lev6AmigaBall
		dc.l	Lev6Plattform
		dc.l	Lev6Tropfen
		dc.l	Lev6Tropfen3
		dc.l	Lev2Kessel
		dc.l	Lev6Kugel

		SECTION	MyData,DATA

	*** XPOS(Relativ to LevelX),YPOS,BOB ***

		SETBOB	-30000,0,0,0,0
EnemyList6:
		SETBOB	-167,26,0,Level6CubeBob1,Level6CubeBob1
		SETBOB	-150,62,0,Level6BlauKopf,Level6BlauKopf
		SETBOB	-105,42,0,Level6CoinBob,Level6CoinBob

		SETBOB	-80,141,0,Level6CoinBob,Level6CoinBob
		SETBOB	-41,168,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	-40,63,0,Level6Blatt,Level6Blatt

		SETBOB	20,70,0,Level6CoinBob,Level6CoinBob
		SETBOB	35,118,0,Level6JumpBob,Level6JumpBob
		SETBOB	40,63,0,Level6Blatt,Level6Blatt
		SETBOB	58,63,0,Level6Blatt,Level6Blatt
		SETBOB	70,19,0,Level6CoinBob,Level6CoinBob
		SETBOB	89,26,0,Level6CubeBob2,Level6CubeBob2

		SETBOB	129,63,0,Level6Blatt,Level6Blatt
		SETBOB	142,35,0,Level6EmptyBob,Level6EmptyBob

		SETBOB	200,129,0,Level6EinradL,Level6EinradL
		SETBOB	215,63,0,Level6Blatt,Level6Blatt
		SETBOB	216,129,0,Level6EinradL,Level6EinradL
		SETBOB	217,161,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	233,63,0,Level6Blatt,Level6Blatt
		SETBOB	265,95,0,Level6EinradL,Level6EinradL
		SETBOB	286,165,0,Level6SeifenBlaseX,Level6SeifenBlaseX
		SETBOB	293,133,0,Level6CubeBob3,Level6CubeBob3

		SETBOB	322,56,0,Level6EmptyBob,Level6EmptyBob

		SETBOB	403,56,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	429,63,$FD00,Level6AmigaBall,Level6AmigaBall
		SETBOB	479,21,0,Level6CubeBob4,Level6CubeBob4

		SETBOB	505,106,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	535,68,0,Level6CoinBob,Level6CoinBob
		SETBOB	589,106,0,Level6Kugel,Level6Kugel

		SETBOB	618,101,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	618,25,0,Level6CoinBob,Level6CoinBob
		SETBOB	663,63,0,Level6GetJobBob,Level6GetJobBob
		SETBOB	663,101,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	683,26,0,Level6CubeBob1,Level6CubeBob1

		SETBOB	710,139,0,Level6Atom,Level6Atom
		SETBOB	729,9,0,Level6CubeBob3,Level6CubeBob3
		SETBOB	774,145,0,Level6EmptyBob,Level6EmptyBob

		SETBOB	800,149,0,Level6SeifenBlaseX,Level6SeifenBlaseX
		SETBOB	840,150,0,Level6CubeBob2,Level6CubeBob2
		SETBOB	873,31,0,Level6BlauKopfX,Level6BlauKopfX
		SETBOB	875,62,0,Level6BombBob,Level6BombBob

		SETBOB	960,51,0,Level6CoinBob,Level6CoinBob
		SETBOB	960,73,0,Level6CoinBob,Level6CoinBob
		SETBOB	960,106,0,Level6CoinBob,Level6CoinBob

		SETBOB	1080,24,0,Level6CubeBob4,Level6CubeBob4

		SETBOB	1113,38,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	1190,70,0,Level6Tropfen,Level6Tropfen

		SETBOB	1220,70,0,Level6Tropfen,Level6Tropfen
		SETBOB	1224,138,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	1224,39,0,Level6CoinBob,Level6CoinBob
		SETBOB	1227,137,0,Level6CubeBob1,Level6CubeBob1
		SETBOB	1250,70,0,Level6Tropfen,Level6Tropfen
		SETBOB	1280,70,0,Level6Tropfen,Level6Tropfen
		SETBOB	1290,159,0,Level6DameBonus,Level6DameBonus
		SETBOB	1297,47,0,Level6RedCar,Level6RedCar

		SETBOB	1310,70,0,Level6Tropfen,Level6Tropfen
		SETBOB	1322,11,0,Level6CoinBob,Level6CoinBob
		SETBOB	1340,70,0,Level6Tropfen,Level6Tropfen
		SETBOB	1370,70,0,Level6Tropfen,Level6Tropfen

		SETBOB	1400,70,0,Level6Tropfen,Level6Tropfen
		SETBOB	1443,27,0,Level6CubeBob2,Level6CubeBob2

		SETBOB	1508,119,0,Level6GetJobBob2,Level6GetJobBob2
		SETBOB	1525,47,$FD00,Level6RotBall,Level6RotBall
		SETBOB	1538,159,0,Level6HerrLR,Level6HerrLR

		SETBOB	1625,63,$FD00,Level6RotBall,Level6RotBall
		SETBOB	1659,81,0,Level6CubeBob3,Level6CubeBob3

		SETBOB	1738,124,0,Level6CoinBob,Level6CoinBob
		SETBOB	1783,102,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	1786,63,0,Level6SkateBoarder,Level6SkateBoarder

		SETBOB	1833,53,0,Level6BonusBob1,Level6BonusBob1
		SETBOB	1865,92,0,Level6BlauKopfX,Level6BlauKopfX
		SETBOB	1884,115,0,Level6CubeBob2,Level6CubeBob2

		SETBOB	1913,128,0,Level6MagnetoBob,Level6MagnetoBob
		SETBOB	1974,11,0,Level6CubeBob1,Level6CubeBob1

		SETBOB	2025,106,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	2038,11,0,Level6CoinBob,Level6CoinBob

		SETBOB	2170,47,$FD00,Level6AmigaBall,Level6AmigaBall
		SETBOB	2181,47,0,Level6Kessel,Level6Kessel
		SETBOB	2187,105,0,Level6CubeBob4,Level6CubeBob4

		SETBOB	2239,70,0,Level6CoinBob,Level6CoinBob

		SETBOB	2245,154,0,Level6LBieneSlow,Level6LBieneSlow
		SETBOB	2258,135,0,Level6LBieneSlow,Level6LBieneSlow

		SETBOB	2310,153,0,Level6LBieneSlow,Level6LBieneSlow
		SETBOB	2343,135,0,Level6LBieneSlow,Level6LBieneSlow
		SETBOB	2345,135,0,Level6JumpBob,Level6JumpBob

		SETBOB	2537,88,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	2553,121,0,Level6CubeBob1,Level6CubeBob1
		SETBOB	2564,95,0,Level6HüpfClown,Level6HüpfClown
		SETBOB	2586,76,0,Level6Tropfen3,Level6Tropfen3
		SETBOB	2593,40,0,Level6SandUhr,Level6SandUhr

		SETBOB	2634,76,0,Level6Tropfen3,Level6Tropfen3
		SETBOB	2663,129,0,Level6BonusBob3,Level6BonusBob3

		SETBOB	2700,86,0,Level6CoinBob,Level6CoinBob
		SETBOB	2791,123,0,Level6CubeBob2,Level6CubeBob2

		SETBOB	2801,78,0,Level6JumpBob,Level6JumpBob

		SETBOB	2904,13,0,Level6CubeBob1,Level6CubeBob1
		SETBOB	2917,175,0,Level6DameBonus2,Level6DameBonus2
		SETBOB	2926,14,0,Level6CoinBob,Level6CoinBob
		SETBOB	2969,95,$FD00,Level6RotBall,Level6RotBall
		SETBOB	2989,93,0,Level6CoinBob,Level6CoinBob

		SETBOB	3017,74,0,Level6FrageZeichen,Level6FrageZeichen

		SETBOB	3130,164,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	3161,142,$FD00,Level6RotBall,Level6RotBall

		SETBOB	3215,110,0,Level6CheeseBob,Level6CheeseBob
		SETBOB	3259,164,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	3275,63,$FD00,Level6RotBall,Level6RotBall
		SETBOB	3272,111,$FE00,Level6WeissBall,Level6WeissBall
		SETBOB	3288,95,$FD00,Level6WeissBall,Level6WeissBall

		SETBOB	3310,85,0,Level6CoinBob,Level6CoinBob
		SETBOB	3336,110,0,Level6CubeBob2,Level6CubeBob2

		SETBOB	3511,164,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	3511,164,0,Level6CoinBob,Level6CoinBob
		SETBOB	3547,164,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	3567,28,0,Level6CubeBob2,Level6CubeBob2
		SETBOB	3586,164,0,Level6EmptyBob,Level6EmptyBob

		SETBOB	3691,117,0,Level6JumpBob,Level6JumpBob
		SETBOB	3691,23,0,Level6CoinBob,Level6CoinBob

		SETBOB	3778,63,0,Level6Einrad,Level6Einrad
		SETBOB	3799,56,0,Level6CoinBob,Level6CoinBob

		SETBOB	3801,131,0,Level6CubeBob2,Level6CubeBob2
		SETBOB	3825,179,0,Level6Kugel,Level6Kugel
		SETBOB	3844,63,0,Level6Einrad,Level6Einrad
		SETBOB	3867,115,0,Level6CoinBob,Level6CoinBob

		SETBOB	3909,162,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	3993,47,0,Level6Blatt,Level6Blatt

		SETBOB	4023,171,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	4068,118,0,Level6SeifenBlaseX,Level6SeifenBlaseX
		SETBOB	4080,132,0,Level6SeifenBlase,Level6SeifenBlase

		SETBOB	4101,171,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	4122,47,0,Level6Blatt,Level6Blatt
		SETBOB	4129,53,0,Level6BonusBob1,Level6BonusBob1
		SETBOB	4189,94,0,Level6BonusBob3,Level6BonusBob3

		SETBOB	4233,47,0,Level6Blatt,Level6Blatt
		SETBOB	4249,175,0,Level6Hund,Level6Hund

		SETBOB	4318,135,0,Level6AtomX,Level6AtomX
		SETBOB	4359,169,0,Level6CoinBob,Level6CoinBob

		SETBOB	4495,152,0,Level6JumpBob,Level6JumpBob

		SETBOB	4542,150,0,Level6CubeBob1,Level6CubeBob1
		SETBOB	4544,175,0,Level6HüpfClown,Level6HüpfClown
		SETBOB	4588,54,0,Level6HonkBob,Level6HonkBob

		SETBOB	4615,86,0,Level6BlauKopf,Level6BlauKopf
		SETBOB	4644,50,0,Level6CubeBob2,Level6CubeBob2
		SETBOB	4681,159,0,Level6Wasser,Level6Wasser

		SETBOB	4720,151,0,Level6JumpBob,Level6JumpBob
		SETBOB	4729,147,0,Level6CubeBob3,Level6CubeBob3

		SETBOB	4811,165,0,Level6Plattform,Level6Plattform
		SETBOB	4850,165,0,Level6Plattform,Level6Plattform
		SETBOB	4866,26,0,Level6CoinBob,Level6CoinBob
		SETBOB	4890,165,0,Level6Plattform,Level6Plattform

		SETBOB	4924,17,0,Level6BombBob,Level6BombBob
		SETBOB	4956,26,0,Level6CoinBob,Level6CoinBob
		SETBOB	4983,111,$FD00,Level6RotBall,Level6RotBall

		SETBOB	5050,111,$FD00,Level6RotBall,Level6RotBall

		SETBOB	5148,137,0,Level6FrageZeichen,Level6FrageZeichen
		SETBOB	5191,13,0,Level6CubeBob1,Level6CubeBob1

		SETBOB	5231,68,0,Level6CheeseBob,Level6CheeseBob
		SETBOB	5275,143,0,Level6CubeBob2,Level6CubeBob2

		SETBOB	5315,140,0,Level6JumpBob,Level6JumpBob
		SETBOB	5387,144,0,Level6Wasser,Level6Wasser

		SETBOB	5430,134,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	5434,63,0,Level6Kessel,Level6Kessel
		SETBOB	5466,159,0,Level6EmptyBob,Level6EmptyBob

		SETBOB	5552,39,0,Level6CoinBob,Level6CoinBob

		SETBOB	5608,42,0,Level6BonusBob1,Level6BonusBob1
		SETBOB	5620,167,0,Level6CoinBob,Level6CoinBob
		SETBOB	5650,167,0,Level6CoinBob,Level6CoinBob
		SETBOB	5680,167,0,Level6CoinBob,Level6CoinBob

		SETBOB	5764,175,0,Level6DameBonus3,Level6DameBonus3
		SETBOB	5735,60,0,Level6CoinBob,Level6CoinBob

		SETBOB	5904,111,$FD00,Level6RotBall,Level6RotBall
		SETBOB	5930,95,$FE00,Level6RotBall,Level6RotBall
		SETBOB	5938,80,0,Level6SandUhr,Level6SandUhr
		SETBOB	5990,95,$FD00,Level6RotBall,Level6RotBall

		SETBOB	6010,111,$FD00,Level6RotBall,Level6RotBall
		SETBOB	6093,78,0,Level6Wasser,Level6Wasser
		SETBOB	6093,95,0,Level6Hydrant,Level6Hydrant

		SETBOB	6258,150,0,Level6Kugel,Level6Kugel
		SETBOB	6264,154,0,Level6JumpBob,Level6JumpBob

		SETBOB	6409,110,0,Level6HonkBob,Level6HonkBob
		SETBOB	6478,47,0,Level6RedCar,Level6RedCar
;		SETBOB	6479,31,0,Level6BonusBob1,Level6BonusBob1

		SETBOB	6536,176,0,Level6Wasser,Level6Wasser
		SETBOB	6595,112,0,Level6JumpBob,Level6JumpBob

		SETBOB	6760,124,0,Level6SeifenBlase,Level6SeifenBlase
		SETBOB	6767,147,0,Level6AtomX,Level6AtomX

		SETBOB	6809,106,0,Level6CoinBob,Level6CoinBob
		SETBOB	6854,119,0,Level6GetJobBob3,Level6GetJobBob3

		SETBOB	6904,159,0,Level6EmptyBob,Level6EmptyBob
		SETBOB	6914,159,0,Level6HerrLR,Level6HerrLR
		SETBOB	6936,154,0,Level6EmptyBob,Level6EmptyBob

		SETBOB	7054,22,0,Level6BusStop,Level6BusStop

		SETBOB	30000,0,0,0,0


****************************************************************************

Lev6Tropfen3:	SETDATA		EmptyBob,WonderVars+ImmerBobBase
		SETMOVE		1$
		SETUSERFLAGS	BOBF_REMOVE
		ENDE

1$:		ADDRELBOB	2$,0,0
		RNDDELAY	60,100
		LOOP

2$:		SETDATA		Level2Bob16,WonderVars+BobBase
		GOTO		Tropfen3

****************************************************************************

Lev6Atom:	SETDATA		Level2Bob67,WonderVars+BobBase
		SETMOVE		1$
		GOTO		AtomSub

1$:		UP		40
		DOWN		40
		LOOP

****************************************************************************

Lev6AtomX:	SETDATA		Level2Bob67,WonderVars+BobBase
		SETMOVE		LR40
AtomSub:	SETMOVESTEP	2
		SETUSERDATA	$03000000
		GOTO		GlobalAtom

LR40:		LEFT		40
		RIGHT		40
		LOOP

****************************************************************************

Lev6Tropfen:	SETDATA		Level2Bob16,WonderVars+BobBase
		GOTO		Tropfen2

****************************************************************************

Lev6Plattform:	SETDATA		Level2Bob36,WonderVars+BobBase
		SETMOVE		UP25
		GOTO		PlattGlobal

UP25:		UP		25
		DOWN		25
		LOOP

****************************************************************************

Lev6DameBonus:	SETDATA		Level2Bob24,WonderVars+BobBase
		SETID		LADY1_ID
BDGlobal:	SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		GOTO		DameGlobal

Lev6DameBonus2:	SETDATA		Level2Bob24,WonderVars+BobBase
		SETID		LADY2_ID
		GOTO		BDGlobal

Lev6DameBonus3:	SETDATA		Level2Bob24,WonderVars+BobBase
		SETID		LADY3_ID
		GOTO		BDGlobal

****************************************************************************

Lev6BlauKopf:	SETDATA		Level2Bob93,WonderVars+BobBase
		SETMOVE		UP25
		SETANIM		BlauAnim
		GOTO		BlauKopfGlobal

BlauAnim:	ANIMTO		0,11
		LOOP

****************************************************************************

Lev6Kugel:	SETDATA		Level2Bob79,WonderVars+BobBase
		SETMOVE		1$
		SETANIM		2$
		GOTO		BlauKopfGlobal

1$:		UP		30
		DOWN		30
		LOOP

2$:		ANIMTO		0,13
		LOOP

****************************************************************************

Lev6AmigaBall:	SETDATA		Level2Bob146,WonderVars+BobBase
		SETUSERDATA	$07000000
		GOTO		GlobalBall

****************************************************************************

Lev6SeifenBlaseX:
		SETDATA		Level2Bob64,WonderVars+BobBase
		GOTO		SeifenGlobal

****************************************************************************

Hupe:		SoundFX	sfx_Hupe,3710,690,45
Spacer:		SoundFX	sfx_Spacer,1524,790,60
