************************************************************************************
***  Level5
************************************************************************************

		XDEF	EnemyList5
		XDEF	Level5BobTab

		XDEF	BulleGlobal2,AffeGlobal,GeistGlobal,GeistGlobal50
		XDEF	BallonGlobal


		XDEF	Lev5Banane,Lev5Möve,Lev5Keule,Lev5Leuchte
		XDEF	Lev5Fass,Lev5Flasche,Lev5FlascheY,Lev5Büchse
		XDEF	Lev5Flugzeug,Lev5Tropfen,Lev5Tropfen3
		XDEF	Lev5Zeitung,Lev5Auto,Lev5AutoKlein,Lev5Hydrant
		XDEF	Lev5Dame,Lev5SeifenBlase,Lev5Katze,Lev5Atom,Lev5AtomX
		XDEF	Lev5HutKopf,Lev5Kugel,Lev5FarbTopf,Lev5Einrad
		XDEF	Lev5Mond,Lev5SchneeMann,Lev5Ballon,Lev5BallonY
		XDEF	Lev5Geist,Lev5Geist50,Lev5Bulle2
		XDEF	Lev5Wasser,Lev5Affe

		XREF	ShootColl,RonnyColl,EnergyColl,HealthColl

		XREF	FallHandler,CommonRemBob,WonderVars
		XREF	GetElem,GetInfo,ShopColl

		XREF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XREF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XREF	ImmerShopBob1
		XREF	ImmerCoinBob,Coin,ImmerEmptyBob
		XREF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XREF	ImmerGetJobBob12,ImmerGetJobBob13,ImmerGetJobBob8
		XREF	ImmerSandUhr,ImmerBusStop2

		XREF	ImmerHaus13Bob,ImmerHaus64Bob,Job1Done
		XREF	Play8SVX,Blip

		XREF	Global,LKeuleGlobal,LBiene,FussGänger
		XREF	KopfGlobal,KopfBigGlobal
		XREF	LokGlobal,PlattGlobal
		XREF	BonusDameGlobal,GlobalLFlieger,GlobalKiss
		XREF	SchereGlobal,Tropfen2,Tropfen3
		XREF	GlobalBall,SeifenGlobal,BuchGlobal,SeifeGlobal
		XREF	LKeuleGlobal2
		XREF	GlobalLEinrad,HutGlobal,GlobalSeife,ZeitungGlobal
		XREF	GlobalWasser,GlobalAtom,KatzeGlobal
		XREF	RedCarGlobal,BlueCarGlobal
		XREF	MöveGlobal

		INCLUDE "myexec.i"
		INCLUDE	"drawbob.i"
		INCLUDE	"sfx.i"
		INCLUDE	"definitions.i"
		INCLUDE	"Gfx/Level5Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"

	STRUCTURE Level4bobStructure,0

		BYTE	Level5Dummy
		BYTE	Level5ShopBob2
		BYTE	Level5CoinBob
		BYTE	Level5CubeBob1
		BYTE	Level5CubeBob2
		BYTE	Level5CubeBob3
		BYTE	Level5CubeBob4
		BYTE	Level5JumpBob
		BYTE	Level5CheeseBob
		BYTE	Level5BombBob
		BYTE	Level5MagnetoBob
		BYTE	Level5HonkBob
		BYTE	Level5BonusBob1
		BYTE	Level5BonusBob3
		BYTE	Level5FrageZeichen
		BYTE	Level5Haus13Bob
		BYTE	Level5Haus64Bob
		BYTE	Level5EmptyBob
		BYTE	Level5GetJobBob
		BYTE	Level5GetJobBob2
		BYTE	Level5GetJobBob3
		BYTE	Level5SandUhr
		BYTE	Level5BusStop
		
		BYTE	Level5Ballon
		BYTE	Level5BallonY
		BYTE	Level5Mond
		BYTE	Level5SchneeMann
		BYTE	Level5Einrad
		BYTE	Level5FarbTopf
		BYTE	Level5Kugel
		BYTE	Level5HutKopf
		BYTE	Level5Katze
		BYTE	Level5Atom
		BYTE	Level5AtomX
		BYTE	Level5SeifenBlase
		BYTE	Level5Bulle
		BYTE	Level5Bulle1
		BYTE	Level5Bulle2
		BYTE	Level5Hydrant
		BYTE	Level5Zeitung
		BYTE	Level5Dame
		BYTE	Level5Auto
		BYTE	Level5AutoKlein
		BYTE	Level5Tropfen
		BYTE	Level5Tropfen3
		BYTE	Level5Flugzeug
		BYTE	Level5Büchse
		BYTE	Level5Flasche
		BYTE	Level5FlascheY
		BYTE	Level5Fass
		BYTE	Level5FassSub
		BYTE	Level5Leuchte
		BYTE	Level5Banane
		BYTE	Level5Keule
		BYTE	Level5Möve
		BYTE	Level5Wasser
		BYTE	Level5Geist
		BYTE	Level5Geist50
		BYTE	Level5Affe

