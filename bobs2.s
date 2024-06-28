************************************************************************************
***  Level3
************************************************************************************

		XDEF	EnemyList2
		XDEF	Level2BobTab

		XDEF	GlobalPfeil,PlattGlobal,DameGlobal,FliegerGlobal
		XDEF	SchereGlobal,SeifenGlobal,GlobalBall,SeifeGlobal
		XDEF	GlobalEinrad,HutGlobal,GlobalAtom,GlobalSeife
		XDEF	GlobalWasser,GlobalLEinrad,BonusDameGlobal
		XDEF	GlobalBlatt,BlauKopfGlobal,GlobalSkate,GlobalKessel
		XDEF	GlobalClown,RedCarGlobal,SchereGlobal2
		XDEF	Lev2Apfel,Lev2Einrad,Lev2EinradL,Lev2KackVogel
		XDEF	Lev2Blatt,Lev2WeissBall,Lev2Wasser,Lev2Hydrant
		XDEF	Lev2LBieneFast,Lev2LBieneSlow,Lev2RedCar
		XDEF	Lev2SkateBoarder,Lev2Kugel,Lev2RotBall
		XDEF	Lev2Hund,Lev2BlauKopf,Lev2Flieger
		XDEF	Lev2HüpfClown,Lev2Kessel,Lev2Schere
		XDEF	Lev2HerrLR,Lev2DameBonus,Lev2HerrLRBonus
		XDEF	Lev2SeifenBlase,Lev2Dame

		XREF	ShootColl,RonnyColl,EnergyColl,HealthColl,ImmerSandUhr

		XREF	FallHandler,CommonRemBob,CommonRemBobTest,WonderVars
		XREF	GetElem,GetInfo,ShopColl

		XREF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XREF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XREF	ImmerShopBob1
		XREF	ImmerCoinBob,Coin,ImmerEmptyBob
		XREF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XREF	ImmerGetJobBob2
		XREF	ImmerBusStop1
		XREF	LBieneFast2,LBieneSlow2

		XREF	ImmerHaus64Bob,Job1Done
		XREF	Play8SVX

		XREF	Global,Tropfen2,GlobalHund2
		XREF	FussGlobal,LFassSubMove

		INCLUDE "myexec.i"
		INCLUDE	"drawbob.i"
		INCLUDE	"sfx.i"
		INCLUDE	"definitions.i"
		INCLUDE	"Gfx/Level2Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"

	STRUCTURE Level2bobStructure,0

		BYTE	Level2Dummy
		BYTE	Level2ShopBob3
		BYTE	Level2CoinBob
		BYTE	Level2CubeBob1
		BYTE	Level2CubeBob2
		BYTE	Level2CubeBob3
		BYTE	Level2CubeBob4
		BYTE	Level2JumpBob
		BYTE	Level2CheeseBob
		BYTE	Level2BombBob
		BYTE	Level2MagnetoBob
		BYTE	Level2HonkBob
		BYTE	Level2BonusBob1
		BYTE	Level2BonusBob3
		BYTE	Level2FrageZeichen
		BYTE	Level2Haus64Bob
		BYTE	Level2EmptyBob
		BYTE	Level2GetJobBob2
		BYTE	Level2BusStop
		BYTE	Level2SandUhr

		BYTE	Level2Apfel
		BYTE	Level2Blatt
		BYTE	Level2Einrad
		BYTE	Level2RedCar
		BYTE	Level2Flieger
		BYTE	Level2Atom
		BYTE	Level2Pfeil
		BYTE	Level2SeifenBlase
		BYTE	Level2LSeifenBlase
		BYTE	Level2SkateBoarder
		BYTE	Level2Schere
		BYTE	Level2Dame
		BYTE	Level2DameBonus
		BYTE	Level2HerrL
		BYTE	Level2HerrLR
		BYTE	Level2HerrLRBonus
		BYTE	Level2LBieneFast
		BYTE	Level2LBieneSlow
		BYTE	Level2RotBall
		BYTE	Level2WeissBall
		BYTE	Level2HüpfClown
		BYTE	Level2Hydrant
		BYTE	Level2Wasser
		BYTE	Level2Hund
		BYTE	Level2BlauKopf
		BYTE	Level2AmigaBall
		BYTE	Level2Plattform
		BYTE	Level2Plattform2
		BYTE	Level2Marktstand
		BYTE	Level2Tropfen
		BYTE	Level2Kessel
		BYTE	Level2KackVogel
		BYTE	Level2EinradL
		BYTE	Level2Kugel

