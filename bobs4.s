************************************************************************************
***  Büro
************************************************************************************

		XDEF	EnemyList4
		XDEF	Level4BobTab
		XDEF	ZeitungGlobal,BlueCarGlobal,AmigaGlobal
		XDEF	GlobalBobbel,ZeitungGlobal2

		XDEF	GlühLGlobal,KugelGlobal,PfeilGlobal
		XDEF	Tropfen3Global,BatManXGlobal,BatManGlobal,MouthGlobal
		XDEF	KeuleGlobal,RöhreGlobal
		XDEF	Lev4Global2,KugelGlobal2,Lev4Global

		XDEF	Lev4RedCar,Lev4BlueCar,Lev4SeifenBlase,Lev4Lampe
		XDEF	Lev4Global,Lev4Kugel3,Lev4Buch,Lev4RotBall,Lev4BlauBall
		XDEF	Lev4Bobbel,Lev4Koffer,Lev4Hamburger,Lev4Wecker
		XDEF	Lev4Flieger,Lev4Kopf,Lev4Röhre,Lev4KissMouth
		XDEF	Lev4Schere,Lev4Tropfen3,Lev4BatMan,Lev4BatManX
		XDEF	Lev4Mouth

		XREF	ShootColl,RonnyColl,EnergyColl,HealthColl

		XREF	FallHandler,CommonRemBob,CommonRemBobTest,WonderVars
		XREF	GetElem,GetInfo,ShopColl

		XREF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XREF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XREF	ImmerShopBob1
		XREF	ImmerCoinBob,Coin,ImmerEmptyBob
		XREF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XREF	ImmerGetJobBob6,ImmerGetJobBob7,ImmerGetJobBob8
		XREF	ImmerBusStop2,ImmerSandUhr

		XREF	ImmerHaus13Bob,ImmerHaus64Bob,Job1Done
		XREF	Play8SVX,Blip

		XREF	Global,LKeuleGlobal,LBiene,FussGänger
		XREF	KopfGlobal,KopfBigGlobal,GlobalPfeil
		XREF	LokGlobal,PlattGlobal
		XREF	DameGlobal,FliegerGlobal,GlobalKiss,BonusDameGlobal
		XREF	SchereGlobal,WeckerGlobal,Tropfen2,Tropfen3
		XREF	GlobalBall,SeifenGlobal,BuchGlobal,SeifeGlobal
		XREF	LKeuleGlobal2,Pfeil

		INCLUDE "myexec.i"
		INCLUDE	"drawbob.i"
		INCLUDE	"sfx.i"
		INCLUDE	"definitions.i"
		INCLUDE	"Gfx/Level4Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"

	STRUCTURE Level4bobStructure,0

		BYTE	Level4Dummy
		BYTE	Level4ShopBob2
		BYTE	Level4CoinBob
		BYTE	Level4CubeBob1
		BYTE	Level4CubeBob2
		BYTE	Level4CubeBob3
		BYTE	Level4CubeBob4
		BYTE	Level4JumpBob
		BYTE	Level4CheeseBob
		BYTE	Level4BombBob
		BYTE	Level4MagnetoBob
		BYTE	Level4HonkBob
		BYTE	Level4BonusBob1
		BYTE	Level4BonusBob3
		BYTE	Level4FrageZeichen
		BYTE	Level4Haus13Bob
		BYTE	Level4Haus64Bob
		BYTE	Level4EmptyBob
		BYTE	Level4GetJobBob
		BYTE	Level4GetJobBob2
		BYTE	Level4GetJobBob3
		BYTE	Level4BusStop
		BYTE	Level4SandUhr

		BYTE	Level4BatMan
		BYTE	Level4Mouth
		BYTE	Level4Keule
		BYTE	Level4Flieger
		BYTE	Level4RedCar
		BYTE	Level4BlueCar
		BYTE	Level4KissMouth
		BYTE	Level4Kopf
		BYTE	Level4Schere
		BYTE	Level4Wecker
		BYTE	Level4Hamburger
		BYTE	Level4Tropfen
		BYTE	Level4RotBall
		BYTE	Level4BlauBall
		BYTE	Level4SeifenBlase
		BYTE	Level4Buch
		BYTE	Level4AmigaBall
		BYTE	Level4Dame
		BYTE	Level4Herr
		BYTE	Level4Koffer
		BYTE	Level4KofferY
		BYTE	Level4Röhre
		BYTE	Level4Tropfen3
		BYTE	Level4Dame1
		BYTE	Level4Herr1
		BYTE	Level4Herr2
		BYTE	Level4BatManX
		BYTE	Level4PfeilBob
		BYTE	Level4Zeitung
		BYTE	Level4SeifenBlaseY
		BYTE	Level4Kugel3
		BYTE	Level4Bobbel
		BYTE	Level4AmigaHupf
		BYTE	Level4Lampe


