************************************************************************************
***  Level1
************************************************************************************

		XDEF	EnemyList3
		XDEF	Level3BobTab

		XDEF	BuchGlobal

		XREF	ShootColl,RonnyColl,EnergyColl,HealthColl

		XREF	FallHandler,CommonRemBob,CommonRemBobTest,WonderVars
		XREF	GetElem,GetInfo,ShopColl

		XREF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XREF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XREF	ImmerShopBob1
		XREF	ImmerCoinBob,Coin,ImmerEmptyBob
		XREF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XREF	ImmerGetJobBob4,ImmerGetJobBob5
		XREF	ImmerBusStop1,ImmerSandUhr

		XREF	ImmerHaus13Bob,ImmerHaus64Bob,Job1Done
		XREF	Play8SVX,Blip

		XREF	Global,LKeuleGlobal,LBiene,FussGänger
		XREF	KopfGlobal,KopfBigGlobal,GlobalPfeil
		XREF	LokGlobal,PlattGlobal
		XREF	BonusDameGlobal,DameGlobal

		INCLUDE "myexec.i"
		INCLUDE	"drawbob.i"
		INCLUDE	"sfx.i"
		INCLUDE	"definitions.i"
		INCLUDE	"Gfx/Level3Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"

	STRUCTURE Level3bobStructure,0

		BYTE	Level3Dummy
		BYTE	Level3ShopBob2
		BYTE	Level3CoinBob
		BYTE	Level3CubeBob1
		BYTE	Level3CubeBob2
		BYTE	Level3CubeBob3
		BYTE	Level3CubeBob4
		BYTE	Level3JumpBob
		BYTE	Level3CheeseBob
		BYTE	Level3BombBob
		BYTE	Level3MagnetoBob
		BYTE	Level3HonkBob
		BYTE	Level3BonusBob1
		BYTE	Level3BonusBob3
		BYTE	Level3FrageZeichen
		BYTE	Level3Haus13Bob
		BYTE	Level3Haus64Bob
		BYTE	Level3EmptyBob
		BYTE	Level3GetJobBob
		BYTE	Level3GetJobBob2
		BYTE	Level3BusStop
		BYTE	Level3SandUhr

		BYTE	Level3KackVogel
		BYTE	Level3RedCar
		BYTE	Level3Buch
		BYTE	Level3BuchX
		BYTE	Level3Kopf
		BYTE	Level3KopfXY
		BYTE	Level3RedCar120
		BYTE	Level3BlueCar32
		BYTE	Level3Man
		BYTE	Level3KugelSG
		BYTE	Level3KugelSGX
		BYTE	Level3KugelSW
		BYTE	Level3KugelSWX
		BYTE	Level3Lok
		BYTE	Level3Platt120
		BYTE	Level3Platt60
		BYTE	Level3Dame
		BYTE	Level3Star1
		BYTE	Level3Star2
		BYTE	Level3Star3
		BYTE	Level3Töff
		BYTE	Level3LKW
		BYTE	Level3RedPW
		BYTE	Level3BluePW

Level3BobTab:	dc.l	0			* Dummy
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
		dc.l	ImmerHaus13Bob
		dc.l	ImmerHaus64Bob
		dc.l	ImmerEmptyBob
		dc.l	ImmerGetJobBob4
		dc.l	ImmerGetJobBob5
		dc.l	ImmerBusStop1
		dc.l	ImmerSandUhr

		dc.l	Lev3KackVogel
		dc.l	Lev3RedCar
		dc.l	Lev3Buch
		dc.l	Lev3BuchX
		dc.l	Lev3Kopf
		dc.l	Lev3KopfXY
		dc.l	Lev3RedCar120
		dc.l	Lev3BlueCar32
		dc.l	Lev3Man
		dc.l	Lev3KugelSG
		dc.l	Lev3KugelSGX
		dc.l	Lev3KugelSW
		dc.l	Lev3KugelSWX
		dc.l	Lev3Lok
		dc.l	Lev3Platt120
		dc.l	Lev3Platt60
		dc.l	Lev3Dame
		dc.l	Lev3Star1
		dc.l	Lev3Star2
		dc.l	Lev3Star3
		dc.l	Lev3Töff
		dc.l	Lev3LKW
		dc.l	Lev3RedPW
		dc.l	Lev3BluePW

		SECTION	MyData,DATA

	*** XPOS(Relativ to LevelX),YPOS,BOB ***

		SETBOB	-30000,0,0,0,0