Level2BobTab:	dc.l	0			* Dummy
		dc.l	ImmerShopBob1
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
		dc.l	ImmerGetJobBob2
		dc.l	ImmerBusStop1
		dc.l	ImmerSandUhr

		dc.l	Lev2Apfel
		dc.l	Lev2Blatt
		dc.l	Lev2Einrad
		dc.l	Lev2RedCar
		dc.l	Lev2Flieger
		dc.l	Lev2Atom
		dc.l	Lev2Pfeil
		dc.l	Lev2SeifenBlase
		dc.l	Lev2LSeifenBlase
		dc.l	Lev2SkateBoarder
		dc.l	Lev2Schere
		dc.l	Lev2Dame
		dc.l	Lev2DameBonus
		dc.l	Lev2HerrL
		dc.l	Lev2HerrLR
		dc.l	Lev2HerrLRBonus
		dc.l	Lev2LBieneFast
		dc.l	Lev2LBieneSlow
		dc.l	Lev2RotBall
		dc.l	Lev2WeissBall
		dc.l	Lev2HüpfClown
		dc.l	Lev2Hydrant
		dc.l	Lev2Wasser
		dc.l	Lev2Hund
		dc.l	Lev2BlauKopf
		dc.l	Lev2AmigaBall
		dc.l	Lev2Plattform
		dc.l	Lev2Plattform2
		dc.l	Lev2Marktstand
		dc.l	Lev2Tropfen
		dc.l	Lev2Kessel
		dc.l	Lev2KackVogel
		dc.l	Lev2EinradL
		dc.l	Lev2Kugel

		SECTION	MyData,DATA

	*** XPOS(Relativ to LevelX),YPOS,BOB ***

		SETBOB	-30000,0,0,0,0