Level4BobTab:	dc.l	0			* Dummy
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
		dc.l	ImmerGetJobBob6
		dc.l	ImmerGetJobBob7
		dc.l	ImmerGetJobBob8
 		dc.l	ImmerBusStop2
 		dc.l	ImmerSandUhr

		dc.l	Lev4BatMan
		dc.l	Lev4Mouth
		dc.l	Lev4Keule
		dc.l	Lev4Flieger
		dc.l	Lev4RedCar
		dc.l	Lev4BlueCar
		dc.l	Lev4KissMouth
		dc.l	Lev4Kopf
		dc.l	Lev4Schere
		dc.l	Lev4Wecker
		dc.l	Lev4Hamburger
		dc.l	Lev4Tropfen
		dc.l	Lev4RotBall
		dc.l	Lev4BlauBall
		dc.l	Lev4SeifenBlase
		dc.l	Lev4Buch
		dc.l	Lev4AmigaBall
		dc.l	Lev4Dame
		dc.l	Lev4Herr
		dc.l	Lev4Koffer
		dc.l	Lev4KofferY
		dc.l	Lev4Röhre
		dc.l	Lev4Tropfen3
		dc.l	Lev4Dame1
		dc.l	Lev4Herr1
		dc.l	Lev4Herr2
 		dc.l	Lev4BatManX
 		dc.l	Lev4PfeilBob
 		dc.l	Lev4Zeitung
 		dc.l	Lev4SeifenBlaseY
 		dc.l	Lev4Kugel3
 		dc.l	Lev4Bobbel
 		dc.l	Lev4AmigaHupf
 		dc.l	Lev4Lampe


		SECTION	MyData,DATA

		SETBOB	-30000,0,0,0,0