Level5BobTab:	dc.l	0			* Dummy
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
		dc.l	ImmerGetJobBob12
		dc.l	ImmerGetJobBob13
		dc.l	ImmerGetJobBob8
		dc.l	ImmerSandUhr
		dc.l	ImmerBusStop2

		dc.l	Lev5Ballon
		dc.l	Lev5BallonY
		dc.l	Lev5Mond
		dc.l	Lev5SchneeMann
		dc.l	Lev5Einrad
		dc.l	Lev5FarbTopf
		dc.l	Lev5Kugel
		dc.l	Lev5HutKopf
		dc.l	Lev5Katze
		dc.l	Lev5Atom
		dc.l	Lev5AtomX
		dc.l	Lev5SeifenBlase
		dc.l	Lev5Bulle
		dc.l	Lev5Bulle1
		dc.l	Lev5Bulle2
		dc.l	Lev5Hydrant
		dc.l	Lev5Zeitung
		dc.l	Lev5Dame
		dc.l	Lev5Auto
		dc.l	Lev5AutoKlein
		dc.l	Lev5Tropfen
		dc.l	Lev5Tropfen3
		dc.l	Lev5Flugzeug
		dc.l	Lev5Büchse
		dc.l	Lev5Flasche
		dc.l	Lev5FlascheY
		dc.l	Lev5Fass
		dc.l	Lev5FassSub
		dc.l	Lev5Leuchte
		dc.l	Lev5Banane
		dc.l	Lev5Keule
		dc.l	Lev5Möve
		dc.l	Lev5Wasser
		dc.l	Lev5Geist
		dc.l	Lev5Geist50
		dc.l	Lev5Affe

		SECTION	MyData,DATA

		SETBOB	-30000,0,0,0,0