EnemyList2:
		SETBOB	-120,84,0,Level2Apfel,Level2Apfel
		SETBOB	-104,44,0,Level2Apfel,Level2Apfel
		SETBOB	-87,77,0,Level2Apfel,Level2Apfel
		SETBOB	-48,153,0,Level2Atom,Level2Atom

		SETBOB	109,76,0,Level2Pfeil,Level2Pfeil
		SETBOB	160,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	166,127,0,Level2Einrad,Level2Einrad
		SETBOB	180,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	250,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	253,49,0,Level2CubeBob1,Level2CubeBob1
		SETBOB	276,175,0,Level2RedCar,Level2RedCar
		SETBOB	300,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	319,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	391,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	404,87,0,Level2Flieger,Level2Flieger
		SETBOB	445,158,0,Level2LSeifenBlase,Level2LSeifenBlase
		SETBOB	469,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	527,60,0,Level2Apfel,Level2Apfel
		SETBOB	593,1,0,Level2Flieger,Level2Flieger
		SETBOB	600,103,0,Level2CubeBob2,Level2CubeBob2
		SETBOB	613,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	726,89,0,Level2Apfel,Level2Apfel
		SETBOB	770,175,$FE00,Level2RotBall,Level2RotBall
		SETBOB	775,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	802,175,0,Level2SkateBoarder,Level2SkateBoarder
		SETBOB	925,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	937,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	976,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	969,146,0,Level2Schere,Level2Schere
		SETBOB	1032,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	1090,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	1103,93,0,Level2LBieneSlow,0
		SETBOB	1123,111,0,Level2LBieneFast,0
		SETBOB	1129,69,0,Level2CubeBob3,Level2CubeBob3
		SETBOB	1140,100,0,Level2LBieneFast,0
		SETBOB	1173,82,0,Level2LBieneSlow,0
		SETBOB	1187,175,0,Level2Dame,Level2Dame
		SETBOB	1188,108,0,Level2LBieneFast,0
		SETBOB	1207,78,0,Level2SeifenBlase,Level2SeifenBlase
		SETBOB	1209,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	1241,50,0,Level2CubeBob4,Level2CubeBob4
		SETBOB	1254,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	1277,31,0,Level2Blatt,Level2Blatt
		SETBOB	1297,44,0,Level2Blatt,Level2Blatt
		SETBOB	1316,53,0,Level2Blatt,Level2Blatt
		SETBOB	1335,53,0,Level2Blatt,Level2Blatt
		SETBOB	1346,175,0,Level2HerrLR,Level2HerrLR
		SETBOB	1400,23,0,Level2KackVogel,Level2KackVogel

		SETBOB	1439,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	1466,46,0,Level2CoinBob,Level2CoinBob
		SETBOB	1479,163,0,Level2CubeBob1,Level2CubeBob1
		SETBOB	1506,46,0,Level2CoinBob,Level2CoinBob
		SETBOB	1511,95,$FD00,Level2WeissBall,Level2WeissBall
		SETBOB	1536,46,0,Level2CoinBob,Level2CoinBob
		SETBOB	1566,46,0,Level2CoinBob,Level2CoinBob
		SETBOB	1596,46,0,Level2CoinBob,Level2CoinBob

		SETBOB	1623,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	1645,175,0,Level2Hydrant,Level2Hydrant
		SETBOB	1645,149,0,Level2Wasser,Level2Wasser
		SETBOB	1713,23,0,Level2KackVogel,Level2KackVogel

		SETBOB	1721,80,0,Level2CubeBob2,Level2CubeBob2
		SETBOB	1721,124,0,Level2FrageZeichen,Level2FrageZeichen

		SETBOB	1776,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	1794,61,0,Level2Schere,Level2Schere
		SETBOB	1814,95,0,Level2Schere,Level2Schere
		SETBOB	1848,17,0,Level2CubeBob3,Level2CubeBob3
		SETBOB	1860,171,0,Level2LSeifenBlase,Level2LSeifenBlase
		SETBOB	1902,157,0,Level2LSeifenBlase,Level2LSeifenBlase
		SETBOB	2022,95,0,Level2Hund,Level2Hund

		SETBOB	2053,148,0,Level2JumpBob,Level2JumpBob
		SETBOB	2058,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	2061,90,0,Level2Apfel,Level2Apfel
		SETBOB	2129,126,0,Level2Wasser,Level2Wasser
		SETBOB	2157,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	2167,158,0,Level2BlauKopf,Level2BlauKopf
		SETBOB	2185,106,0,Level2CubeBob3,Level2CubeBob3
		SETBOB	2190,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	2217,49,0,Level2BonusBob1,Level2BonusBob1
		SETBOB	2229,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	2257,52,0,Level2Apfel,Level2Apfel
		SETBOB	2298,31,0,Level2Apfel,Level2Apfel
		SETBOB	2360,97,0,Level2CubeBob1,Level2CubeBob1
		SETBOB	2401,30,0,Level2Blatt,Level2Blatt
		SETBOB	2422,54,0,Level2Blatt,Level2Blatt
		SETBOB	2475,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	2502,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	2519,1,$FD00,Level2RotBall,Level2RotBall
		SETBOB	2529,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	2568,50,0,Level2CubeBob2,Level2CubeBob2
		SETBOB	2655,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	2678,77,0,Level2Atom,Level2Atom
		SETBOB	2712,97,0,Level2JumpBob,Level2JumpBob
		SETBOB	2757,80,0,Level2CoinBob,Level2CoinBob
		SETBOB	2794,30,0,Level2BlauKopf,Level2BlauKopf
		SETBOB	2848,117,0,Level2CoinBob,Level2CoinBob
		SETBOB	2863,35,0,Level2CubeBob3,Level2CubeBob3
		SETBOB	2914,78,0,Level2Pfeil,Level2Pfeil
		SETBOB	2934,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	2954,67,0,Level2BonusBob3,Level2BonusBob3

		SETBOB	3012,95,0,Level2EinradL,Level2EinradL
		SETBOB	3079,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	3094,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	3102,95,0,Level2EinradL,Level2EinradL
		SETBOB	3106,88,0,Level2SandUhr,Level2SandUhr
		SETBOB	3111,86,0,Level2Plattform2,Level2Plattform2

		SETBOB	3112,145,0,Level2FrageZeichen,Level2FrageZeichen

		SETBOB	3158,86,0,Level2Plattform2,Level2Plattform2
		SETBOB	3180,86,0,Level2Plattform2,Level2Plattform2
		SETBOB	3250,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	3257,175,0,Level2SkateBoarder,Level2SkateBoarder
		SETBOB	3258,60,0,Level2CoinBob,Level2CoinBob
		SETBOB	3290,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	3310,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	3353,149,0,Level2Wasser,Level2Wasser
		SETBOB	3353,175,0,Level2Hydrant,Level2Hydrant
		SETBOB	3381,93,0,Level2CubeBob4,Level2CubeBob4
		SETBOB	3495,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	3510,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	3511,118,0,Level2CoinBob,Level2CoinBob
		SETBOB	3600,76,0,Level2Apfel,Level2Apfel
		SETBOB	3654,145,0,Level2HüpfClown,Level2HüpfClown
		SETBOB	3690,1,0,Level2SeifenBlase,Level2SeifenBlase
		SETBOB	3693,45,0,Level2Apfel,Level2Apfel
		SETBOB	3717,175,0,Level2Marktstand,Level2Marktstand
		SETBOB	3734,124,0,Level2ShopBob3,Level2ShopBob3
		SETBOB	3736,69,0,Level2BombBob,Level2BombBob
		SETBOB	3770,1,0,Level2SeifenBlase,Level2SeifenBlase
		SETBOB	3780,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	3825,1,0,Level2SeifenBlase,Level2SeifenBlase
		SETBOB	3826,24,0,Level2Blatt,Level2Blatt
		SETBOB	3845,56,0,Level2Blatt,Level2Blatt
		SETBOB	3860,175,0,Level2Dame,Level2Dame
		SETBOB	3867,40,0,Level2Blatt,Level2Blatt
		SETBOB	3984,27,0,Level2Blatt,Level2Blatt

		SETBOB	4002,48,0,Level2Blatt,Level2Blatt
		SETBOB	4026,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	4115,33,0,Level2CubeBob1,Level2CubeBob1
		SETBOB	4142,34,0,Level2CheeseBob,Level2CheeseBob
		SETBOB	4153,69,0,Level2BonusBob3,Level2BonusBob3
		SETBOB	4175,159,0,Level2RedCar,Level2RedCar
		SETBOB	4230,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	4250,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	4260,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	4290,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	4304,174,0,Level2Kugel,Level2Kugel
		SETBOB	4344,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	4376,140,0,Level2Kugel,Level2Kugel
		SETBOB	4456,143,0,Level2EinradL,Level2EinradL
		SETBOB	4485,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	4503,51,0,Level2CubeBob2,Level2CubeBob2
		SETBOB	4527,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	4543,143,0,Level2Schere,Level2Schere
		SETBOB	4562,42,0,Level2Blatt,Level2Blatt
		SETBOB	4614,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	4616,95,0,Level2AmigaBall,Level2AmigaBall
		SETBOB	4648,94,0,Level2CoinBob,Level2CoinBob
		SETBOB	4700,94,0,Level2CoinBob,Level2CoinBob

		SETBOB	4755,175,0,Level2DameBonus,Level2DameBonus
		SETBOB	4764,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	4813,71,0,Level2Blatt,Level2Blatt
		SETBOB	4842,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	4847,77,0,Level2Blatt,Level2Blatt
		SETBOB	4850,175,0,Level2HerrL,Level2HerrL
		SETBOB	4890,175,0,Level2HerrL,Level2HerrL
		SETBOB	4900,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	4919,44,0,Level2Blatt,Level2Blatt
		SETBOB	4944,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	4960,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5017,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5077,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5078,139,0,Level2CubeBob3,Level2CubeBob3
		SETBOB	5098,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	5107,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5148,71,0,Level2KackVogel,Level2KackVogel
		SETBOB	5167,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5224,154,0,Level2LBieneSlow,0
		SETBOB	5227,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5233,135,0,Level2LBieneSlow,0
		SETBOB	5251,125,0,Level2LBieneFast,0
		SETBOB	5268,152,0,Level2LBieneSlow,0
		SETBOB	5270,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	5286,71,0,Level2KackVogel,Level2KackVogel
		SETBOB	5287,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5290,138,0,Level2LBieneFast,0
		SETBOB	5299,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	5304,119,0,Level2LBieneSlow,0
		SETBOB	5341,78,0,Level2CubeBob4,Level2CubeBob4
		SETBOB	5341,152,0,Level2LBieneFast,0
		SETBOB	5347,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5407,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5412,71,0,Level2KackVogel,Level2KackVogel
		SETBOB	5437,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5497,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5542,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	5557,1,0,Level2Tropfen,Level2Tropfen
		SETBOB	5595,75,0,Level2FrageZeichen,Level2FrageZeichen

		SETBOB	5615,15,0,Level2Blatt,Level2Blatt
		SETBOB	5704,154,0,Level2JumpBob,Level2JumpBob
		SETBOB	5704,89,0,Level2CubeBob1,Level2CubeBob1
		SETBOB	5704,35,0,Level2BonusBob1,Level2BonusBob1
		SETBOB	5766,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	5768,45,0,Level2SeifenBlase,Level2SeifenBlase
		SETBOB	5843,158,0,Level2Wasser,Level2Wasser
		SETBOB	5862,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	5873,127,0,Level2SandUhr,Level2SandUhr
		SETBOB	5888,158,0,Level2Wasser,Level2Wasser
		SETBOB	5980,44,0,Level2Blatt,Level2Blatt

		SETBOB	6012,23,0,Level2Blatt,Level2Blatt
		SETBOB	6063,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	6100,126,0,Level2GetJobBob2,Level2GetJobBob2
		SETBOB	6132,175,0,Level2HerrLRBonus,Level2HerrLRBonus
		SETBOB	6185,175,0,Level2Hund,Level2Hund
		SETBOB	6213,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	6217,82,0,Level2CubeBob2,Level2CubeBob2
		SETBOB	6240,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	6290,10,0,Level2Flieger,Level2Flieger
		SETBOB	6336,10,0,Level2Flieger,Level2Flieger
		SETBOB	6390,10,0,Level2Flieger,Level2Flieger
		SETBOB	6408,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	6420,10,0,Level2Flieger,Level2Flieger

		SETBOB	6568,33,0,Level2MagnetoBob,Level2MagnetoBob
		SETBOB	6583,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	6590,152,0,Level2Pfeil,Level2Pfeil
		SETBOB	6630,152,0,Level2Pfeil,Level2Pfeil
		SETBOB	6670,152,0,Level2Pfeil,Level2Pfeil
		SETBOB	6648,108,0,Level2CubeBob3,Level2CubeBob3
		SETBOB	6692,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	6724,159,0,Level2RedCar,Level2RedCar
		SETBOB	6776,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	6887,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	6919,130,0,Level2Plattform,Level2Plattform
		SETBOB	6920,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	6970,155,0,Level2Plattform,Level2Plattform
		SETBOB	6977,55,0,Level2KackVogel,Level2KackVogel

		SETBOB	7000,115,0,Level2Plattform,Level2Plattform
		SETBOB	7040,158,0,Level2Plattform,Level2Plattform

		SETBOB	7100,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	7192,15,0,Level2CubeBob4,Level2CubeBob4
		SETBOB	7253,39,0,Level2KackVogel,Level2KackVogel

		SETBOB	7336,27,0,Level2Apfel,Level2Apfel
		SETBOB	7364,120,0,Level2BonusBob1,Level2BonusBob1
		SETBOB	7370,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	7386,15,0,Level2HonkBob,Level2HonkBob

		SETBOB	7454,33,0,Level2Blatt,Level2Blatt
		SETBOB	7462,66,0,Level2Apfel,Level2Apfel
		SETBOB	7531,13,0,Level2Blatt,Level2Blatt
		SETBOB	7562,51,0,Level2Apfel,Level2Apfel
		SETBOB	7589,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	7695,1,$FD00,Level2RotBall,Level2RotBall
		SETBOB	7745,1,$FD00,Level2RotBall,Level2RotBall
		SETBOB	7790,1,$FD00,Level2RotBall,Level2RotBall
		SETBOB	7779,127,0,Level2Kessel,Level2Kessel
		SETBOB	7817,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	7825,127,$FD00,Level2RotBall,Level2RotBall
		SETBOB	7832,49,0,Level2CubeBob1,Level2CubeBob1
		SETBOB	7850,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	7860,0,$FD00,Level2RotBall,Level2RotBall
		SETBOB	7899,33,0,Level2Blatt,Level2Blatt
		SETBOB	7920,127,$FD00,Level2RotBall,Level2RotBall
		SETBOB	7959,52,0,Level2CubeBob2,Level2CubeBob2
		SETBOB	8045,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	8055,19,0,Level2BombBob,Level2BombBob
		SETBOB	8125,1,0,Level2SeifenBlase,Level2SeifenBlase
		SETBOB	8210,1,0,Level2SeifenBlase,Level2SeifenBlase
		SETBOB	8230,1,0,Level2SeifenBlase,Level2SeifenBlase
		SETBOB	8368,175,0,Level2HerrLR,Level2HerrLR
		SETBOB	8390,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	8400,33,0,Level2CubeBob4,Level2CubeBob4
		SETBOB	8498,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	8504,115,0,Level2JumpBob,Level2JumpBob
		SETBOB	8518,95,$FD00,Level2WeissBall,Level2WeissBall
		SETBOB	8560,95,$FD00,Level2WeissBall,Level2WeissBall
		SETBOB	8615,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	8630,95,$FD00,Level2WeissBall,Level2WeissBall
		SETBOB	8637,95,0,Level2BlauKopf,Level2BlauKopf
		SETBOB	8651,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	8699,109,0,Level2Atom,Level2Atom
		SETBOB	8740,41,0,Level2BonusBob1,Level2BonusBob1
		SETBOB	8777,82,0,Level2CubeBob1,Level2CubeBob1
		SETBOB	8786,39,0,Level2Blatt,Level2Blatt
		SETBOB	8837,74,0,Level2Blatt,Level2Blatt
		SETBOB	8889,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	8931,43,0,Level2Blatt,Level2Blatt

		SETBOB	9000,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	9000,128,0,Level2LBieneSlow,0
		SETBOB	9027,153,0,Level2LBieneFast,0
		SETBOB	9042,39,0,Level2KackVogel,Level2KackVogel
		SETBOB	9080,160,0,Level2LBieneSlow,0
		SETBOB	9130,120,0,Level2LBieneSlow,0
		SETBOB	9136,175,0,Level2Hydrant,Level2Hydrant
		SETBOB	9220,175,0,Level2HerrLR,Level2HerrLR
		SETBOB	9225,83,0,Level2CubeBob4,Level2CubeBob4

		SETBOB	9236,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	9353,51,0,Level2Apfel,Level2Apfel
		SETBOB	9416,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	9430,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	9473,63,0,Level2Apfel,Level2Apfel
		SETBOB	9512,32,0,Level2Apfel,Level2Apfel
		SETBOB	9548,55,0,Level2KackVogel,Level2KackVogel
		SETBOB	9613,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	9618,77,0,Level2JumpBob,Level2JumpBob
		SETBOB	9672,20,0,Level2Blatt,Level2Blatt
		SETBOB	9684,48,0,Level2Blatt,Level2Blatt
		SETBOB	9714,175,0,Level2HerrLR,Level2HerrLR
		SETBOB	9717,33,0,Level2Blatt,Level2Blatt
		SETBOB	9733,23,0,Level2KackVogel,Level2KackVogel
		SETBOB	9841,23,0,Level2KackVogel,Level2KackVogel

		SETBOB	9834,175,0,Level2BusStop,Level2BusStop

		SETBOB	30000,0,0,0,0