EnemyList3:
		SETBOB	-24,100,0,Level3CubeBob3,Level3CubeBob3

		SETBOB	91,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	146,175,0,Level3RedCar,0
		SETBOB	159,106,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	177,39,0,Level3KackVogel,Level3KackVogel
		SETBOB	208,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	364,114,0,Level3CubeBob1,Level3CubeBob1
		SETBOB	367,39,0,Level3KackVogel,Level3KackVogel
		SETBOB	408,47,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	425,30,0,Level3CubeBob2,Level3CubeBob2
		SETBOB	440,47,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	552,34,0,Level3HonkBob,Level3HonkBob
		SETBOB	648,82,0,Level3CubeBob3,Level3CubeBob3
		SETBOB	712,39,0,Level3KackVogel,Level3KackVogel
		SETBOB	773,67,0,Level3FrageZeichen,Level3FrageZeichen
		SETBOB	776,27,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	805,55,0,Level3KackVogel,Level3KackVogel
		SETBOB	893,71,0,Level3KackVogel,Level3KackVogel
		SETBOB	925,127,0,Level3RedCar120,Level3RedCar120
		SETBOB	928,55,0,Level3KackVogel,Level3KackVogel
		SETBOB	1133,74,0,Level3CubeBob4,Level3CubeBob4
		SETBOB	1193,90,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	1233,175,0,Level3Man,Level3Man
		SETBOB	1256,37,0,Level3CoinBob,Level3CoinBob
		SETBOB	1282,15,0,Level3CoinBob,Level3CoinBob
		SETBOB	1309,15,0,Level3CoinBob,Level3CoinBob
		SETBOB	1383,63,0,Level3BlueCar32,Level3BlueCar32
		SETBOB	1439,17,0,Level3CubeBob1,Level3CubeBob1
		SETBOB	1592,225,0,Level3Kopf,Level3Kopf
		SETBOB	1592,145,0,Level3Kopf,Level3Kopf
		SETBOB	1618,55,0,Level3KackVogel,Level3KackVogel
		SETBOB	1636,55,0,Level3KackVogel,Level3KackVogel
		SETBOB	1705,59,0,Level3CoinBob,Level3CoinBob
		SETBOB	1717,60,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	1769,36,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	1795,74,0,Level3CubeBob2,Level3CubeBob2
		SETBOB	1912,46,0,Level3CoinBob,Level3CoinBob
		SETBOB	1962,175,0,Level3BluePW,0
		SETBOB	1996,55,0,Level3KackVogel,Level3KackVogel

		SETBOB	2000,83,0,Level3CoinBob,Level3CoinBob
		SETBOB	2045,161,0,Level3FrageZeichen,Level3FrageZeichen
		SETBOB	2046,167,0,Level3KugelSG,Level3KugelSG
		SETBOB	2060,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	2138,58,0,Level3CubeBob3,Level3CubeBob3
		SETBOB	2240,55,0,Level3KackVogel,Level3KackVogel

		SETBOB	2275,0,0,Level3Star1,Level3Star1
		SETBOB	2300,5,0,Level3Star2,Level3Star2
		SETBOB	2317,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	2325,0,0,Level3Star3,Level3Star3
		SETBOB	2350,10,0,Level3Star1,Level3Star1
		SETBOB	2375,5,0,Level3Star2,Level3Star2
		SETBOB	2400,0,0,Level3Star3,Level3Star3
		SETBOB	2425,10,0,Level3Star1,Level3Star1
		SETBOB	2428,55,0,Level3KackVogel,Level3KackVogel
		SETBOB	2450,0,0,Level3Star2,Level3Star2
		SETBOB	2475,5,0,Level3Star3,Level3Star3

		SETBOB	2500,0,0,Level3Star1,Level3Star1
		SETBOB	2525,10,0,Level3Star2,Level3Star2

		SETBOB	2650,61,0,Level3Platt120,Level3Platt120
		SETBOB	2732,44,0,Level3FrageZeichen,Level3FrageZeichen
		SETBOB	2745,61,0,Level3Platt60,Level3Platt60
		SETBOB	2802,138,0,Level3Platt60,Level3Platt60
		SETBOB	2861,16,0,Level3CoinBob,Level3CoinBob
		SETBOB	2870,40,0,Level3Platt120,Level3Platt120
		SETBOB	2968,78,0,Level3CoinBob,Level3CoinBob

		SETBOB	3016,30,0,Level3BonusBob3,Level3BonusBob3
		SETBOB	3017,71,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3074,14,0,Level3CubeBob4,Level3CubeBob4
		SETBOB	3110,175,0,Level3GetJobBob,Level3GetJobBob
		SETBOB	3131,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	3140,17,0,Level3CoinBob,Level3CoinBob
		SETBOB	3140,175,0,Level3Töff,0
		SETBOB	3211,23,0,Level3KackVogel,Level3KackVogel

		SETBOB	3260,0,$fe00,Level3CoinBob,Level3CoinBob
		SETBOB	3260,0,$ff00,Level3CoinBob,Level3CoinBob
		SETBOB	3260,0,0,Level3CoinBob,Level3CoinBob
		SETBOB	3260,0,$0100,Level3CoinBob,Level3CoinBob
		SETBOB	3260,0,$0200,Level3CoinBob,Level3CoinBob

		SETBOB	3400,23,0,Level3KackVogel,Level3KackVogel

		SETBOB	3483,111,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3509,111,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3529,111,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3549,111,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3569,111,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3589,111,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3609,111,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3629,111,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3649,111,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	3669,111,0,Level3EmptyBob,Level3EmptyBob

		SETBOB	3734,76,0,Level3JumpBob,Level3JumpBob
		SETBOB	3864,16,0,Level3CubeBob1,Level3CubeBob1
		SETBOB	3969,80,0,Level3CoinBob,Level3CoinBob

		SETBOB	4000,33,0,Level3CoinBob,Level3CoinBob
		SETBOB	4024,148,0,Level3Haus13Bob,Level3Haus13Bob
		SETBOB	4071,111,0,Level3EmptyBob,Level3EmptyBob

		SETBOB	4152,132,0,Level3ShopBob2,Level3ShopBob2
		SETBOB	4159,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	4162,16,0,Level3CubeBob2,Level3CubeBob2

		SETBOB	4255,39,0,Level3KackVogel,Level3KackVogel

		SETBOB	4370,121,0,Level3BuchX,Level3BuchX
		SETBOB	4372,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	4377,83,0,Level3EmptyBob,Level3EmptyBob

		SETBOB	4400,150,0,Level3BuchX,Level3BuchX
		SETBOB	4420,168,0,Level3BuchX,Level3BuchX
		SETBOB	4450,110,0,Level3BuchX,Level3BuchX
		SETBOB	4470,140,0,Level3BuchX,Level3BuchX
		SETBOB	4567,39,0,Level3KackVogel,Level3KackVogel
		SETBOB	4624,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	4747,39,0,Level3KackVogel,Level3KackVogel
		SETBOB	4809,71,0,Level3KackVogel,Level3KackVogel
		SETBOB	4900,71,0,Level3KackVogel,Level3KackVogel

		SETBOB	5063,123,0,Level3GetJobBob2,Level3GetJobBob2
		SETBOB	5064,15,0,Level3BombBob,Level3BombBob
		SETBOB	5078,175,0,Level3Dame,Level3Dame
		SETBOB	5081,154,0,Level3CubeBob3,Level3CubeBob3
		SETBOB	5089,8,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	5092,74+16,0,Level3KugelSW,Level3KugelSW

		SETBOB	5111,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	5163,8,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	5186,23,0,Level3KackVogel,Level3KackVogel

		SETBOB	5262,22,0,Level3CubeBob4,Level3CubeBob4

		SETBOB	5427,116,0,Level3Kopf,Level3Kopf
		SETBOB	5456,53,0,Level3FrageZeichen,Level3FrageZeichen

		SETBOB	5505,90,0,Level3CoinBob,Level3CoinBob

		SETBOB	5623,133,0,Level3SandUhr,Level3SandUhr
		SETBOB	5625,22,0,Level3CubeBob1,Level3CubeBob1

		SETBOB	5768,84,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	5768,110,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	5768,136,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	5839,20,0,Level3JumpBob,Level3JumpBob
		SETBOB	5930,126,0,Level3BlueCar32,Level3BlueCar32
		SETBOB	6000,39,0,Level3MagnetoBob,Level3MagnetoBob

		SETBOB	6100,10,$FE00,Level3KopfXY,0
		SETBOB	6130,10,$FE00,Level3KopfXY,0
		SETBOB	6158,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	6160,10,$FE00,Level3KopfXY,0
		SETBOB	6190,10,$FE00,Level3KopfXY,0
		SETBOB	6210,140,0,Level3Haus64Bob,Level3Haus64Bob
		SETBOB	6220,10,$FE00,Level3KopfXY,0
		SETBOB	6250,10,$FE00,Level3KopfXY,0
		SETBOB	6280,10,$FE00,Level3KopfXY,0

		SETBOB	6308,82,0,Level3FrageZeichen,Level3FrageZeichen

		SETBOB	6532,0,$fe00,Level3CoinBob,Level3CoinBob
		SETBOB	6532,0,$ff00,Level3CoinBob,Level3CoinBob
		SETBOB	6532,0,0,Level3CoinBob,Level3CoinBob
		SETBOB	6532,0,$0100,Level3CoinBob,Level3CoinBob
		SETBOB	6532,0,$0200,Level3CoinBob,Level3CoinBob

		SETBOB	6666,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	6675,175,0,Level3LKW,0
		SETBOB	6696,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	6725,23,0,Level3KackVogel,Level3KackVogel

		SETBOB	6800,0,0,Level3Star1,Level3Star1
		SETBOB	6825,10,0,Level3Star2,Level3Star2
		SETBOB	6850,0,0,Level3Star3,Level3Star3
		SETBOB	6875,5,0,Level3Star1,Level3Star1
		SETBOB	6900,10,0,Level3Star2,Level3Star2
		SETBOB	6925,0,0,Level3Star3,Level3Star3
		SETBOB	6950,10,0,Level3Star1,Level3Star1
		SETBOB	6970,140,0,Level3CubeBob3,Level3CubeBob3
		SETBOB	6975,0,0,Level3Star2,Level3Star2
		SETBOB	7000,5,0,Level3Star3,Level3Star3
		SETBOB	7000,110,0,Level3EmptyBob,Level3EmptyBob

		SETBOB	7100,55,0,Level3BonusBob1,Level3BonusBob1
		SETBOB	7220,43,0,Level3KugelSGX,Level3KugelSGX
		SETBOB	7239,144,0,Level3CubeBob3,Level3CubeBob3
		SETBOB	7212,165,0,Level3CubeBob4,Level3CubeBob4
		SETBOB	7477,6,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	7535,80,0,Level3CubeBob1,Level3CubeBob1
		SETBOB	7651,155,0,Level3CoinBob,Level3CoinBob
		SETBOB	7687,16,0,Level3BonusBob3,Level3BonusBob3
		SETBOB	7843,95,0,Level3RedCar120,Level3RedCar120
		SETBOB	7847,65,0,Level3CoinBob,Level3CoinBob
		SETBOB	8229,44,0,Level3CubeBob3,Level3CubeBob3
		SETBOB	8421,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	8460,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	8489,39,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	8580,55,0,Level3MagnetoBob,Level3MagnetoBob
		SETBOB	8582,166,0,Level3KugelSW,Level3KugelSW
		SETBOB	8643,87,0,Level3KackVogel,Level3KackVogel
		SETBOB	8644,167,0,Level3KugelSWX,Level3KugelSWX
		SETBOB	8696,27,0,Level3CubeBob4,Level3CubeBob4
		SETBOB	8757,87,0,Level3KackVogel,Level3KackVogel
		SETBOB	8787,87,0,Level3KackVogel,Level3KackVogel
		SETBOB	8928,73,0,Level3JumpBob,Level3JumpBob

		SETBOB	8930,0,$fe00,Level3CoinBob,Level3CoinBob
		SETBOB	8930,0,$ff00,Level3CoinBob,Level3CoinBob
		SETBOB	8930,0,0,Level3CoinBob,Level3CoinBob
		SETBOB	8930,0,$0100,Level3CoinBob,Level3CoinBob
		SETBOB	8930,0,$0200,Level3CoinBob,Level3CoinBob

		SETBOB	9238,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	9257,37,0,Level3CubeBob2,Level3CubeBob2
		SETBOB	9257,123,0,Level3CubeBob3,Level3CubeBob3
		SETBOB	9282,165,0,Level3Buch,0
		SETBOB	9328,132,0,Level3Buch,0
		SETBOB	9360,150,0,Level3Buch,0
		SETBOB	9395,100,0,Level3Buch,0
		SETBOB	9439,51,0,Level3CubeBob4,Level3CubeBob4
		SETBOB	9512,30,0,Level3FrageZeichen,Level3FrageZeichen
		SETBOB	9696,18,0,Level3CoinBob,Level3CoinBob
		SETBOB	9862,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	9916,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	9992,132,0,Level3CoinBob,Level3CoinBob
		SETBOB	10000,106,0,Level3Kopf,Level3Kopf
		SETBOB	10006,154,0,Level3JumpBob,Level3JumpBob
		SETBOB	10104,118,0,Level3CubeBob2,Level3CubeBob2
		SETBOB	10144,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	10167,17,0,Level3HonkBob,Level3HonkBob
		SETBOB	10193,100,0,Level3CoinBob,Level3CoinBob
		SETBOB	10225,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	10376,34,0,Level3FrageZeichen,Level3FrageZeichen
		SETBOB	10381,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	10414,175,0,Level3RedPW,0
		SETBOB	10612,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	10852,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	10909,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	10916,170,0,Level3CubeBob4,Level3CubeBob4
		SETBOB	10968,100,0,Level3Platt60,Level3Platt60
		SETBOB	10969,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	11000,120,0,Level3Platt60,Level3Platt60

		SETBOB	11026,110,0,Level3Platt60,Level3Platt60
		SETBOB	11059,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	11158,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	11167,175,0,Level3Dame,Level3Dame
		SETBOB	11254,23,0,Level3KackVogel,Level3KackVogel
		SETBOB	11290,54,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	11300,54,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	11310,54,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	11315,39,0,Level3KackVogel,Level3KackVogel
		SETBOB	11320,54,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	11330,54,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	11340,54,0,Level3EmptyBob,Level3EmptyBob
		SETBOB	11400,175,0,Level3BusStop,Level3BusStop
		SETBOB	11482,23,0,Level3KackVogel,Level3KackVogel

		SETBOB	30000,0,0,0,0