EnemyList4:
;		SETBOB	-190,175,0,Level4Wecker,Level4Wecker

		SETBOB	1,65,0,Level4CubeBob1,Level4CubeBob1
		SETBOB	4,90,0,Level4CoinBob,Level4CoinBob
		SETBOB	31,137,0,Level4CoinBob,Level4CoinBob
		SETBOB	32,61,0,Level4Tropfen3,Level4Tropfen3

		SETBOB	130,171,0,Level4Zeitung,Level4Zeitung
		SETBOB	160,148,0,Level4Zeitung,Level4Zeitung
		SETBOB	175,119,0,Level4Zeitung,Level4Zeitung
		SETBOB	184,100,0,Level4CoinBob,Level4CoinBob
		SETBOB	190,158,0,Level4Zeitung,Level4Zeitung

		SETBOB	335,37,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	397,79,$FD00,Level4BlauBall,Level4BlauBall

		SETBOB	415,67,0,Level4CheeseBob,Level4CheeseBob
		SETBOB	430,126,0,Level4GetJobBob,Level4GetJobBob
		SETBOB	430,79,0,Level4BlueCar,Level4BlueCar
		SETBOB	448,175,0,Level4Herr,Level4Herr
		SETBOB	482,175,0,Level4KissMouth,Level4KissMouth

		SETBOB	660,180,0,Level4PfeilBob,Level4PfeilBob
		SETBOB	673,69,0,Level4Mouth,Level4Mouth
		SETBOB	676,94,0,Level4CubeBob2,Level4CubeBob2
		SETBOB	685,72,0,Level4CoinBob,Level4CoinBob
		SETBOB	697,24,0,Level4CubeBob3,Level4CubeBob3

		SETBOB	700,174,0,Level4BatManX,Level4BatManX
		SETBOB	720,165,0,Level4PfeilBob,Level4PfeilBob
		SETBOB	770,140,0,Level4PfeilBob,Level4PfeilBob
		SETBOB	775,135,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	779,135,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	820,180,0,Level4PfeilBob,Level4PfeilBob
		SETBOB	875,155,0,Level4PfeilBob,Level4PfeilBob
		SETBOB	856,66,0,Level4CubeBob4,Level4CubeBob4
		SETBOB	888,25,0,Level4CoinBob,Level4CoinBob

		SETBOB	944,169,0,Level4MagnetoBob,Level4MagnetoBob
		SETBOB	953,25,0,Level4CoinBob,Level4CoinBob

		SETBOB	1000,175,0,Level4AmigaBall,Level4AmigaBall
		SETBOB	1021,114,0,Level4CoinBob,Level4CoinBob

		SETBOB	1128,31,0,Level4CoinBob,Level4CoinBob
		SETBOB	1129,175,0,Level4SeifenBlaseY,Level4SeifenBlaseY
		SETBOB	1174,122,0,Level4CoinBob,Level4CoinBob

		SETBOB	1222,168,0,Level4CoinBob,Level4CoinBob
		SETBOB	1255,25,0,Level4CubeBob1,Level4CubeBob1
		SETBOB	1272,151,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	1320,87,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	1342,55,0,Level4CoinBob,Level4CoinBob

		SETBOB	1432,61,0,Level4CoinBob,Level4CoinBob
		SETBOB	1448,21,0,Level4CubeBob2,Level4CubeBob2
		SETBOB	1471,161,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	1472,83,0,Level4JumpBob,Level4JumpBob

		SETBOB	1500,44,$FD00,Level4RotBall,Level4RotBall
		SETBOB	1500,76,0,Level4Buch,Level4Buch
		SETBOB	1530,63,$FD00,Level4RotBall,Level4RotBall

		SETBOB	1532,76,0,Level4Buch,Level4Buch
		SETBOB	1542,44,0,Level4CubeBob3,Level4CubeBob3
		SETBOB	1560,31,$FD00,Level4RotBall,Level4RotBall
		SETBOB	1564,76,0,Level4Buch,Level4Buch

		SETBOB	1621,81,0,Level4CoinBob,Level4CoinBob
		SETBOB	1649,63,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	1735,111,0,Level4RedCar,Level4RedCar
		SETBOB	1752,54,0,Level4Kugel3,Level4Kugel3
		SETBOB	1765,20,0,Level4CubeBob4,Level4CubeBob4
		SETBOB	1783,37,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	1784,113,0,Level4CoinBob,Level4CoinBob

		SETBOB	1877,78,0,Level4CoinBob,Level4CoinBob

		SETBOB	1942,85,0,Level4CubeBob2,Level4CubeBob2
		SETBOB	1985,175,0,Level4Schere,Level4Schere
		SETBOB	1995,113,0,Level4Flieger,Level4Flieger

		SETBOB	2030,42,0,Level4CubeBob1,Level4CubeBob1
		SETBOB	2040,98,0,Level4Flieger,Level4Flieger
		SETBOB	2053,175,0,Level4Schere,Level4Schere
		SETBOB	2060,120,0,Level4Flieger,Level4Flieger
		SETBOB	2080,175,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	2112,175,0,Level4CoinBob,Level4CoinBob
		SETBOB	2124,23,0,Level4CoinBob,Level4CoinBob
		SETBOB	2137,159,0,Level4Schere,Level4Schere
		SETBOB	2145,159,0,Level4Bobbel,Level4Bobbel
		SETBOB	2146,175,0,Level4CoinBob,Level4CoinBob

		SETBOB	2254,175,0,Level4Hamburger,Level4Hamburger

		SETBOB	2300,103,0,Level4CoinBob,Level4CoinBob

		SETBOB	2408,159,0,Level4Koffer,Level4Koffer
		SETBOB	2424,156,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	2454,40,0,Level4BombBob,Level4BombBob
		SETBOB	2464,159,0,Level4Koffer,Level4Koffer

		SETBOB	2571,154,0,Level4BonusBob3,Level4BonusBob3
		SETBOB	2576,165,0,Level4CoinBob,Level4CoinBob

		SETBOB	2640,111,0,Level4Mouth,Level4Mouth
		SETBOB	2644,111,$FD00,Level4BlauBall,Level4BlauBall
		SETBOB	2660,111,0,Level4RedCar,Level4RedCar
		SETBOB	2663,102,0,Level4CubeBob3,Level4CubeBob3

		SETBOB	2730,173,0,Level4CoinBob,Level4CoinBob
		SETBOB	2741,143,0,Level4CoinBob,Level4CoinBob

		SETBOB	2751,172,0,Level4Röhre,Level4Röhre
		SETBOB	2773,58,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	2773,88,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	2791,19,0,Level4JumpBob,Level4JumpBob
		SETBOB	2798,15,0,Level4CubeBob4,Level4CubeBob4

		SETBOB	2854,116,0,Level4Buch,Level4Buch
		SETBOB	2854,83,0,Level4Buch,Level4Buch
		SETBOB	2854,50,0,Level4Buch,Level4Buch

		SETBOB	3006,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	3038,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	3070,126,0,Level4GetJobBob2,Level4GetJobBob2
		SETBOB	3070,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	3088,175,0,Level4Dame,Level4Dame

		SETBOB	3100,78,0,Level4CoinBob,Level4CoinBob
		SETBOB	3102,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	3132,38,0,Level4CubeBob1,Level4CubeBob1

		SETBOB	3234,172,0,Level4CoinBob,Level4CoinBob
		SETBOB	3229,152,0,Level4CubeBob2,Level4CubeBob2

		SETBOB	3321,23,0,Level4CoinBob,Level4CoinBob
		SETBOB	3343,95,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	3380,25,0,Level4HonkBob,Level4HonkBob

		SETBOB	3416,78,0,Level4Kugel3,Level4Kugel3
		SETBOB	3432,60,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	3471,120,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	3513,95,0,Level4Lampe,Level4Lampe

		SETBOB	3617,89,0,Level4CoinBob,Level4CoinBob
		SETBOB	3624,115,0,Level4CoinBob,Level4CoinBob
		SETBOB	3625,31,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	3707,117,0,Level4CoinBob,Level4CoinBob

		SETBOB	3801,118,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	3804,24,0,Level4CubeBob3,Level4CubeBob3
		SETBOB	3822,89,0,Level4SeifenBlase,Level4SeifenBlase
		SETBOB	3850,84,0,Level4SeifenBlase,Level4SeifenBlase
		SETBOB	3860,175,0,Level4Dame1,Level4Dame1
		SETBOB	3884,118,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	3887,158,0,Level4BatMan,Level4BatMan

		SETBOB	3919,127,0,Level4BatMan,Level4BatMan

		SETBOB	4000,13,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4030,13,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4060,13,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4090,13,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4120,13,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4150,13,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4171,25,0,Level4CubeBob4,Level4CubeBob4
		SETBOB	4180,13,0,Level4Tropfen3,Level4Tropfen3

		SETBOB	4207,91,0,Level4BonusBob1,Level4BonusBob1
		SETBOB	4210,13,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4219,28,0,Level4BombBob,Level4BombBob
		SETBOB	4232,127,$FD00,Level4RotBall,Level4RotBall
		SETBOB	4287,83,0,Level4JumpBob,Level4JumpBob
	
		SETBOB	4300,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4330,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4360,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4390,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4420,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4450,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4480,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4510,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4540,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4570,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4600,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4630,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4660,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4690,45,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	4720,45,0,Level4Tropfen3,Level4Tropfen3

		SETBOB	4702,89,0,Level4FrageZeichen,Level4FrageZeichen
		SETBOB	4751,28,0,Level4CoinBob,Level4CoinBob

		SETBOB	4810,92,0,Level4CubeBob1,Level4CubeBob1

		SETBOB	5017,45,0,Level4JumpBob,Level4JumpBob

		SETBOB	5261,88,0,Level4CoinBob,Level4CoinBob

		SETBOB	5344,63,0,Level4CubeBob2,Level4CubeBob2
		SETBOB	5345,63,$FD00,Level4RotBall,Level4RotBall

		SETBOB	5415,170,0,Level4CoinBob,Level4CoinBob

		SETBOB	5540,15,$FD00,Level4RotBall,Level4RotBall
		SETBOB	5584,12,0,Level4CubeBob3,Level4CubeBob3
		SETBOB	5585,15,$FD00,Level4RotBall,Level4RotBall

		SETBOB	5638,175,0,Level4Bobbel,Level4Bobbel
		SETBOB	5645,42,0,Level4CubeBob4,Level4CubeBob4

		SETBOB	5720,175,0,Level4KissMouth,Level4KissMouth
		SETBOB	5736,79,0,Level4Herr2,Level4Herr2
		SETBOB	5767,24,0,Level4CoinBob,Level4CoinBob

		SETBOB	5800,175,0,Level4KissMouth,Level4KissMouth
		SETBOB	5880,160,0,Level4CoinBob,Level4CoinBob
		SETBOB	5896,175,0,Level4KissMouth,Level4KissMouth

		SETBOB	5900,157,0,Level4PfeilBob,Level4PfeilBob
		SETBOB	5975,157,0,Level4PfeilBob,Level4PfeilBob

		SETBOB	6012,31,0,Level4FrageZeichen,Level4FrageZeichen
		SETBOB	6014,15,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	6072,157,0,Level4PfeilBob,Level4PfeilBob

		SETBOB	6122,104,0,Level4CoinBob,Level4CoinBob
		SETBOB	6159,119,0,Level4CheeseBob,Level4CheeseBob
		SETBOB	6168,18,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	6224,175,0,Level4Wecker,Level4Wecker
		SETBOB	6241,121,0,Level4MagnetoBob,Level4MagnetoBob
		SETBOB	6242,79,0,Level4Herr1,Level4Herr1

		SETBOB	6400,15,$FD00,Level4AmigaHupf,Level4AmigaHupf
		SETBOB	6407,169,0,Level4CubeBob1,Level4CubeBob1
		SETBOB	6445,15,$FD00,Level4AmigaHupf,Level4AmigaHupf

		SETBOB	6786,164,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	6842,175,0,Level4Lampe,Level4Lampe

		SETBOB	6911,62,0,Level4SandUhr,Level4SandUhr
		SETBOB	6928,14,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	6967,76,0,Level4Mouth,Level4Mouth

		SETBOB	7047,30,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	7166,53,0,Level4CubeBob2,Level4CubeBob2
		SETBOB	7176,136,0,Level4KofferY,Level4KofferY

		SETBOB	7216,124,0,Level4Koffer,Level4Koffer
		SETBOB	7237,159,0,Level4KofferY,Level4KofferY
		SETBOB	7281,175,0,Level4Koffer,Level4Koffer

		SETBOB	7342,19,0,Level4JumpBob,Level4JumpBob
		SETBOB	7390,21,0,Level4CoinBob,Level4CoinBob

		SETBOB	7466,171,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	7486,171,0,Level4CoinBob,Level4CoinBob
		SETBOB	7493,102,0,Level4BonusBob3,Level4BonusBob3

		SETBOB	7507,171,0,Level4CoinBob,Level4CoinBob
		SETBOB	7513,63,0,Level4Hamburger,Level4Hamburger
		SETBOB	7556,111,0,Level4BlueCar,Level4BlueCar

		SETBOB	7624,153,0,Level4JumpBob,Level4JumpBob
		SETBOB	7624,112,0,Level4JumpBob,Level4JumpBob

		SETBOB	7890,89,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	7960,175,0,Level4CoinBob,Level4CoinBob
		SETBOB	7967,175,0,Level4Wecker,Level4Wecker

		SETBOB	8069,109,0,Level4CubeBob3,Level4CubeBob3

		SETBOB	8106,157,0,Level4HonkBob,Level4HonkBob

		SETBOB	8145,52,0,Level4CoinBob,Level4CoinBob
		SETBOB	8170,116,0,Level4SeifenBlase,Level4SeifenBlase
		SETBOB	8178,126,0,Level4GetJobBob3,Level4GetJobBob3
		SETBOB	8182,175,0,Level4Dame,Level4Dame
		SETBOB	8191,85,0,Level4SeifenBlase,Level4SeifenBlase

		SETBOB	8245,119,0,Level4Zeitung,Level4Zeitung
		SETBOB	8298,86,0,Level4Röhre,Level4Röhre

		SETBOB	8300,116,0,Level4Buch,Level4Buch
		SETBOB	8317,119,0,Level4Zeitung,Level4Zeitung
		SETBOB	8384,117,0,Level4JumpBob,Level4JumpBob

		SETBOB	8407,56,0,Level4CubeBob4,Level4CubeBob4
		SETBOB	8486,81,0,Level4CoinBob,Level4CoinBob
		SETBOB	8486,56,0,Level4CoinBob,Level4CoinBob

		SETBOB	8521,15,$FD00,Level4RotBall,Level4RotBall
		SETBOB	8527,170,0,Level4CoinBob,Level4CoinBob
		SETBOB	8528,100,0,Level4CoinBob,Level4CoinBob
		SETBOB	8565,15,$FD00,Level4RotBall,Level4RotBall
		SETBOB	8595,127,$FD00,Level4BlauBall,Level4BlauBall

		SETBOB	8632,68,0,Level4BonusBob1,Level4BonusBob1
		SETBOB	8632,79,$FD00,Level4BlauBall,Level4BlauBall
		SETBOB	8633,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	8663,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	8682,159,0,Level4CoinBob,Level4CoinBob
		SETBOB	8693,29,0,Level4Tropfen3,Level4Tropfen3

		SETBOB	8723,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	8753,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	8783,29,0,Level4Tropfen3,Level4Tropfen3

		SETBOB	8813,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	8843,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	8873,29,0,Level4Tropfen3,Level4Tropfen3

		SETBOB	8903,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	8933,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	8963,29,0,Level4Tropfen3,Level4Tropfen3
		SETBOB	8974,175,0,Level4Lampe,Level4Lampe
		SETBOB	8995,110,0,Level4JumpBob,Level4JumpBob

		SETBOB	9072,175,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	9100,175,0,Level4EmptyBob,Level4EmptyBob
		SETBOB	9106,116,0,Level4FrageZeichen,Level4FrageZeichen
		SETBOB	9112,26,0,Level4CubeBob4,Level4CubeBob4
		SETBOB	9126,70,0,Level4CoinBob,Level4CoinBob
		SETBOB	9130,175,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	9313,84,0,Level4Keule,Level4Keule
		SETBOB	9316,110,0,Level4Keule,Level4Keule
		SETBOB	9319,135,0,Level4Keule,Level4Keule
		SETBOB	9322,165,0,Level4Keule,Level4Keule

		SETBOB	9414,170,0,Level4BatMan,Level4BatMan
		SETBOB	9444,170,0,Level4BatMan,Level4BatMan
		SETBOB	9474,170,0,Level4BatMan,Level4BatMan

		SETBOB	9504,170,0,Level4BatMan,Level4BatMan
		SETBOB	9534,170,0,Level4BatMan,Level4BatMan
		SETBOB	9553,128,0,Level4EmptyBob,Level4EmptyBob

		SETBOB	9760,130,0,Level4BusStop,Level4BusStop

		SETBOB	30000,0,0,0,0