****************************************************************************

Lev2SkateBoarder:
		SETDATA		Level2Bob58,WonderVars+BobBase
GlobalSkate:	SETANIM		1$
		SETMOVE		2$
		SETANIMSPEED	4
		SETMOVESTEP	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETUSERDATA	$05000000
		ENDE

1$:		FOR	5
		 dc.w	3,4,5,4,3
		NEXT
		FOR	5
		 dc.w	0,1,2,1,0
		NEXT
		LOOP

2$:		LEFT	100
		RIGHT	100
		LOOP

****************************************************************************

Lev2RedCar:	SETDATA		Level2Bob19,WonderVars+BobBase
RedCarGlobal:	SETANIM		1$
		SETMOVE		2$
		SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		ENDE

1$:		FOR		17
		 dc.w		2,3
		NEXT
		FOR		17
		 dc.w		0,1
		NEXT
		LOOP

2$:		LEFT		68
		RIGHT		68
		LOOP

****************************************************************************

Lev2Einrad:	SETDATA		Level2Bob128,WonderVars+BobBase
GlobalEinrad:	SETANIM		EinradAnim
		SETMOVE		EinradMove

EinradGlobal:	SETANIMSPEED	2
		SETMOVESTEP	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETUSERDATA	$05000000
		ENDE