****************************************************************************

Lev3KackVogel:	SETDATA		Level3Bob134,WonderVars+BobBase
		SETANIM		1$
		GOTO		Global

1$:		RNDDELAY	180,220
		ADDRELBOB	2$,0,0
		LOOP

2$:		SETDATA		Level3Bob135,WonderVars+BobBase
		SETMOVE		3$
		SETMOVESTEP	4
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETHITMASK	RONNY_HITCOLL
		ENDE

3$:		DOWN		45
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

****************************************************************************

Lev3RedCar:	SETDATA		Level3Bob4,WonderVars+BobBase
		SETANIM		CarAnim
		SETMOVE		CarMove
		SETMOVESTEP	2
		SETUSERDATA	$04000000
		SETHITMASK	RONNY_STURZ
Lev3Global:	SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		ENDE


CarAnim:	RNDDELAY	40,60
		CPUJUMP		Play8SVX,Hupe
		LOOP

CarMove:	ADDDAUGHTER	Dampf,24,-9
		LEFT		160
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

Dampf:		SETDATA		Level3Bob135,WonderVars+BobBase
		SETANIM		1$
		SETANIMSPEED	2
		SETCLIP		0,0,0,0,CLIPF_ALL
		ENDE

1$:		ANIMTO		0,8
		LOOP