****************************************************************************

Lev4Lampe:	SETDATA		Level4Bob89,WonderVars+BobBase
		SETANIM		1$
		SETANIMSPEED	4
		SETMOVE		2$
		SETMOVESTEP	22
		SETUSERDATA	$0F000000			* 4 hits
		GOTO		Lev4Global

1$:		FOR		3
		 ANIMTO		0,11
		 ADDRELBOB	Lev4GlühL,-42,-19
		 LSIGNAL	1
		NEXT		
		ANIMTO		0,11

		FOR		3
		 ANIMTO		12,23
		 ADDRELBOB	Lev4GlühR,18,-22
		 LSIGNAL	1
		NEXT
		ANIMTO		12,23
		LOOP

2$:		FOR		3
		 LWAIT		1
		 LEFT		1
		NEXT
		FOR		3
		 LWAIT		1
		 RIGHT		1
		NEXT
		LOOP

****************************************************************************

Lev4GlühL:	SETDATA		Level4Bob126,WonderVars+BobBase  *links
GlühLGlobal:	SETMOVE		GlühMoveL
GlühGlobal:	SETHITMASK	RONNY_HITCOLL
		SETUSERFLAGS	BOBF_ENEMY
		SETPRI		-16
		ENDE

Lev4GlühR:	SETDATA		Level4Bob125,WonderVars+BobBase  *links
		SETMOVE		GlühMoveR
		GOTO		GlühGlobal