EinradAnim:	ANIMTO		0,11
		ANIMTO		0,11
		ANIMTO		11,0
		ANIMTO		11,0
		LOOP

EinradMove:	CPUJUMP		Coin,0
		FOR		46
		 CPUJUMP	Coin,1
		 LEFT		1
		NEXT
		FOR		46
		 CPUJUMP	Coin,1
		 RIGHT		1
		NEXT
		LOOP

****************************************************************************

Lev2EinradL:	SETDATA		Level2Bob128,WonderVars+BobBase
GlobalLEinrad:	SETANIM		EinradAnimL
		SETMOVE		EinradMoveL
		GOTO		EinradGlobal

EinradAnimL:	ANIMTO		0,11
		LOOP

EinradMoveL:	CPUJUMP		Coin,0
		FOR		20000
		 CPUJUMP	Coin,1
		 LEFT		1
		NEXT
		LOOP

****************************************************************************

Lev2Blatt:	SETDATA		Level2Bob111,WonderVars+BobBase
GlobalBlatt:	SETANIM		1$
		SETANIMSPEED	3
		SETMOVE		2$
		SETUSERFLAGS	BOBF_REMOVE
		SETHITMASK	RONNY_HITCOLL
		ENDE

1$:		ANIMTO		0,5
		LOOP