****************************************************************************

Lev3Buch:	SETDATA		Level3Bob83,WonderVars+BobBase
		GOTO		LKeuleGlobal

Lev3BuchX:	SETDATA		Level3Bob83,WonderVars+BobBase
BuchGlobal:	SETANIM		1$
		SETMOVE		2$
		SETMOVESTEP	2
		SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		GOTO		LBiene

1$:		ANIMTO		0,7
		LOOP

2$:		LEFT		110
		RIGHT		110
		LOOP

****************************************************************************

Lev3Kopf:	SETDATA		Level3Bob117,WonderVars+BobBase
		SETUSERDATA	$03000000
		GOTO		KopfBigGlobal

****************************************************************************

Lev3RedCar120:	SETDATA		Level3Bob144,WonderVars+BobBase
		SETANIM		AutoAnim120
		SETMOVE		AutoMove120
AutoBob:	SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		ENDE

AutoAnim120:	FOR		30
		 dc.w		2,3
		NEXT
		FOR		30
		 dc.w		0,1
		NEXT
		LOOP

AutoMove120:	LEFT		120
		RIGHT		120
		LOOP


Lev3BlueCar32:	SETDATA		Level3Bob148,WonderVars+BobBase
		SETANIM		AutoAnim32
		SETMOVE		AutoMove32
		GOTO		AutoBob