EnemyList5:
		SETBOB	-135,159,0,Level5Geist50,Level5Geist50

		SETBOB	-75,57,0,Level5HonkBob,Level5HonkBob
		SETBOB	-72,95,0,Level5FarbTopf,Level5FarbTopf
		SETBOB	-16,95,0,Level5FarbTopf,Level5FarbTopf

		SETBOB	1,13,0,Level5CubeBob1,Level5CubeBob1

		SETBOB	106,109,0,Level5GetJobBob,Level5GetJobBob
		SETBOB	126,159,0,Level5Bulle,Level5Bulle
		SETBOB	149,78,0,Level5CoinBob,Level5CoinBob
		SETBOB	179,82,0,Level5SeifenBlase,Level5SeifenBlase

		SETBOB	209,82,0,Level5SeifenBlase,Level5SeifenBlase
		SETBOB	293,63,0,Level5CoinBob,Level5CoinBob

		SETBOB	321,61,0,Level5CubeBob2,Level5CubeBob2
		SETBOB	327,144,0,Level5CubeBob3,Level5CubeBob3
		SETBOB	329,45,0,Level5HutKopf,Level5HutKopf

		SETBOB	349,151,0,Level5EmptyBob,Level5EmptyBob

		SETBOB	467,121,0,Level5Wasser,Level5Wasser
		SETBOB	487,159,0,Level5Flasche,Level5Flasche

		SETBOB	518,155,0,Level5EmptyBob,Level5EmptyBob

		SETBOB	666,155,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	675,87,0,Level5Tropfen,Level5Tropfen

		SETBOB	705,87,0,Level5Tropfen,Level5Tropfen
		SETBOB	714,17,0,Level5CoinBob,Level5CoinBob
		SETBOB	735,14,0,Level5CubeBob4,Level5CubeBob4
		SETBOB	735,87,0,Level5Tropfen,Level5Tropfen
		SETBOB	742,159,0,Level5Katze,Level5Katze
		SETBOB	765,87,0,Level5Tropfen,Level5Tropfen

		SETBOB	889,20,0,Level5BombBob,Level5BombBob
		SETBOB	894,63,$FE00,Level5Büchse,Level5Büchse

		SETBOB	935,96,0,Level5CubeBob1,Level5CubeBob1
		SETBOB	940,63,$FE00,Level5Büchse,Level5Büchse
		SETBOB	945,122,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	953,149,0,Level5CoinBob,Level5CoinBob
		SETBOB	970,79,$FE00,Level5Büchse,Level5Büchse

		SETBOB	1000,127,0,Level5Banane,Level5Banane
		SETBOB	1031,149,0,Level5CoinBob,Level5CoinBob
		SETBOB	1035,120,0,Level5Zeitung,Level5Zeitung

		SETBOB	1113,157,0,Level5EmptyBob,Level5EmptyBob

		SETBOB	1126,79,0,Level5Auto,Level5Auto

		SETBOB	1135,157,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	1155,102,0,Level5CheeseBob,Level5CheeseBob
		SETBOB	1184,200,0,Level5Wasser,Level5Wasser

		SETBOB	1222,63,0,Level5AutoKlein,Level5AutoKlein

		SETBOB	1338,93,0,Level5EmptyBob,Level5EmptyBob

		SETBOB	1503,102,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	1566,156,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	1577,155,0,Level5CubeBob2,Level5CubeBob2

		SETBOB	1640,147,0,Level5CoinBob,Level5CoinBob
		SETBOB	1671,47,0,Level5Fass,Level5Fass
		SETBOB	1688,47,0,Level5Affe,Level5Affe

		SETBOB	1715,13,0,Level5CubeBob3,Level5CubeBob3
		SETBOB	1746,49,0,Level5CoinBob,Level5CoinBob
		SETBOB	1746,84,0,Level5CoinBob,Level5CoinBob

		SETBOB	1816,156,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	1839,51,0,Level5CoinBob,Level5CoinBob
		SETBOB	1864,17,0,Level5CoinBob,Level5CoinBob
		SETBOB	1892,96,0,Level5SeifenBlase,Level5SeifenBlase

		SETBOB	1964,110,0,Level5CubeBob4,Level5CubeBob4
		SETBOB	1989,63,0,Level5Einrad,Level5Einrad
		SETBOB	1993,161,0,Level5CubeBob1,Level5CubeBob1

		SETBOB	2103,159,0,Level5Hydrant,Level5Hydrant
		SETBOB	2103,159,0,Level5Wasser,Level5Wasser
		SETBOB	2162,102,0,Level5CoinBob,Level5CoinBob

		SETBOB	2231,90,0,Level5CubeBob2,Level5CubeBob2
		SETBOB	2270,102,0,Level5CoinBob,Level5CoinBob
		SETBOB	2276,129,0,Level5MagnetoBob,Level5MagnetoBob

		SETBOB	2425,119,0,Level5JumpBob,Level5JumpBob
		SETBOB	2446,59,0,Level5FrageZeichen,Level5FrageZeichen

		SETBOB	2484,96,0,Level5CubeBob3,Level5CubeBob3

		SETBOB	2561,77,0,Level5CubeBob4,Level5CubeBob4

		SETBOB	2689,156,0,Level5EmptyBob,Level5EmptyBob

		SETBOB	2751,47,0,Level5Möve,Level5Möve
		SETBOB	2789,157,0,Level5CubeBob1,Level5CubeBob1
		SETBOB	2788,159,0,Level5Bulle1,Level5Bulle1
		SETBOB	2789,73,0,Level5AtomX,Level5AtomX
