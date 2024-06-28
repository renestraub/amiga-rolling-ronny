************************************************************************************
***  Park II
************************************************************************************

		XDEF	EnemyList9,Level9BobTab

		XREF	BulleGlobal2,GeistGlobal,GeistGlobal50,AffeGlobal
		XREF	BallonGlobal,GlobalLFlieger

		XREF	GlobalBobbel
		XREF	ZeitungGlobal2,BlueCarGlobal,AmigaGlobal
		XREF	ShootColl,RonnyColl,EnergyColl,HealthColl
		XREF	Lev4Global2,KugelGlobal2,GlobalClown,Lev4Global
		XREF	Lev2Apfel,Lev2Blatt,Lev2WeissBall
		XREF	Lev2LBieneSlow,Lev2LBieneFast,Lev2RedCar
		XREF	Lev2Kugel,Lev2SkateBoarder,Lev2RotBall
		XREF	Lev2Hund,Lev2BlauKopf
		XREF	Lev2Einrad,Lev2EinradL,Lev2KackVogel,Lev2Wasser
		XREF	Lev2Hydrant,Lev2Flieger,Lev2HüpfClown
		XREF	Lev2Kessel,Lev2Schere,Lev2DameBonus,Lev2HerrLRBonus

		XREF	FallHandler,CommonRemBobTest,CommonRemBob,WonderVars
		XREF	GetElem,GetInfo,ShopColl

		XREF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XREF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XREF	ImmerShopBob1
		XREF	ImmerCoinBob,Coin,ImmerEmptyBob
		XREF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XREF	ImmerGetJobBob19,ImmerGetJobBob20,ImmerGetJobBob8
		XREF	ImmerBusStop1,ImmerExit,ImmerSandUhr

		XREF	ImmerHaus13Bob,ImmerHaus64Bob,Job1Done
		XREF	Play8SVX,Blip

		XREF	Global,LKeuleGlobal,FussGänger
		XREF	KopfGlobal,KopfBigGlobal
		XREF	LokGlobal,PlattGlobal,GlobalSkate
		XREF	DameGlobal,FliegerGlobal,GlobalKiss
		XREF	SchereGlobal,WeckerGlobal,Tropfen2,Tropfen3
		XREF	GlobalBall,SeifenGlobal,BuchGlobal,SeifeGlobal
		XREF	LKeuleGlobal2,SchereGlobal2
		XREF	BonusDameGlobal,Lev2HerrLR

		XREF	LampeGlobal,GlühLGlobal,KugelGlobal3
		XREF	Tropfen3Global
		XREF	KeuleGlobal,HamburgerGlobal,RöhreGlobal

		XREF	GlobalLEinrad,HutGlobal,GlobalSeife,ZeitungGlobal
		XREF	GlobalWasser,GlobalAtom,KatzeGlobal
		XREF	BlueCarGlobal


		INCLUDE "myexec.i"
		INCLUDE	"drawbob.i"
		INCLUDE	"sfx.i"
		INCLUDE	"definitions.i"
		INCLUDE	"Gfx/Level2Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"