2$:		DELAY		20
		SETMOVESTEP	2
		DOWN		75
		SETMOVESTEP	150
		UP		1
		LOOP

****************************************************************************

Lev2WeissBall:	SETDATA		Level2Bob46,WonderVars+BobBase
		GOTO		GlobalBall

Lev2RotBall:	SETDATA		Level2Bob54,WonderVars+BobBase
GlobalBall:	SETANIM		1$
		SETMOVE		2$
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_STURZ
		ENDE

1$:		SETANIMSPEED	2
		ANIMTO		3,0
		LOOP

2$:		CPUJUMP		Coin,0			* Init
		FOR		25000
		 CPUJUMP	Coin,1			* Move
		 DELAY		1
		NEXT
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

****************************************************************************

Lev2Hydrant:	SETDATA		Level2Bob53,WonderVars+BobBase
		SETUSERFLAGS	BOBF_REMOVE
		ENDE		

****************************************************************************

Lev2Atom:	SETDATA		Level2Bob67,WonderVars+BobBase
GlobalAtom:	SETANIM		1$
		SETANIMSPEED	2
		SETMOVESTEP	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETUSERDATA	$05000000
		ENDE

1$:		ANIMTO		0,5
		CPUJUMP		Play8SVX,Spacer
		ANIMTO		6,11
		CPUJUMP		Play8SVX,Spacer
		LOOP

****************************************************************************

Lev2Marktstand:	SETDATA		Level2Bob182,WonderVars+BobBase
		SETID		SHOP1_ID
GlobalShop:	SETUSERFLAGS	BOBF_REMOVE
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	ShopColl
		ENDE

****************************************************************************

Lev2Wasser:	SETDATA		Level2Bob50,WonderVars+BobBase
GlobalWasser:	SETANIM		1$
		SETANIMSPEED	5
		SETMOVE		2$
		SETUSERFLAGS	BOBF_REMOVE
		SETHITMASK	RONNY_HITCOLL
		SETPRI		60
		ENDE

1$:		FOR		5
		 dc.w		0,1,2
		NEXT
		LSIGNAL		1
		RNDDELAY	50,100
		LSIGNAL		1
		LOOP

2$:		SETMOVESTEP	200
		LWAIT		1
		DOWN		1
		LWAIT		1
		UP		1
		LOOP

****************************************************************************

Lev2Apfel:	SETDATA		Level2Bob23,WonderVars+BobBase
ApfelGlobal:	SETMOVE		2$
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE

2$:		CPUJUMP		Coin,0			* Init
		FOR		25000
		 CPUJUMP	Coin,1			* Move
		 DELAY		1
		NEXT
		CPUJUMP		CommonRemBobTest,0
 		REMOVE
		ENDE

****************************************************************************

Lev2KackVogel:	SETDATA		Level2Bob14,WonderVars+BobBase
		SETANIM		1$
		GOTO		Global