;		SETBOB	2790,67,0,Level5Möve,Level5Möve

		SETBOB	2820,28,0,Level5Möve,Level5Möve
		SETBOB	2823,152,0,Level5AtomX,Level5AtomX
		SETBOB	2824,13,0,Level5CubeBob2,Level5CubeBob2
		SETBOB	2887,156,0,Level5CoinBob,Level5CoinBob

		SETBOB	2900,35,0,Level5Möve,Level5Möve
		SETBOB	2924,79,0,Level5SchneeMann,Level5SchneeMann

		SETBOB	2948,104,0,Level5MagnetoBob,Level5MagnetoBob
		SETBOB	2960,111,0,Level5Möve,Level5Möve

		SETBOB	3019,70,0,Level5Möve,Level5Möve
		SETBOB	3032,27,0,Level5CubeBob3,Level5CubeBob3
		SETBOB	3080,58,0,Level5FlascheY,Level5FlascheY
;		SETBOB	3094,147,0,Level5Möve,Level5Möve
		SETBOB	3096,144,0,Level5EmptyBob,Level5EmptyBob

		SETBOB	3107,67,0,Level5BonusBob1,Level5BonusBob1
		SETBOB	3146,112,0,Level5CubeBob4,Level5CubeBob4
		SETBOB	3120,95,0,Level5FassSub,Level5FassSub
		SETBOB	3155,79,0,Level5FassSub,Level5FassSub

		SETBOB	3255,95,0,Level5CoinBob,Level5CoinBob
		SETBOB	3289,50,0,Level5CheeseBob,Level5CheeseBob
		SETBOB	3289,31,0,Level5Einrad,Level5Einrad

		SETBOB	3312,36,0,Level5CoinBob,Level5CoinBob
		SETBOB	3317,130,0,Level5BallonY,Level5BallonY
		SETBOB	3343,10,0,Level5CubeBob1,Level5CubeBob1

		SETBOB	3419,59,0,Level5CoinBob,Level5CoinBob

		SETBOB	3511,149,0,Level5Kugel,Level5Kugel

		SETBOB	3687,138,0,Level5JumpBob,Level5JumpBob
		SETBOB	3692,143,$FD00,Level5Mond,Level5Mond
		SETBOB	3696,127,$FD00,Level5Mond,Level5Mond

		SETBOB	3703,95,$FD00,Level5Mond,Level5Mond
		SETBOB	3704,42,0,Level5CubeBob2,Level5CubeBob2
		SETBOB	3740,159,0,Level5Bulle2,Level5Bulle2
		SETBOB	3798,64,0,Level5CoinBob,Level5CoinBob

		SETBOB	3815,38,0,Level5CubeBob3,Level5CubeBob3
		SETBOB	3868,134,0,Level5BonusBob3,Level5BonusBob3

		SETBOB	3933,79,0,Level5Auto,Level5Auto
		SETBOB	3935,18,0,Level5CubeBob4,Level5CubeBob4
		SETBOB	3987,155,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	3993,31,0,Level5Banane,Level5Banane

		SETBOB	4129,53,0,Level5BonusBob1,Level5BonusBob1
		SETBOB	4141,128,0,Level5FrageZeichen,Level5FrageZeichen
		SETBOB	4155,88,0,Level5Wasser,Level5Wasser
		SETBOB	4161,18,0,Level5CoinBob,Level5CoinBob
		SETBOB	4169,159,0,Level5Geist,Level5Geist
		SETBOB	4191,18,0,Level5CoinBob,Level5CoinBob

		SETBOB	4408,152,0,Level5JumpBob,Level5JumpBob

		SETBOB	4428,79,0,Level5Tropfen3,Level5Tropfen3
		SETBOB	4436,113,0,Level5CubeBob1,Level5CubeBob1
		SETBOB	4447,145,0,Level5Keule,Level5Keule
		SETBOB	4489,199,0,Level5Wasser,Level5Wasser

		SETBOB	4508,60,0,Level5SandUhr,Level5SandUhr
		SETBOB	4522,17,0,Level5CoinBob,Level5CoinBob
		SETBOB	4573,79,0,Level5Tropfen3,Level5Tropfen3

		SETBOB	4666,153,0,Level5EmptyBob,Level5EmptyBob

		SETBOB	4714,153,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	4768,153,0,Level5EmptyBob,Level5EmptyBob

		SETBOB	4810,153,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	4835,133,0,Level5Flugzeug,Level5Flugzeug
		SETBOB	4840,118,0,Level5EmptyBob,Level5EmptyBob
		SETBOB	4869,107,0,Level5Flugzeug,Level5Flugzeug
		SETBOB	4888,153,0,Level5EmptyBob,Level5EmptyBob

		SETBOB	4900,150,0,Level5Flugzeug,Level5Flugzeug
		SETBOB	4900,109,0,Level5GetJobBob2,Level5GetJobBob2
		SETBOB	4912,159,0,Level5Dame,Level5Dame
		SETBOB	4947,120,0,Level5JumpBob,Level5JumpBob
		SETBOB	4982,151,0,Level5Flugzeug,Level5Flugzeug

		SETBOB	5062,127,0,Level5SeifenBlase,Level5SeifenBlase
		SETBOB	5136,150,0,Level5Flugzeug,Level5Flugzeug
		SETBOB	5154,125,0,Level5SeifenBlase,Level5SeifenBlase
		SETBOB	5184,10,0,Level5CubeBob2,Level5CubeBob2

		SETBOB	5200,150,0,Level5Flugzeug,Level5Flugzeug
		SETBOB	5245,31,0,Level5SchneeMann,Level5SchneeMann
		SETBOB	5275,51,0,Level5CubeBob3,Level5CubeBob3
		SETBOB	5295,150,0,Level5Flugzeug,Level5Flugzeug

		SETBOB	5342,159,0,Level5Leuchte,Level5Leuchte
		SETBOB	5367,92,0,Level5JumpBob,Level5JumpBob

		SETBOB	5462,40,0,Level5CheeseBob,Level5CheeseBob

		SETBOB	5501,121,0,Level5BonusBob1,Level5BonusBob1
		SETBOB	5517,153,0,Level5SeifenBlase,Level5SeifenBlase
		SETBOB	5576,31,0,Level5Fass,Level5Fass
		SETBOB	5593,31,0,Level5Affe,Level5Affe

		SETBOB	5624,103,0,Level5CubeBob4,Level5CubeBob4
		SETBOB	5624,40,0,Level5BombBob,Level5BombBob
		SETBOB	5672,159,0,Level5Atom,Level5Atom

		SETBOB	5900,32,0,Level5BusStop,Level5BusStop
		SETBOB	5915,139,0,Level5Ballon,Level5Ballon
		SETBOB	5981,123,0,Level5HutKopf,Level5HutKopf

		SETBOB	6010,123,0,Level5HutKopf,Level5HutKopf
		SETBOB	6055,80,0,Level5CubeBob1,Level5CubeBob1


		SETBOB	30000,0,0,0,0