Level9BobTab:	dc.l	0			* Dummy
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
		dc.l	ImmerGetJobBob19
		dc.l	ImmerGetJobBob20
		dc.l	ImmerGetJobBob8
 		dc.l	ImmerBusStop1
 		dc.l	ImmerSandUhr

		dc.l	Lev2KackVogel
		dc.l	Lev2Blatt
		dc.l	Lev2WeissBall
		dc.l	Lev2Kugel
		dc.l	Lev9Plattform
		dc.l	Lev9PlattformX
		dc.l	Lev2RedCar
		dc.l	Lev9SeifenBlase
		dc.l	Lev9SeifenBlaseX
		dc.l	Lev2SkateBoarder
		dc.l	Lev2Hydrant
		dc.l	Lev2Wasser
		dc.l	Lev9AtomX
		dc.l	Lev9AtomY
		dc.l	Lev9Tropfen3
		dc.l	Lev2Apfel
		dc.l	Lev2LBieneSlow
		dc.l	Lev2LBieneFast
		dc.l	Lev2Einrad
		dc.l	Lev2EinradL
		dc.l	Lev2RotBall
		dc.l	Lev2Hund
		dc.l	Lev2BlauKopf
		dc.l	Lev2Flieger
		dc.l	Lev2HüpfClown
		dc.l	Lev2Kessel
		dc.l	Lev2Schere
		dc.l	Lev2HerrLR
		dc.l	Lev2HerrLRBonus
		dc.l	Lev2DameBonus
		dc.l	Lev9Dame1

	STRUCTURE Level9BobStructure,0

		BYTE	Level9Dummy
		BYTE	Level9ShopBob
		BYTE	Level9CoinBob
		BYTE	Level9CubeBob1
		BYTE	Level9CubeBob2
		BYTE	Level9CubeBob3
		BYTE	Level9CubeBob4
		BYTE	Level9JumpBob
		BYTE	Level9CheeseBob
		BYTE	Level9BombBob
		BYTE	Level9MagnetoBob
		BYTE	Level9HonkBob
		BYTE	Level9BonusBob1
		BYTE	Level9BonusBob3
		BYTE	Level9FrageZeichen
		BYTE	Level9Haus13Bob
		BYTE	Level9Haus64Bob
		BYTE	Level9EmptyBob
		BYTE	Level9GetJobBob
		BYTE	Level9GetJobBob2
		BYTE	Level9GetJobBob3
		BYTE	Level9BusStop
		BYTE	Level9SandUhr

		BYTE	Level9KackVogel
		BYTE	Level9Blatt
		BYTE	Level9WeissBall
		BYTE	Level9Kugel
		BYTE	Level9Plattform
		BYTE	Level9PlattformX
		BYTE	Level9RedCar
		BYTE	Level9SeifenBlase
		BYTE	Level9SeifenBlaseX
		BYTE	Level9Skateboard
		BYTE	Level9Hydrant
		BYTE	Level9Wasser
		BYTE	Level9AtomX
		BYTE	Level9AtomY
		BYTE	Level9Tropfen3
		BYTE	Level9Apfel
		BYTE	Level9BieneSlow
		BYTE	Level9BieneFast
		BYTE	Level9Einrad
		BYTE	Level9EinradL
		BYTE	Level9RotBall
		BYTE	Level9Hund
		BYTE	Level9BlauKopf
		BYTE	Level9Flieger
		BYTE	Level9HüpfClown
		BYTE	Level9Kessel
		BYTE	Level9Schere
		BYTE	Level9Herr
		BYTE	Level9Herr2
		BYTE	Level9Dame
		BYTE	Level9Dame2

		SECTION	MyData,DATA

		SETBOB	-30000,0,0,0,0