1$:		RNDDELAY	180,220
		ADDRELBOB	2$,0,0
		LOOP

****************************************************************************

2$:		SETDATA		Level2Bob15,WonderVars+BobBase
		SETMOVE		3$
		SETMOVESTEP	4
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETHITMASK	RONNY_HITCOLL
		ENDE

3$:		DOWN		45
		REMOVE
		ENDE

****************************************************************************

Lev2Tropfen:	SETDATA		Level2Bob16,WonderVars+BobBase
		GOTO		Tropfen2

****************************************************************************

Lev2Hund:	SETDATA		Level2Bob164,WonderVars+BobBase
		GOTO		GlobalHund2

****************************************************************************

Lev2Pfeil:	SETDATA		Level2Bob183,WonderVars+BobBase
		SETMOVE		PfeilMove
		SETUSERDATA	$04000000
GlobalPfeil:	SETANIM		PfeilAnim
		SETMOVESTEP	2
		SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE

PfeilMove:	LEFT		60
		RIGHT		60
		LOOP

PfeilAnim:	ANIMTO		0,11
		LOOP

****************************************************************************

Lev2LBieneFast:	SETDATA		Level2Bob178,WonderVars+BobBase
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		GOTO		LBieneFast2

Lev2LBieneSlow:	SETDATA		Level2Bob178,WonderVars+BobBase
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		GOTO		LBieneSlow2

****************************************************************************

Lev2Plattform2:	SETDATA		Level2Bob36,WonderVars+BobBase
		SETMOVE		PlattMove2
		GOTO		PlattGlobal

Lev2Plattform:	SETDATA		Level2Bob36,WonderVars+BobBase
		SETMOVE		PlattMove
PlattGlobal:	SETANIM		PlattAnim
		SETANIMSPEED	2
		SETMOVESTEP	2
		SETUSERDATA	$02000000
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE
			
PlattAnim:	ANIMTO		0,9
		LOOP

PlattMove:	LEFT		180
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

PlattMove2:	LEFT		25
		RIGHT		25
		LOOP

****************************************************************************

Lev2HerrLRBonus:
		SETDATA		Level2Bob150,WonderVars+BobBase
		SETANIM		FussAnim2
		SETMOVE		FussMove2
		SETMOVESTEP	12
		SETANIMSPEED	2
		SETID		LADY2_ID
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		SETUSERFLAGS	BOBF_REMOVE
		ENDE

Lev2HerrL:	SETDATA		Level2Bob150,WonderVars+BobBase
		SETANIM		FussAnim3
		SETMOVE		FussMove3
		SETMOVESTEP	12
		GOTO		FussGlobal

Lev2HerrLR:	SETDATA		Level2Bob150,WonderVars+BobBase
HerrGlobal:	SETANIM		FussAnim2
		SETMOVE		FussMove2
		SETMOVESTEP	12
		GOTO		FussGlobal

FussAnim2:	FOR		3
		 ANIMTO		0,6
		 LSIGNAL	1
		NEXT
		FOR		3
		 ANIMTO		7,13
		 LSIGNAL	1
		NEXT
		LOOP

FussMove2:	FOR		3
		 LWAIT		1
		 LEFT		1
		NEXT
		FOR		3
		 LWAIT		1
		 RIGHT		1
		NEXT
		LOOP

FussAnim3:	ANIMTO		0,6
		LSIGNAL		1
		LOOP

FussMove3:	FOR		30
		 LWAIT		1
		 LEFT		1
		NEXT
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE


****************************************************************************

Lev2DameBonus:	SETDATA		Level2Bob24,WonderVars+BobBase
		SETID		LADY1_ID
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		GOTO		DameGlobal

Lev2Dame:	SETDATA		Level2Bob24,WonderVars+BobBase
DameGlobal:	SETANIM		DameAnim2
		SETMOVE		DameMove2
		SETMOVESTEP	11
		SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE
		ENDE

DameAnim2:	FOR		7
		 ANIMTO		6,11
		 LSIGNAL	1
		NEXT
		FOR		7
		 ANIMTO		0,5
		 LSIGNAL	1
		NEXT
		LOOP

DameMove2:	FOR		7
		 LWAIT		1
		 LEFT		1
		NEXT
		FOR		7
		 LWAIT		1
		 RIGHT		1
		NEXT
		LOOP

BonusDameGlobal:
		SETANIM		DameAnim3
		SETMOVE		DameMove3
		SETMOVESTEP	11
		SETANIMSPEED	3
		SETUSERFLAGS	BOBF_REMOVE
		ENDE

DameAnim3:	FOR		2
		 ANIMTO		6,11
		 LSIGNAL	1
		NEXT
		FOR		2
		 ANIMTO		0,5
		 LSIGNAL	1
		NEXT
		LOOP

DameMove3:	FOR		2
		 LWAIT		1
		 LEFT		1
		NEXT
		FOR		2
		 LWAIT		1
		 RIGHT		1
		NEXT
		LOOP

****************************************************************************