****************************************************************************

Lev5Bulle1:	SETDATA		Level5Bob131,WonderVars+BobBase
		SETID		LADY1_ID
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		GOTO		BulleGlobal2

Lev5Bulle2:	SETDATA		Level5Bob131,WonderVars+BobBase
		SETID		LADY2_ID
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		GOTO		BulleGlobal2

Lev5Bulle:	SETDATA		Level5Bob131,WonderVars+BobBase
BulleGlobal2:	SETANIM		1$
		SETMOVE		2$
		SETMOVESTEP	12
		SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE
		ENDE

1$:		FOR		3
		 ANIMTO		7,13
		 LSIGNAL	1
		NEXT
		FOR		3
		 ANIMTO		0,6
		 LSIGNAL	1
		NEXT
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

Lev5Affe:	SETDATA		Level5Bob14,WonderVars+BobBase
AffeGlobal:	SETANIM		1$
		SETANIMSPEED	3
	;;	SETHITMASK	RONNY_HITCOLL
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETPRI		64
		ENDE

1$:		ANIMTO		0,4
		SIGNAL		8
		ANIMTO		3,0
		RNDDELAY	30,60
		LOOP

****************************************************************************

Lev5Geist50:	SETDATA		Level5Bob6,WonderVars+BobBase
GeistGlobal50:	SETANIM		1$
		SETMOVE		2$
		GOTO		GeistGlobal2

1$:		FOR		12
		 ANIMTO		4,7
		 LSIGNAL	1
		NEXT
		FOR		12
		 ANIMTO		0,3
		 LSIGNAL	1
		NEXT
		LOOP

2$:		FOR		12
		 LWAIT		1
		 LEFT		1
		NEXT
		FOR		12
		 LWAIT		1
		 RIGHT		1
		NEXT
		LOOP