EnemyList9:
		SETBOB	-47,67,0,Level9Blatt,Level9Blatt
		SETBOB	-77,46,0,Level9Blatt,Level9Blatt

		SETBOB	17,126,0,Level9GetJobBob,Level9GetJobBob
		SETBOB	35,175,0,Level9Herr,Level9Herr
		
		SETBOB	38,52,0,Level9CubeBob1,Level9CubeBob1
		SETBOB	66,119,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	71,134,0,Level9SeifenBlase,Level9SeifenBlase
		SETBOB	73,153,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	96,119,0,Level9EmptyBob,Level9EmptyBob

		SETBOB	146,119,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	156,94,0,Level9FrageZeichen,Level9FrageZeichen
		SETBOB	174,171,0,Level9Kugel,Level9Kugel

		SETBOB	207,111,0,Level9RedCar,Level9RedCar
		SETBOB	251,119,0,Level9EmptyBob,Level9EmptyBob

		SETBOB	308,171,0,Level9Plattform,Level9Plattform
		SETBOB	321,109,0,Level9CoinBob,Level9CoinBob
		SETBOB	340,171,0,Level9Plattform,Level9Plattform
		SETBOB	365,121,0,Level9JumpBob,Level9JumpBob
		SETBOB	384,70,0,Level9CoinBob,Level9CoinBob

		SETBOB	425,153,0,Level9JumpBob,Level9JumpBob
		SETBOB	478,91,0,Level9CoinBob,Level9CoinBob

		SETBOB	504,83,0,Level9CubeBob2,Level9CubeBob2
		SETBOB	514,175,0,Level9Hydrant,Level9Hydrant
		SETBOB	514,152,0,Level9Wasser,Level9Wasser
		SETBOB	587,131,0,Level9SeifenBlase,Level9SeifenBlase

		SETBOB	622,131,0,Level9SeifenBlase,Level9SeifenBlase
		SETBOB	631,175,0,Level9Skateboard,Level9Skateboard
		SETBOB	664,103,0,Level9CoinBob,Level9CoinBob
		SETBOB	665,159,$FD00,Level9RotBall,Level9RotBall
		SETBOB	652,131,0,Level9SeifenBlase,Level9SeifenBlase
		SETBOB	670,0,0,Level9Tropfen3,Level9Tropfen3

		SETBOB	703,172,0,Level9CubeBob3,Level9CubeBob3
		SETBOB	730,0,0,Level9Tropfen3,Level9Tropfen3
		SETBOB	790,0,0,Level9Tropfen3,Level9Tropfen3

		SETBOB	806,175,0,Level9Hund,Level9Hund
		SETBOB	850,0,0,Level9Tropfen3,Level9Tropfen3
		SETBOB	882,113,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	883,171,0,Level9Schere,Level9Schere

		SETBOB	910,0,0,Level9Tropfen3,Level9Tropfen3
		SETBOB	970,0,0,Level9Tropfen3,Level9Tropfen3
		SETBOB	999,158,0,Level9Schere,Level9Schere

		SETBOB	1002,95,0,Level9CubeBob4,Level9CubeBob4
		SETBOB	1029,161,0,Level9BombBob,Level9BombBob 
		SETBOB	1030,0,0,Level9Tropfen3,Level9Tropfen3
		SETBOB	1090,0,0,Level9Tropfen3,Level9Tropfen3

		SETBOB	1170,169,0,Level9AtomY,Level9AtomY

		SETBOB	1231,140,0,Level9BonusBob3,Level9BonusBob3
		SETBOB	1233,169,0,Level9SeifenBlaseX,Level9SeifenBlaseX
		SETBOB	1240,120,0,Level9CoinBob,Level9CoinBob
		SETBOB	1261,21,0,Level9EmptyBob,Level9EmptyBob

		SETBOB	1300,61,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	1319,63,0,Level9EinradL,Level9EinradL
		SETBOB	1340,61,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	1361,71,0,Level9BlauKopf,Level9BlauKopf

		SETBOB	1421,21,0,Level9CoinBob,Level9CoinBob
		SETBOB	1432,138,0,Level9EmptyBob,Level9EmptyBob

		SETBOB	1500,175,0,Level9HüpfClown,Level9HüpfClown
		SETBOB	1536,23,0,Level9Blatt,Level9Blatt
		SETBOB	1566,16,0,Level9Blatt,Level9Blatt
		SETBOB	1573,96,0,Level9CubeBob1,Level9CubeBob1
		SETBOB	1587,47,0,Level9Blatt,Level9Blatt

		SETBOB	1655,111,$FD00,Level9WeissBall,Level9WeissBall
		SETBOB	1664,51,0,Level9CubeBob2,Level9CubeBob2
		SETBOB	1695,601,0,Level9Schere,Level9Schere
		SETBOB	1697,120,0,Level9CoinBob,Level9CoinBob

		SETBOB	1740,44,0,Level9KackVogel,Level9KackVogel
		SETBOB	1770,134,0,Level9CoinBob,Level9CoinBob

		SETBOB	1809,172,0,Level9CubeBob3,Level9CubeBob3
		SETBOB	1809,73,0,Level9BonusBob1,Level9BonusBob1
		SETBOB	1833,154,0,Level9BieneFast,0
		SETBOB	1837,93,0,Level9EmptyBob,Level9EmptyBob 
		SETBOB	1874,136,0,Level9BieneSlow,0
		SETBOB	1893,105,0,Level9SeifenBlaseX,Level9SeifenBlaseX

		SETBOB	1970,145,0,Level9BieneFast,0
		SETBOB	1983,105,0,Level9SeifenBlaseX,Level9SeifenBlaseX

		SETBOB	2049,58,0,Level9CubeBob4,Level9CubeBob4

		SETBOB	2110,175,0,Level9JumpBob,Level9JumpBob
		SETBOB	2141,175,0,Level9CoinBob,Level9CoinBob
		SETBOB	2160,131,0,Level9BonusBob3,Level9BonusBob3
		SETBOB	2180,154,0,Level9BieneFast,0

		SETBOB	2212,93,0,Level9CoinBob,Level9CoinBob
		SETBOB	2238,135,0,Level9BieneFast,0
		SETBOB	2240,172,0,Level9CubeBob1,Level9CubeBob1

		SETBOB	2316,171,0,Level9Kugel,Level9Kugel

		SETBOB	2404,138,0,Level9SeifenBlase,Level9SeifenBlase
		SETBOB	2457,95,0,Level9CoinBob,Level9CoinBob
		SETBOB	2465,175,0,Level9Herr2,Level9Herr2
		SETBOB	2486,172,0,Level9EmptyBob,Level9EmptyBob

		SETBOB	2500,172,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	2530,172,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	2572,0,$FE00,Level9CoinBob,Level9CoinBob
		SETBOB	2572,0,$FF00,Level9CoinBob,Level9CoinBob
		SETBOB	2572,0,0,Level9CoinBob,Level9CoinBob
		SETBOB	2572,0,$0100,Level9CoinBob,Level9CoinBob
		SETBOB	2572,0,$0200,Level9CoinBob,Level9CoinBob
		SETBOB	2577,175,0,Level9Hund,Level9Hund

		SETBOB	2632,127,0,Level9EinradL,Level9EinradL
		SETBOB	2632,76,0,Level9CubeBob2,Level9CubeBob2
		SETBOB	2633,157,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	2652,175,0,Level9Dame,Level9Dame

		SETBOB	2748,159,0,Level9Wasser,Level9Wasser
		SETBOB	2776,161,0,Level9MagnetoBob,Level9MagnetoBob
		SETBOB	2776,88,0,Level9CoinBob,Level9CoinBob
		SETBOB	2777,143,0,Level9Wasser,Level9Wasser

		SETBOB	2805,159,0,Level9Wasser,Level9Wasser
		SETBOB	2837,95,0,Level9EinradL,Level9EinradL
		SETBOB	2842,36,0,Level9CubeBob3,Level9CubeBob3
		SETBOB	2869,89,0,Level9SeifenBlaseX,Level9SeifenBlaseX

		SETBOB	2970,123,0,Level9CubeBob4,Level9CubeBob4

		SETBOB	3013,50,0,Level9CoinBob,Level9CoinBob
		SETBOB	3032,135,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	3056,62,0,Level9FrageZeichen,Level9FrageZeichen
		SETBOB	3092,126,0,Level9SeifenBlase,Level9SeifenBlase

		SETBOB	3372,94,0,Level9Flieger,Level9Flieger
		SETBOB	3393,120,0,Level9Flieger,Level9Flieger

		SETBOB	3420,85,0,Level9Flieger,Level9Flieger
		SETBOB	3470,100,0,Level9Flieger,Level9Flieger
		SETBOB	3481,9,0,Level9CubeBob1,Level9CubeBob1
		SETBOB	3484,86,0,Level9PlattformX,Level9PlattformX

		SETBOB	3520,41,0,Level9BlauKopf,Level9BlauKopf
		SETBOB	3535,63,0,Level9Flieger,Level9Flieger
		SETBOB	3570,78,0,Level9PlattformX,Level9PlattformX
		SETBOB	3591,99,0,Level9BonusBob1,Level9BonusBob1

		SETBOB	3637,143,0,Level9HüpfClown,Level9HüpfClown
		SETBOB	3678,106,0,Level9CubeBob2,Level9CubeBob2
		SETBOB	3690,95,$FD00,Level9WeissBall,Level9WeissBall

		SETBOB	3745,47,0,Level9Skateboard,Level9Skateboard

		SETBOB	3807,110,0,Level9AtomX,Level9AtomX
		SETBOB	3834,172,0,Level9Schere,Level9Schere
		SETBOB	3835,65,0,Level9SeifenBlase,Level9SeifenBlase
		SETBOB	3852,30,0,Level9FrageZeichen,Level9FrageZeichen
		SETBOB	3866,100,0,Level9CubeBob1,Level9CubeBob1

		SETBOB	3905,45,0,Level9HüpfClown,Level9HüpfClown
		SETBOB	3940,45,0,Level9HüpfClown,Level9HüpfClown
		SETBOB	3960,103,0,Level9CubeBob4,Level9CubeBob4
		SETBOB	3975,45,0,Level9HüpfClown,Level9HüpfClown
		SETBOB	3990,148,0,Level9PlattformX,Level9PlattformX

		SETBOB	4004,10,0,Level9CubeBob3,Level9CubeBob3
		SETBOB	4004,72,0,Level9JumpBob,Level9JumpBob 
		SETBOB	4055,23,0,Level9FrageZeichen,Level9FrageZeichen
		SETBOB	4099,40,0,Level9KackVogel,Level9KackVogel

		SETBOB	4149,40,0,Level9KackVogel,Level9KackVogel

		SETBOB	4232,167,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	4279,111,$FD00,Level9RotBall,Level9RotBall
		SETBOB	4282,167,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	4298,175,0,Level9Einrad,Level9Einrad

		SETBOB	4327,95,$FE00,Level9RotBall,Level9RotBall
		SETBOB	4330,167,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	4360,97,0,Level9CubeBob2,Level9CubeBob2
		SETBOB	4378,175,0,Level9Einrad,Level9Einrad
		SETBOB	4392,167,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	4392,79,$FD00,Level9RotBall,Level9RotBall

		SETBOB	4416,108,0,Level9BieneFast,0
		SETBOB	4455,18,0,Level9CubeBob3,Level9CubeBob3
		SETBOB	4457,167,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	4471,56,0,Level9FrageZeichen,Level9FrageZeichen
		SETBOB	4488,175,0,Level9Einrad,Level9Einrad

		SETBOB	4518,92,0,Level9BieneSlow,0
		SETBOB	4520,72,0,Level9BieneFast,0
		SETBOB	4521,57,0,Level9CoinBob,Level9CoinBob
		SETBOB	4522,167,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	4534,40,0,Level9KackVogel,Level9KackVogel
		SETBOB	4586,54,0,Level9BieneFast,0

		SETBOB	4639,40,0,Level9KackVogel,Level9KackVogel
		SETBOB	4649,175,0,Level9JumpBob,Level9JumpBob
		SETBOB	4699,40,0,Level9KackVogel,Level9KackVogel

		SETBOB	4754,24,0,Level9KackVogel,Level9KackVogel
		SETBOB	4762,175,0,Level9CoinBob,Level9CoinBob
		SETBOB	4795,126,0,Level9GetJobBob2,Level9GetJobBob2

		SETBOB	4805,175,0,Level9Dame2,Level9Dame2
		SETBOB	4800,175,0,Level9CoinBob,Level9CoinBob
		SETBOB	4800,40,0,Level9KackVogel,Level9KackVogel
		SETBOB	4820,144,0,Level9BombBob,Level9BombBob 
		SETBOB	4864,40,0,Level9KackVogel,Level9KackVogel

		SETBOB	4900,133,0,Level9SandUhr,Level9SandUhr
		SETBOB	4900,159,0,Level9Skateboard,Level9Skateboard
		SETBOB	4919,24,0,Level9KackVogel,Level9KackVogel

		SETBOB	5024,56,0,Level9Blatt,Level9Blatt
		SETBOB	5053,74,0,Level9Blatt,Level9Blatt
		SETBOB	5056,172,0,Level9CubeBob4,Level9CubeBob4
		SETBOB	5069,64,0,Level9Blatt,Level9Blatt
		SETBOB	5091,150,0,Level9Wasser,Level9Wasser
		SETBOB	5091,175,0,Level9Hydrant,Level9Hydrant
		SETBOB	5096,102,0,Level9HonkBob,Level9HonkBob

		SETBOB	5130,170,0,Level9SeifenBlase,Level9SeifenBlase

		SETBOB	5271,30,0,Level9CubeBob1,Level9CubeBob1
		SETBOB	5288,157,0,Level9AtomX,Level9AtomX

		SETBOB	5300,83,0,Level9CoinBob,Level9CoinBob
		SETBOB	5319,31,0,Level9AtomX,Level9AtomX
		SETBOB	5365,79,$FD00,Level9WeissBall,Level9WeissBall
		SETBOB	5368,146,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	5369,31,0,Level9RedCar,Level9RedCar
		SETBOB	5381,79,0,Level9Einrad,Level9Einrad
		SETBOB	5397,79,0,Level9Kessel,Level9Kessel

		SETBOB	5400,113,0,Level9CubeBob2,Level9CubeBob2
		SETBOB	5419,25,0,Level9BlauKopf,Level9BlauKopf

		SETBOB	5528,146,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	5530,106,0,Level9CubeBob3,Level9CubeBob3
		SETBOB	5536,60,0,Level9BonusBob1,Level9BonusBob1
		SETBOB	5596,114,0,Level9MagnetoBob,Level9MagnetoBob

		SETBOB	5641,111,0,Level9Kessel,Level9Kessel
		SETBOB	5666,172,0,Level9CubeBob4,Level9CubeBob4

		SETBOB	5704,95,0,Level9Kessel,Level9Kessel
		SETBOB	5742,71,0,Level9CheeseBob,Level9CheeseBob

		SETBOB	5834,79,$FD00,Level9RotBall,Level9RotBall
		SETBOB	5863,111,0,Level9CubeBob2,Level9CubeBob2
		SETBOB	5887,152,0,Level9Wasser,Level9Wasser
		SETBOB	5887,175,0,Level9Hydrant,Level9Hydrant
		SETBOB	5897,131,0,Level9FrageZeichen,Level9FrageZeichen

		SETBOB	5900,95,$FE00,Level9RotBall,Level9RotBall
		SETBOB	5946,20,0,Level9CoinBob,Level9CoinBob
		SETBOB	5987,133,0,Level9PlattformX,Level9PlattformX

		SETBOB	6078,168,0,Level9AtomY,Level9AtomY

		SETBOB	6136,63,0,Level9EinradL,Level9EinradL
		SETBOB	6169,83,0,Level9CoinBob,Level9CoinBob
		SETBOB	6169,34,0,Level9BonusBob3,Level9BonusBob3
		SETBOB	6183,47,$FD00,Level9WeissBall,Level9WeissBall

		SETBOB	6217,160,0,Level9EmptyBob,Level9EmptyBob
		SETBOB	6256,167,0,Level9SeifenBlase,Level9SeifenBlase

		SETBOB	6320,46,0,Level9Apfel,Level9Apfel
		SETBOB	6329,169,0,Level9Kugel,Level9Kugel
		SETBOB	6346,61,0,Level9Apfel,Level9Apfel
		SETBOB	6367,32,0,Level9Apfel,Level9Apfel

		SETBOB	6407,99,0,Level9CoinBob,Level9CoinBob
		SETBOB	6440,92,0,Level9CoinBob,Level9CoinBob
		SETBOB	6473,85,0,Level9CoinBob,Level9CoinBob

		SETBOB	6512,175,0,Level9HüpfClown,Level9HüpfClown

		SETBOB	6632,175,0,Level9BusStop,Level9BusStop

		SETBOB	30000,0,0,0,0