AutoAnim32:	FOR		8
		 dc.w		2,3
		NEXT
		FOR		8
		 dc.w		0,1
		NEXT
		LOOP

AutoMove32:	LEFT		32
		RIGHT		32
		LOOP

****************************************************************************

Lev3KopfXY:	SETDATA		Level3Bob117,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		2$
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		GOTO		LBiene

1$:		SETANIMSPEED	2
		ANIMTO		0,6
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

Lev3Man:	SETDATA		Level3Bob91,WonderVars+BobBase
		GOTO		FussGänger

****************************************************************************

Lev3KugelSW:	SETDATA		Level3Bob23,WonderVars+BobBase
		SETMOVE		SGMove
		GOTO		KugelSGGlobal
		
****************************************************************************

Lev3KugelSWX:	SETDATA		Level3Bob23,WonderVars+BobBase
		SETMOVE		SGMoveX
		GOTO		KugelSGGlobal
		
****************************************************************************

Lev3KugelSGX:	SETDATA		Level3Bob9,WonderVars+BobBase
		SETMOVE		SGMoveX
		GOTO		KugelSGGlobal

****************************************************************************
		
Lev3KugelSG:	SETDATA		Level3Bob9,WonderVars+BobBase
		SETMOVE		SGMove
KugelSGGlobal:	SETANIM		SGAnim
		SETMOVESTEP	2
		SETANIMSPEED	2
		SETUSERDATA	$03000000
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		GOTO		LBiene