Lev5Geist:	SETDATA		Level5Bob6,WonderVars+BobBase
GeistGlobal:	SETANIM		GeistAnim
		SETMOVE		GeistMove
GeistGlobal2:	SETANIMSPEED	5
		SETMOVESTEP	4
		SETUSERDATA	$07000000
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETHITMASK	RONNY_HITCOLL
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		ENDE

GeistAnim:	FOR		25
		 ANIMTO		4,7
		 LSIGNAL	1
		NEXT
		FOR		25
		 ANIMTO		0,3
		 LSIGNAL	1
		NEXT
		LOOP

GeistMove:	FOR		25
		 LWAIT		1
		 LEFT		1
		NEXT
		FOR		25
		 LWAIT		1
		 RIGHT		1
		NEXT
		LOOP

****************************************************************************

Lev5BallonY:	SETDATA		Level5Bob19,WonderVars+BobBase
		SETMOVE		1$
		GOTO		BallonGlobal

1$:		UP		35
		DOWN		35
		LOOP

Lev5Ballon:	SETDATA		Level5Bob19,WonderVars+BobBase
		SETMOVE		BallonMove
BallonGlobal:	SETPRI		50
		SETANIMSPEED	3
		SETANIM		BallonAnim
		SETMOVESTEP	2
		SETUSERDATA	$09000000
		
Lev5Global:	SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETHITMASK	RONNY_HITCOLL
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		ENDE

BallonAnim:	dc.w		0,1
		LOOP

BallonMove:	LEFT		120
		RIGHT		120
		LOOP

****************************************************************************

Lev5Mond:	SETDATA		Level5Bob21,WonderVars+BobBase
		GOTO		JumpGlobal

Lev5SchneeMann:	SETDATA		Level5Bob22,WonderVars+BobBase
		SETANIM		1$
		SETANIMSPEED	3
		SETMOVE		2$
		SETMOVESTEP	2
		SETUSERDATA	$07000000
		GOTO		Lev5Global

1$:		ANIMTO		0,14
		LOOP

2$:		LEFT		20
		RIGHT		20
		LOOP

****************************************************************************

Lev5Einrad:	SETDATA		Level5Bob37,WonderVars+BobBase
		GOTO		GlobalLEinrad

****************************************************************************

Lev5FarbTopf:	SETDATA		Level5Bob50,WonderVars+BobBase
		SETANIM		1$
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

2$:		SETDATA		Level5Bob55,WonderVars+BobBase
		SETMOVE		3$
		SETMOVESTEP	4
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETHITMASK	RONNY_HITCOLL
		ENDE

3$:		DOWN		45
		REMOVE
		ENDE

****************************************************************************

Lev5Kugel:	SETDATA		Level5Bob56,WonderVars+BobBase
		SETANIM		1$
		SETANIMSPEED	2
		SETMOVE		2$
		SETMOVESTEP	2
		SETUSERDATA	$07000000
		GOTO		Lev5Global
	
1$:		ANIMTO		0,15
		LOOP

2$:		LEFT		50
		RIGHT		50
		LOOP

****************************************************************************

Lev5HutKopf:	SETDATA		Level5Bob72,WonderVars+BobBase
		GOTO		HutGlobal

****************************************************************************

Lev5Katze:	SETDATA		Level5Bob100,WonderVars+BobBase
		GOTO		KatzeGlobal

****************************************************************************

Lev5Atom:	SETDATA		Level5Bob116,WonderVars+BobBase
		SETMOVE		1$
		SETMOVESTEP	2
		GOTO		GlobalAtom

1$:		UP		30
		DOWN		30
		LOOP

Lev5AtomX:	SETDATA		Level5Bob116,WonderVars+BobBase
		SETMOVE		1$
		SETMOVESTEP	2
		GOTO		GlobalAtom

1$:		LEFT		30
		RIGHT		30
		LOOP

****************************************************************************

Lev5SeifenBlase:
		SETDATA		Level5Bob128,WonderVars+BobBase
		GOTO		GlobalSeife

****************************************************************************

Lev5Hydrant:	SETDATA		Level5Bob145,WonderVars+BobBase
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETPRI		0
		ENDE

****************************************************************************