****************************************************************************

Lev9Dame1:	SETDATA		Level2Bob24,WonderVars+BobBase
		GOTO		BonusDameGlobal

Lev9Herr:	SETDATA		Level2Bob150,WonderVars+BobBase
		GOTO		BonusDameGlobal

****************************************************************************

Lev9AtomX:	SETDATA		Level2Bob67,WonderVars+BobBase
		SETMOVE		1$
		GOTO		GlobalAtom

1$:		LEFT		20
		RIGHT		20
		LOOP

Lev9AtomY:	SETDATA		Level2Bob67,WonderVars+BobBase
		SETMOVE		Move30Y
		GOTO		GlobalAtom

Move30Y:	UP		30
		DOWN		30
		LOOP

****************************************************************************

Lev9Tropfen3:	SETDATA		EmptyBob,WonderVars+ImmerBobBase
		SETMOVE		1$
		SETUSERFLAGS	BOBF_REMOVE
		ENDE

1$:		RNDDELAY	1,5
		ADDRELBOB	2$,0,0
		RNDDELAY	60,100
		LOOP

2$:		SETDATA		Level2Bob16,WonderVars+BobBase
		GOTO		Tropfen3

****************************************************************************

Lev9SeifenBlase:
		SETDATA		Level2Bob64,WonderVars+BobBase
		GOTO		GlobalSeife

Lev9SeifenBlaseX:
		SETDATA		Level2Bob64,WonderVars+BobBase
		GOTO		SeifenGlobal

****************************************************************************

Lev9Plattform:	SETDATA		Level2Bob36,WonderVars+BobBase
		SETMOVE		1$
		GOTO		PlattGlobal

1$:		UP		25
		DOWN		25
		LOOP

Lev9PlattformX:	SETDATA		Level2Bob36,WonderVars+BobBase
		SETMOVE		2$
		GOTO		PlattGlobal

2$:		LEFT		50
		RIGHT		50
		LOOP

****************************************************************************