Lev2BlauKopf:	SETDATA		Level2Bob93,WonderVars+BobBase
HutGlobal:	SETMOVE		BlauMove
		SETANIM		BlauAnim
BlauKopfGlobal:	SETANIMSPEED	2
		SETMOVESTEP	2
		SETUSERDATA	$05000000
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE
			
BlauMove:	LEFT		45
		RIGHT		45
		LOOP

BlauAnim:	ANIMTO		0,11
		LOOP

****************************************************************************

Lev2Flieger:	SETDATA		Level2Bob6,WonderVars+BobBase
FliegerGlobal:	SETANIM		FliegerAnim
		SETMOVE		FliegerMove
		SETANIMSPEED	3
		SETMOVESTEP	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETUSERDATA	$02000000
		ENDE

FliegerAnim:	ANIMTO		0,5
		ANIMTO		4,1
		LOOP

FliegerMove:	FOR		30
		 LEFT		2
		 DOWN		1
		NEXT
		FOR		40
		 LEFT		2
		 UP		1
		NEXT
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

****************************************************************************

Lev2Kugel:	SETDATA		Level2Bob79,WonderVars+BobBase
		SETMOVE		1$
		SETANIM		2$
		GOTO		BlauKopfGlobal

1$:		LEFT		50
		RIGHT		50
		LOOP

2$:		ANIMTO		0,13
		LOOP

****************************************************************************

Lev2AmigaBall:	SETDATA		Level2Bob146,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		4$
		SETANIMSPEED	3
		SETHITMASK	RONNY_HITCOLL
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		GOTO		Global

1$:		ANIMTO		3,0
		LOOP

4$:		ADDRELBOB	2$,0,0
		DELAY		200
		LOOP

2$:		SETDATA		Level2Bob146,WonderVars+BobBase
		SETANIM		3$
		SETMOVE		LFassSubMove
		SETANIMSPEED	3
		SETHITMASK	RONNY_HITCOLL
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETUSERFLAGS	BOBF_ENEMY
		SETPRI		-1
		ENDE

3$:		ANIMTO		3,0
		LOOP

****************************************************************************

Lev2Kessel:	SETDATA		Level2Bob123,WonderVars+BobBase
GlobalKessel:	SETANIM		1$
		SETANIMSPEED	3
		SETUSERDATA	$02000000
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		GOTO		Global

1$:		ANIMTO		0,2
		ADDRELBOB	2$,0,2
		dc.w		3
		RNDDELAY	30,40
		LOOP

2$:		SETDATA		Level2Bob127,WonderVars+BobBase
		SETMOVE		3$
		SETMOVESTEP	4
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETHITMASK	RONNY_HITCOLL
		ENDE

3$:		DOWN		45
		REMOVE
		ENDE

****************************************************************************

Lev2LSeifenBlase:
		SETDATA		Level2Bob64,WonderVars+BobBase
SeifenGlobal:	SETANIM		1$
		SETMOVE		2$
		GOTO		SeifeGlobal
	
1$:		ANIMTO		0,2
		LOOP

2$:		LEFT		25
		RIGHT		25
		LOOP

Lev2SeifenBlase:
		SETDATA		Level2Bob64,WonderVars+BobBase
GlobalSeife:	SETMOVE		SeifeMove
SeifeGlobal:	SETANIM		SeifeAnim
		SETANIMSPEED	4
		SETMOVESTEP	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETUSERDATA	$01000000
		ENDE

SeifeAnim:	FOR		24
		 ANIMTO		0,2
		NEXT
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE		

SeifeMove:	CPUJUMP		Coin,0			* Init
		FOREVER
		 CPUJUMP	Coin,1			* Move
		 DELAY		2
		NEXT

****************************************************************************

Lev2Schere:	SETDATA		Level2Bob12,WonderVars+BobBase
SchereGlobal:	SETMOVE		SchereMove
SchereGlobal2:	SETANIM		SchereAnim
		SETANIMSPEED	4
		SETMOVESTEP	2
		SETUSERDATA	$02000000
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE

SchereMove:	UP		35
		DOWN		35
		LOOP

SchereAnim:	dc.w		0,1
		LOOP

****************************************************************************

Lev2HüpfClown:	SETDATA		Level2Bob172,WonderVars+BobBase
GlobalClown:	SETMOVE		1$
		SETANIM		2$
		SETANIMSPEED	4
		SETMOVESTEP	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETUSERDATA	$01000000
		ENDE

1$:		LEFT		48
		RIGHT		48
		LOOP		

2$:		FOR		3
		 ANIMTO		3,5
		 dc.w		4,3
		NEXT
		FOR		3
		 ANIMTO		0,2
		 dc.w		1,0
		NEXT
		LOOP

3$:		move.b		#1,bob_UserData+ud_FallingDist(a0)
		move.b		#$80,bob_UserData+ud_XMove(A0)
		rts


****************************************************************************

Hupe:		SoundFX	sfx_Hupe,3710,690,45
Spacer:		SoundFX	sfx_Spacer,1524,790,60