Lev5Wasser:	SETDATA		Level5Bob146,WonderVars+BobBase
		GOTO		GlobalWasser

****************************************************************************

Lev5Zeitung:	SETDATA		Level5Bob150,WonderVars+BobBase
		GOTO		ZeitungGlobal

****************************************************************************

Lev5Dame:	SETDATA		Level5Bob158,WonderVars+BobBase
		GOTO		BonusDameGlobal

****************************************************************************

Lev5Auto:	SETDATA		Level5Bob170,WonderVars+BobBase
		GOTO		RedCarGlobal

****************************************************************************

Lev5AutoKlein:	SETDATA		Level5Bob174,WonderVars+BobBase
		GOTO		BlueCarGlobal

****************************************************************************

Lev5Tropfen:	SETDATA		Level5Bob178,WonderVars+BobBase
		GOTO		Tropfen2

****************************************************************************

Lev5Tropfen3:	SETDATA		EmptyBob,WonderVars+ImmerBobBase
		SETMOVE		1$
		SETUSERFLAGS	BOBF_REMOVE
		ENDE

1$:		ADDRELBOB	2$,0,0
		RNDDELAY	60,100
		LOOP

2$:		SETDATA		Level5Bob178,WonderVars+BobBase
		GOTO		Tropfen3

****************************************************************************

Lev5Flugzeug:	SETDATA		Level5Bob181,WonderVars+BobBase
		GOTO		GlobalLFlieger

****************************************************************************

Lev5Büchse:	SETDATA		Level5Bob189,WonderVars+BobBase
JumpGlobal:	SETMOVE		1$
		SETUSERDATA	$01000000
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE

1$:		CPUJUMP		Coin,0			* Init
		FOREVER
		 CPUJUMP	Coin,1			* Move
		 DELAY		1
		NEXT

****************************************************************************

Lev5Flasche:	SETDATA		Level5Bob190,WonderVars+BobBase
		SETMOVE		1$
		SETUSERDATA	$02000000
		GOTO		Lev5Global

1$:		LEFT	40
		RIGHT	40
		LOOP


Lev5FlascheY:	SETDATA		Level5Bob190,WonderVars+BobBase
		SETMOVE		1$
		SETUSERDATA	$02000000
		GOTO		Lev5Global

1$:		UP	35
		DOWN	35
		LOOP

****************************************************************************

Lev5Fass:	SETDATA		Level5Bob191,WonderVars+BobBase
		SETANIM		1$
		GOTO		Global

1$:		WAIT		8
		ADDRELBOB	Lev5FassSub,-10,0
		LOOP


Lev5FassSub:	SETDATA		Level5Bob192,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		LFassSubMove
		SETANIMSPEED	3
		SETHITMASK	RONNY_STURZ
		SETUSERFLAGS	BOBF_ENEMY
		SETPRI		-1
		ENDE

1$:		ANIMTO		0,7
		LOOP

LFassSubMove:	CPUJUMP		StartFass,0
		SETUSERFLAGS	BOBF_ENEMY|BOBF_REMOVE
		FOREVER
		 CPUJUMP	Coin,1
		 DELAY		1
		NEXT

StartFass:	move.b		#1,bob_UserData+ud_FallingDist(a0)
		move.b		#-2,bob_UserData+ud_XMove(A0)
		rts

****************************************************************************

Lev5Leuchte:	SETDATA		Level5Bob200,WonderVars+BobBase
		SETMOVE		1$
		SETUSERDATA	$03000000
		GOTO		Lev5Global

1$:		LEFT		35
		RIGHT		35
		LOOP

****************************************************************************

Lev5Banane:	SETDATA		Level5Bob201,WonderVars+BobBase
		SETMOVE		1$
		SETMOVESPEED	2
		SETUSERDATA	$02000000
		SETHITMASK	RONNY_STURZ
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		ENDE

1$:		LEFT	60
		RIGHT	60
		LOOP

****************************************************************************

Lev5Keule:	SETDATA		Level5Bob202,WonderVars+BobBase
		SETUSERDATA	$02000000
		GOTO		LKeuleGlobal

****************************************************************************

Lev5Möve:	SETDATA		Level5Bob211,WonderVars+BobBase
		GOTO		MöveGlobal

****************************************************************************