GlühMoveL:	CPUJUMP		1$,0
		SETUSERFLAGS	BOBF_ENEMY|BOBF_REMOVE
		FOREVER
		 CPUJUMP	Coin,1
		 DELAY		1
		NEXT

1$:		move.b		#-2,bob_UserData+ud_FallingDist(a0)
		move.b		#-5,bob_UserData+ud_XMove(A0)
		rts

GlühMoveR:	CPUJUMP		1$,0
		SETUSERFLAGS	BOBF_ENEMY|BOBF_REMOVE
		FOREVER
		 CPUJUMP	Coin,1
		 DELAY		1
		NEXT

1$:		move.b		#-2,bob_UserData+ud_FallingDist(a0)
		move.b		#5,bob_UserData+ud_XMove(A0)
		rts

****************************************************************************

Lev4Bobbel:	SETDATA		Level4Bob186,WonderVars+BobBase
GlobalBobbel:	SETANIM		1$
		SETANIMSPEED	3
		SETMOVE		2$
		SETMOVESTEP	2
		SETUSERDATA	$05000000			* 4 hits
		GOTO		Lev4Global

1$:		ANIMTO		0,5
		ANIMTO		4,1
		LOOP

2$:		LEFT		35
		RIGHT		35
		LOOP

****************************************************************************