SGMove:		UP		30
		CPUJUMP		Play8SVX,Blip
		DOWN		30
		CPUJUMP		Play8SVX,Blip
		LOOP

SGMoveX:	LEFT		120
		CPUJUMP		Play8SVX,Blip
		RIGHT		120
		CPUJUMP		Play8SVX,Blip
		LOOP

SGAnim:		ANIMTO		0,13
		LOOP

****************************************************************************

Lev3Lok:	SETDATA		Level3Bob8,WonderVars+BobBase
		GOTO		LokGlobal

****************************************************************************

Lev3Platt120:	SETDATA		Level3Bob124,WonderVars+BobBase
		SETMOVE		1$
		GOTO		PlattGlobal

1$:		LEFT		120
		RIGHT		120
		LOOP

Lev3Platt60:	SETDATA		Level3Bob124,WonderVars+BobBase
		SETMOVE		1$
		GOTO		PlattGlobal

1$:		LEFT		60
		RIGHT		60
		LOOP

****************************************************************************

Lev3Dame:	SETDATA		Level3Bob105,WonderVars+BobBase
		GOTO		BonusDameGlobal

****************************************************************************

Lev3Star1:	SETDATA		Level3Bob53,WonderVars+BobBase
		SETANIM		StarAnim1
		GOTO		StarGlobal

Lev3Star2:	SETDATA		Level3Bob61,WonderVars+BobBase
		SETANIM		StarAnim2
		GOTO		StarGlobal

Lev3Star3:	SETDATA		Level3Bob66,WonderVars+BobBase
		SETANIM		StarAnim3
StarGlobal:	SETMOVE		StarMove
		SETANIMSPEED	2
		SETMOVESTEP	3
		SETHITMASK	RONNY_HITCOLL
		GOTO		Lev3Global

StarAnim1:	ANIMTO		0,8
		LOOP

StarAnim2:	ANIMTO		0,4
		LOOP

StarAnim3:	SETANIMSPEED	3
		ANIMTO		0,3
		LOOP

StarMove:	FOR		20
		 DOWN		3
		 LEFT		1		 
		NEXT
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

****************************************************************************

Lev3LKW:	SETDATA		Level3Bob6,WonderVars+BobBase
		GOTO		TöffGlobal

****************************************************************************

Lev3RedPW:	SETDATA		Level3Bob4,WonderVars+BobBase
		GOTO		TöffGlobal

****************************************************************************

Lev3BluePW:	SETDATA		Level3Bob2,WonderVars+BobBase
		GOTO		TöffGlobal

****************************************************************************

Lev3Töff:	SETDATA		Level3Bob0,WonderVars+BobBase
TöffGlobal:	SETANIM		1$
		SETMOVE		2$
		SETMOVESTEP	2
		SETHITMASK	RONNY_STURZ
		SETUSERDATA	$04000000
		GOTO		Lev3Global

1$:		dc.w		0
		CPUJUMP		Play8SVX,Hupe
		LWAIT		1
		dc.w		1
		CPUJUMP		Play8SVX,Hupe
		LWAIT		1
		LOOP

2$:		LEFT		99
		LSIGNAL		1
		LEFT		1
		RIGHT		99
		LSIGNAL		1
		RIGHT		1
		LOOP

****************************************************************************

Hupe:		SoundFX	sfx_Hupe,3710,690,45