Lev4Kugel3:	SETDATA		Level4Bob73,WonderVars+BobBase
KugelGlobal:	SETANIM		KugelAnim
KugelGlobal2:	SETMOVE		KugelMove
		SETANIMSPEED	1
		SETUSERDATA	$07000000			* 4 hits
		GOTO		Lev4Global

KugelAnim:	ANIMTO		0,15
		LOOP

KugelMove:	LEFT		55
		RIGHT		55
		LOOP

****************************************************************************

Lev4Zeitung:	SETDATA		Level4Bob38,WonderVars+BobBase
ZeitungGlobal:	SETANIM		ZeitungAnim
		SETMOVE		ZeitungMove
ZeitungGlobal2:	SETANIMSPEED	3
		SETUSERDATA	$03000000			* 4 hits
		GOTO		Lev4Global

ZeitungAnim:	ANIMTO		0,7
		LOOP

ZeitungMove:	LEFT		360
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

****************************************************************************

Lev4PfeilBob:	SETDATA		Level4Bob210,WonderVars+BobBase
PfeilGlobal:	SETMOVE		1$
		SETUSERDATA	$02000000			* 4 hits
		GOTO		GlobalPfeil

1$:		LEFT		360
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE		

********************************************************************************

Lev4Tropfen3:	SETDATA		EmptyBob,WonderVars+ImmerBobBase
Tropfen3Global:	SETMOVE		1$
		SETUSERFLAGS	BOBF_REMOVE
		ENDE

1$:		RNDDELAY	1,5
		ADDRELBOB	2$,0,0
		RNDDELAY	60,100
		LOOP

2$:		SETDATA		Level4Bob4,WonderVars+BobBase
		GOTO		Tropfen3
		
********************************************************************************

Lev4BatManX:	SETDATA		Level4Bob139,WonderVars+BobBase
BatManXGlobal:	SETMOVE		1$
		GOTO		BatGlobal

1$:		LEFT		70
		RIGHT		70
		LOOP


Lev4BatMan:	SETDATA		Level4Bob139,WonderVars+BobBase
BatManGlobal:	SETMOVE		BatMove
BatGlobal:	SETANIM		BatAnim
		SETANIMSPEED	2
		SETUSERDATA	$03000000			* 4 hits

Lev4Global:	SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETHITMASK	RONNY_HITCOLL
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		ENDE

BatAnim:	ANIMTO		0,7
		LOOP

BatMove:	UP		64
		DOWN		64
		LOOP

********************************************************************************

Lev4Mouth:	SETDATA		Level4Bob147,WonderVars+BobBase
MouthGlobal:	SETANIM		1$
		SETMOVE		2$
		GOTO		Lev4Global

1$:		ANIMTO		0,10
		LOOP

2$:		UP		25
		DOWN		25
		LOOP

********************************************************************************

Lev4Keule:	SETDATA		Level4Bob158,WonderVars+BobBase
KeuleGlobal:	SETUSERDATA	$02000000
		GOTO		LKeuleGlobal

********************************************************************************

Lev4Flieger:	SETDATA		Level4Bob166,WonderVars+BobBase
		GOTO		FliegerGlobal

********************************************************************************

Lev4Röhre:	SETDATA		Level4Bob59,WonderVars+BobBase
RöhreGlobal:	SETANIM		1$
		SETMOVE		2$
		GOTO		LKeuleGlobal2

1$:		ANIMTO		0,13
		LOOP

2$:		LEFT		20
		RIGHT		20
		LOOP

********************************************************************************

Lev4KissMouth:	SETDATA		Level4Bob183,WonderVars+BobBase
		GOTO		GlobalKiss

********************************************************************************

Lev4Kopf:	SETDATA		Level4Bob192,WonderVars+BobBase
		GOTO		KopfGlobal

********************************************************************************

Lev4Schere:	SETDATA		Level4Bob2,WonderVars+BobBase
		GOTO		SchereGlobal

********************************************************************************

Lev4Wecker:	SETDATA		Level4Bob1,WonderVars+BobBase
		GOTO		WeckerGlobal

********************************************************************************

Lev4Hamburger:	SETDATA		Level4Bob0,WonderVars+BobBase
HamburgerGlobal:
Lev4Global2:	SETMOVE		1$
		GOTO		Lev4Global

1$:		LEFT		60
		RIGHT		60
		LOOP

********************************************************************************

Lev4Koffer:	SETDATA		Level4Bob37,WonderVars+BobBase
		GOTO		Lev4Global2

Lev4KofferY:	SETDATA		Level4Bob37,WonderVars+BobBase
		SETMOVE		1$
		GOTO		Lev4Global

1$:		UP		40
		DOWN		40
		LOOP

********************************************************************************

Lev4Tropfen:	SETDATA		Level4Bob4,WonderVars+BobBase
		GOTO		Tropfen2

********************************************************************************

Lev4RotBall:	SETDATA		Level4Bob33,WonderVars+BobBase
		GOTO		GlobalBall

********************************************************************************

Lev4BlauBall:	SETDATA		Level4Bob46,WonderVars+BobBase
		GOTO		GlobalBall

********************************************************************************

Lev4SeifenBlase:
		SETDATA		Level4Bob50,WonderVars+BobBase
		GOTO		SeifenGlobal

Lev4SeifenBlaseY:
		SETDATA		Level4Bob50,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		2$
		GOTO		SeifeGlobal
	
1$:		ANIMTO		0,2
		LOOP

2$:		UP		25
		DOWN		25
		LOOP

********************************************************************************

Lev4Buch:	SETDATA		Level4Bob127,WonderVars+BobBase
		GOTO		BuchGlobal

********************************************************************************

Lev4AmigaHupf:	SETDATA		Level4Bob135,WonderVars+BobBase
		GOTO		GlobalBall

********************************************************************************

Lev4AmigaBall:	SETDATA		Level4Bob135,WonderVars+BobBase
		SETMOVE		AmigaMove
AmigaGlobal:	SETANIM		AmigaAnim
		SETANIMSPEED	2
		SETUSERDATA	$05000000
		GOTO		Lev4Global

AmigaAnim:	ANIMTO		0,3
		LOOP

AmigaMove:	LEFT		150
		RIGHT		150
		LOOP

********************************************************************************

Lev4Dame:	SETDATA		Level4Bob7,WonderVars+BobBase
		GOTO		BonusDameGlobal

****************************************************************************

Lev4Dame1:	SETDATA		Level4Bob7,WonderVars+BobBase
		SETID		LADY1_ID
		GOTO		GlobalJob

****************************************************************************

Lev4Herr:	SETDATA		Level4Bob19,WonderVars+BobBase
		GOTO		BonusDameGlobal

****************************************************************************

Lev4Herr1:	SETDATA		Level4Bob19,WonderVars+BobBase
		SETID		HERR1_ID
GlobalJob:	SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		GOTO		DameGlobal

****************************************************************************

Lev4Herr2:	SETDATA		Level4Bob19,WonderVars+BobBase
		SETID		HERR2_ID
		GOTO		GlobalJob

****************************************************************************

Lev4RedCar:	SETDATA		Level4Bob176,WonderVars+BobBase
BRedCarGlobal:	SETANIM		AutoAnim120
		SETMOVE		AutoMove120
AutoBob:	SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		ENDE

AutoAnim120:	FOR		15
		 dc.w		2,3
		NEXT
		FOR		15
		 dc.w		0,1
		NEXT
		LOOP

AutoMove120:	LEFT		60
		RIGHT		60
		LOOP


Lev4BlueCar:	SETDATA		Level4Bob172,WonderVars+BobBase
BlueCarGlobal:	SETANIM		AutoAnim32
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
