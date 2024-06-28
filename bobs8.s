************************************************************************************
*** Hafen
************************************************************************************

		XDEF	EnemyList8,Level8BobTab

		XREF	BulleGlobal2,GeistGlobal,GeistGlobal50,AffeGlobal
		XREF	BallonGlobal,GlobalLFlieger

		XREF	GlobalBobbel
		XREF	ZeitungGlobal2,BlueCarGlobal,AmigaGlobal
		XREF	ShootColl,RonnyColl,EnergyColl,HealthColl
		XREF	Lev4Global2,KugelGlobal2,GlobalClown,Lev4Global

		XREF	FallHandler,CommonRemBobTest,CommonRemBob,WonderVars
		XREF	ShopColl

		XREF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XREF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XREF	ImmerShopBob1
		XREF	ImmerCoinBob,Coin,ImmerEmptyBob
		XREF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XREF	ImmerGetJobBob17,ImmerGetJobBob18
		XREF	ImmerBusStop1,ImmerSandUhr
		XREF	BlauKopfGlobal

		XREF	Job1Done
		XREF	Play8SVX,Blip

		XREF	Global,LKeuleGlobal,FussGänger
		XREF	KopfGlobal,KopfBigGlobal
		XREF	LokGlobal,PlattGlobal
		XREF	DameGlobal,FliegerGlobal,GlobalKiss
		XREF	SchereGlobal,WeckerGlobal,Tropfen2,Tropfen3
		XREF	GlobalBall,SeifenGlobal,BuchGlobal,SeifeGlobal
		XREF	LKeuleGlobal2,SchereGlobal2
		XREF	BonusDameGlobal

		XREF	LampeGlobal,GlühLGlobal,KugelGlobal
		XREF	Tropfen3Global,BatManXGlobal,BatManGlobal,MouthGlobal
		XREF	KeuleGlobal,HamburgerGlobal,BRedCarGlobal,RöhreGlobal

		XREF	GlobalLEinrad,HutGlobal,GlobalSeife,ZeitungGlobal
		XREF	GlobalWasser,GlobalAtom,KatzeGlobal
		XREF	RedCarGlobal,BlueCarGlobal
		XREF	MöveGlobal

		XREF	Lev5Banane,Lev5Möve,Lev5Keule,Lev5Leuchte
		XREF	Lev5Fass,Lev5Flasche,Lev5FlascheY,Lev5Büchse
		XREF	Lev5Flugzeug,Lev5Tropfen,Lev5Tropfen3
		XREF	Lev5Zeitung,Lev5Auto,Lev5AutoKlein,Lev5Hydrant
		XREF	Lev5Dame,Lev5SeifenBlase,Lev5Katze,Lev5Atom,Lev5AtomX
		XREF	Lev5HutKopf,Lev5Kugel,Lev5FarbTopf,Lev5Einrad
		XREF	Lev5Mond,Lev5SchneeMann,Lev5Ballon
		XREF	Lev5Geist,Lev5Geist50,Lev5Bulle2
		XREF	Lev5Wasser,Lev5Affe

		INCLUDE "myexec.i"
		INCLUDE	"drawbob.i"
		INCLUDE	"sfx.i"
		INCLUDE	"definitions.i"
		INCLUDE	"Gfx/Level5Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"


Level8BobTab:	dc.l	0			* Dummy
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
		dc.l	ImmerEmptyBob
		dc.l	ImmerGetJobBob17
		dc.l	ImmerGetJobBob18
 		dc.l	ImmerBusStop1
 		dc.l	ImmerSandUhr

		dc.l	Lev8Ballon
		dc.l	Lev5Mond
		dc.l	Lev8MondY
		dc.l	Lev5SchneeMann
		dc.l	Lev5Einrad
		dc.l	Lev5FarbTopf
		dc.l	Lev5Kugel
		dc.l	Lev8HutKopf
		dc.l	Lev8HutKopfY
		dc.l	Lev5Katze
		dc.l	Lev5Atom
		dc.l	Lev5AtomX
		dc.l	Lev8SeifenBlase
		dc.l	Lev8SeifenBlaseJ
		dc.l	Lev5Bulle2
		dc.l	Lev5Hydrant
		dc.l	Lev8Zeitung
		dc.l	Lev8ZeitungX
		dc.l	Lev8ZeitungY
		dc.l	Lev8Dame
		dc.l	Lev8Dame1
		dc.l	Lev5Auto
		dc.l	Lev5AutoKlein
		dc.l	Lev5Tropfen
		dc.l	Lev5Tropfen3
		dc.l	Lev5Flugzeug
		dc.l	Lev5Büchse
		dc.l	Lev5Flasche
		dc.l	Lev5FlascheY
		dc.l	Lev5Fass
		dc.l	Lev5Leuchte
		dc.l	Lev5Banane
		dc.l	Lev5Keule
		dc.l	Lev8KeuleY
		dc.l	Lev5Möve
		dc.l	Lev5Wasser
		dc.l	Lev5Geist
		dc.l	Lev5Geist50
		dc.l	Lev5Affe

	STRUCTURE Level8bob8Structure,0

		BYTE	Level8Dummy
		BYTE	Level8ShopBob
		BYTE	Level8CoinBob
		BYTE	Level8CubeBob1
		BYTE	Level8CubeBob2
		BYTE	Level8CubeBob3
		BYTE	Level8CubeBob4
		BYTE	Level8JumpBob
		BYTE	Level8CheeseBob
		BYTE	Level8BombBob
		BYTE	Level8MagnetoBob
		BYTE	Level8HonkBob
		BYTE	Level8BonusBob1
		BYTE	Level8BonusBob3
		BYTE	Level8FrageZeichen
		BYTE	Level8EmptyBob
		BYTE	Level8GetJobBob
		BYTE	Level8GetJobBob2
		BYTE	Level8BusStop
		BYTE	Level8SandUhr

		BYTE	Level8Ballon
		BYTE	Level8Mond
		BYTE	Level8MondY
		BYTE	Level8SchneeMann
		BYTE	Level8Einrad
		BYTE	Level8FarbTopf
		BYTE	Level8Kugel
		BYTE	Level8HutKopf
		BYTE	Level8HutKopfY
		BYTE	Level8Katze
		BYTE	Level8Atom
		BYTE	Level8AtomX
		BYTE	Level8SeifenBlase
		BYTE	Level8SeifenBlaseJ
		BYTE	Level8Bulle2
		BYTE	Level8Hydrant
		BYTE	Level8Zeitung
		BYTE	Level8ZeitungX
		BYTE	Level8ZeitungY
		BYTE	Level8Dame
		BYTE	Level8Dame1
		BYTE	Level8Auto
		BYTE	Level8AutoKlein
		BYTE	Level8Tropfen
		BYTE	Level8Tropfen3
		BYTE	Level8Flugzeug
		BYTE	Level8Büchse
		BYTE	Level8Flasche
		BYTE	Level8FlascheY
		BYTE	Level8Fass
		BYTE	Level8Leuchte
		BYTE	Level8Banane
		BYTE	Level8Keule
		BYTE	Level8KeuleY
		BYTE	Level8Möve
		BYTE	Level8Wasser
		BYTE	Level8Geist
		BYTE	Level8Geist50
		BYTE	Level8Affe


		SECTION	MyData,DATA

		SETBOB	-30000,0,0,0,0
EnemyList8:
		SETBOB	-27,175,0,Level8Leuchte,Level8Leuchte

		SETBOB	3,40,0,Level8CoinBob,Level8CoinBob
		SETBOB	12,168,0,Level8Atom,Level8Atom
		SETBOB	30,5,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	90,2,0,Level8EmptyBob,Level8EmptyBob

		SETBOB	108,119,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	110,169,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	150,2,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	195,110,0,Level8CoinBob,Level8CoinBob

		SETBOB	210,1,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	217,148,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	224,109,0,Level8CoinBob,Level8CoinBob
		SETBOB	235,175,0,Level8Banane,Level8Banane
		SETBOB	263,170,0,Level8CubeBob1,Level8CubeBob1
		SETBOB	270,1,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	290,69,0,Level8CoinBob,Level8CoinBob
		SETBOB	293,79,0,Level8SchneeMann,Level8SchneeMann

		SETBOB	311,15,0,Level8CubeBob2,Level8CubeBob2
		SETBOB	391,165,0,Level8EmptyBob,Level8EmptyBob

		SETBOB	423,60,0,Level8CoinBob,Level8CoinBob
		SETBOB	430,152,0,Level8ZeitungX,Level8ZeitungX

		SETBOB	543,173,0,Level8HutKopfY,Level8HutKopfY
		SETBOB	564,58,0,Level8FrageZeichen,Level8FrageZeichen
		SETBOB	589,170,0,Level8CoinBob,Level8CoinBob

		SETBOB	641,169,0,Level8CubeBob3,Level8CubeBob3
		SETBOB	667,20,0,Level8CoinBob,Level8CoinBob
		SETBOB	679,95,0,Level8Katze,Level8Katze

		SETBOB	713,166,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	713,8,0,Level8CubeBob4,Level8CubeBob4
		SETBOB	721,20,0,Level8CoinBob,Level8CoinBob
		SETBOB	737,166,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	740,175,0,Level8GetJobBob,Level8GetJobBob
		SETBOB	742,31,0,Level8Flasche,Level8Flasche
		SETBOB	754,63,0,Level8Auto,Level8Auto
		SETBOB	766,166,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	798,83,0,Level8CoinBob,Level8CoinBob

		SETBOB	812,175,0,Level8Hydrant,Level8Hydrant
		SETBOB	812,175,0,Level8Wasser,Level8Wasser
		SETBOB	864,101,0,Level8CoinBob,Level8CoinBob
		SETBOB	865,75,0,Level8KeuleY,Level8KeuleY

		SETBOB	909,75,0,Level8KeuleY,Level8KeuleY
		SETBOB	923,166,0,Level8CoinBob,Level8CoinBob
		SETBOB	973,9,0,Level8CubeBob1,Level8CubeBob1

		SETBOB	1041,79,0,Level8Fass,Level8Fass
		SETBOB	1059,79,0,Level8Affe,Level8Affe

		SETBOB	1102,85,0,Level8SeifenBlase,Level8SeifenBlase
		SETBOB	1130,13,0,Level8CubeBob2,Level8CubeBob2
		SETBOB	1130,143,0,Level8Auto,Level8Auto
		SETBOB	1152,105,0,Level8JumpBob,Level8JumpBob
		SETBOB	1195,87,0,Level8CoinBob,Level8CoinBob

		SETBOB	1234,87,0,Level8CoinBob,Level8CoinBob
		SETBOB	1236,127,0,Level8Flasche,Level8Flasche
		SETBOB	1270,159,0,Level8Flasche,Level8Flasche

		SETBOB	1321,143,0,Level8Flasche,Level8Flasche
		SETBOB	1339,87,0,Level8CoinBob,Level8CoinBob
		SETBOB	1381,87,0,Level8CoinBob,Level8CoinBob
		SETBOB	1387,127,0,Level8Flasche,Level8Flasche

		SETBOB	1606,42,0,Level8CubeBob3,Level8CubeBob3
		SETBOB	1618,50,0,Level8BonusBob3,Level8BonusBob3
		SETBOB	1626,116,0,Level8Flugzeug,Level8Flugzeug
		SETBOB	1626,155,0,Level8Flugzeug,Level8Flugzeug
		SETBOB	1696,137,0,Level8EmptyBob,Level8EmptyBob

		SETBOB	1714,67,0,Level8CoinBob,Level8CoinBob
		SETBOB	1729,143,0,Level8SeifenBlase,Level8SeifenBlase
		SETBOB	1736,24,0,Level8FrageZeichen,Level8FrageZeichen
		SETBOB	1771,47,0,Level8AutoKlein,Level8AutoKlein
		SETBOB	1773,119,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	1783,15,0,Level8AutoKlein,Level8AutoKlein
		SETBOB	1785,42,0,Level8CubeBob4,Level8CubeBob4
		SETBOB	1792,71,0,Level8BombBob,Level8BombBob
		SETBOB	1796,64,0,Level8CoinBob,Level8CoinBob

		SETBOB	1871,135,0,Level8CoinBob,Level8CoinBob

		SETBOB	1904,92,0,Level8KeuleY,Level8KeuleY
		SETBOB	1990,135,0,Level8EmptyBob,Level8EmptyBob

		SETBOB	2033,135,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	2065,127,0,Level8Fass,Level8Fass
		SETBOB	2082,127,0,Level8Affe,Level8Affe

		SETBOB	2127,158,0,Level8CubeBob1,Level8CubeBob1
		SETBOB	2138,134,0,Level8CoinBob,Level8CoinBob
		SETBOB	2161,61,0,Level8FlascheY,Level8FlascheY
		SETBOB	2162,79,0,Level8CoinBob,Level8CoinBob

		SETBOB	2205,24,0,Level8CoinBob,Level8CoinBob
		SETBOB	2215,159,0,Level8Flasche,Level8Flasche
		SETBOB	2288,11,0,Level8CubeBob3,Level8CubeBob3
		SETBOB	2291,111,0,Level8Banane,Level8Banane

		SETBOB	2328,87,0,Level8BonusBob1,Level8BonusBob1
		SETBOB	2343,158,0,Level8CubeBob2,Level8CubeBob2
		SETBOB	2346,23,0,Level8CoinBob,Level8CoinBob
		SETBOB	2347,95,0,Level8SeifenBlase,Level8SeifenBlase
		SETBOB	2380,156,0,Level8SeifenBlase,Level8SeifenBlase
		SETBOB	2389,110,0,Level8CheeseBob,Level8CheeseBob
		SETBOB	2390,159,0,Level8Katze,Level8Katze

		SETBOB	2541,31,$FD00,Level8Büchse,Level8Büchse
		SETBOB	2562,19,0,Level8CoinBob,Level8CoinBob
		SETBOB	2568,31,$FE00,Level8Büchse,Level8Büchse
		SETBOB	2598,79,$FD00,Level8Büchse,Level8Büchse

		SETBOB	2624,79,0,Level8Leuchte,Level8Leuchte
		SETBOB	2640,79,$FD00,Level8Büchse,Level8Büchse
		SETBOB	2664,106,0,Level8CubeBob4,Level8CubeBob4
		SETBOB	2694,140,0,Level8CoinBob,Level8CoinBob

		SETBOB	2700,79,0,Level8Geist50,Level8Geist50
		SETBOB	2735,170,0,Level8CoinBob,Level8CoinBob
		SETBOB	2768,57,0,Level8CoinBob,Level8CoinBob
		SETBOB	2774,111,0,Level8Banane,Level8Banane

		SETBOB	2800,121,0,Level8SeifenBlase,Level8SeifenBlase
		SETBOB	2812,57,0,Level8CoinBob,Level8CoinBob
		SETBOB	2824,59,0,Level8CubeBob1,Level8CubeBob1
		SETBOB	2865,41,0,Level8Kugel,Level8Kugel
		SETBOB	2872,172,0,Level8CubeBob2,Level8CubeBob2
		SETBOB	2879,147,0,Level8CoinBob,Level8CoinBob

		SETBOB	2900,54,0,Level8BonusBob3,Level8BonusBob3
		SETBOB	2944,57,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	2980,57,0,Level8EmptyBob,Level8EmptyBob

		SETBOB	3022,57,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	3027,31,0,Level8SchneeMann,Level8SchneeMann
		SETBOB	3050,57,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	3054,159,0,Level8Geist50,Level8Geist50
		SETBOB	3054,157,0,Level8ZeitungX,Level8ZeitungX

		SETBOB	3111,97,0,Level8FrageZeichen,Level8FrageZeichen
		SETBOB	3132,57,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	3138,58,0,Level8MondY,Level8MondY
		SETBOB	3155,153,0,Level8HutKopf,Level8HutKopf
		SETBOB	3164,57,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	3170,58,0,Level8MondY,Level8MondY
		SETBOB	3191,118,0,Level8CoinBob,Level8CoinBob

		SETBOB	3200,58,0,Level8MondY,Level8MondY
		SETBOB	3207,175,0,Level8Banane,Level8Banane
		SETBOB	3228,58,0,Level8MondY,Level8MondY
		SETBOB	3272,135,0,Level8Wasser,Level8Wasser

		SETBOB	3322,82,0,Level8CubeBob3,Level8CubeBob3
		SETBOB	3382,170,0,Level8AtomX,Level8AtomX

		SETBOB	3428,120,0,Level8Wasser,Level8Wasser
		SETBOB	3437,120,0,Level8CoinBob,Level8CoinBob
		SETBOB	3454,162,0,Level8KeuleY,Level8KeuleY

		SETBOB	3513,16,0,Level8CoinBob,Level8CoinBob
		SETBOB	3568,53,0,Level8CoinBob,Level8CoinBob

		SETBOB	3610,175,0,Level8Leuchte,Level8Leuchte
		SETBOB	3632,151,0,Level8CoinBob,Level8CoinBob
		SETBOB	3634,16,0,Level8CubeBob4,Level8CubeBob4

		SETBOB	3755,99,0,Level8MagnetoBob,Level8MagnetoBob
		SETBOB	3761,150,0,Level8Flasche,Level8Flasche
		SETBOB	3776,63,0,Level8Auto,Level8Auto

		SETBOB	3823,119,0,Level8CubeBob1,Level8CubeBob1
		SETBOB	3825,45,0,Level8CoinBob,Level8CoinBob
		SETBOB	3825,175,0,Level8Hydrant,Level8Hydrant
		SETBOB	3825,175,0,Level8Wasser,Level8Wasser
		SETBOB	3827,33,0,Level8BonusBob1,Level8BonusBob1

		SETBOB	3908,18,0,Level8CoinBob,Level8CoinBob
		SETBOB	3935,18,0,Level8CoinBob,Level8CoinBob

		SETBOB	4010,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4026,97,0,Level8FrageZeichen,Level8FrageZeichen
		SETBOB	4040,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4070,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4095,179,0,Level8CoinBob,Level8CoinBob

		SETBOB	4100,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4125,35,0,Level8CubeBob2,Level8CubeBob2
		SETBOB	4130,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4158,165,0,Level8SeifenBlase,Level8SeifenBlase
		SETBOB	4160,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4171,99,0,Level8BombBob,Level8BombBob
		SETBOB	4177,79,$FD00,Level8Büchse,Level8Büchse
		SETBOB	4190,0,0,Level8Tropfen3,Level8Tropfen3

		SETBOB	4220,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4250,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4280,0,0,Level8Tropfen3,Level8Tropfen3

		SETBOB	4310,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4335,179,0,Level8CoinBob,Level8CoinBob
		SETBOB	4340,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4344,121,0,Level8CubeBob3,Level8CubeBob3
		SETBOB	4370,0,0,Level8Tropfen3,Level8Tropfen3

		SETBOB	4400,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4408,102,0,Level8CoinBob,Level8CoinBob
		SETBOB	4430,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4460,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4490,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4494,179,0,Level8CoinBob,Level8CoinBob

		SETBOB	4520,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4550,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	4564,70,0,Level8CoinBob,Level8CoinBob
		SETBOB	4580,0,0,Level8Tropfen3,Level8Tropfen3

		SETBOB	4643,101,0,Level8SandUhr,Level8SandUhr

		SETBOB	4822,62,0,Level8CoinBob,Level8CoinBob
		SETBOB	4841,174,0,Level8CubeBob4,Level8CubeBob4

		SETBOB	4900,157,0,Level8Flugzeug,Level8Flugzeug
		SETBOB	4900,95,0,Level8Flugzeug,Level8Flugzeug

		SETBOB	5000,122,0,Level8Flugzeug,Level8Flugzeug
		SETBOB	5000,157,0,Level8Flugzeug,Level8Flugzeug
		SETBOB	5080,82,0,Level8CoinBob,Level8CoinBob

		SETBOB	5134,175,0,Level8Dame1,Level8Dame1
		SETBOB	5150,152,0,Level8Flugzeug,Level8Flugzeug
		SETBOB	5191,171,0,Level8CoinBob,Level8CoinBob

		SETBOB	5200,133,0,Level8Flugzeug,Level8Flugzeug
		SETBOB	5217,70,0,Level8FlascheY,Level8FlascheY
		SETBOB	5244,70,0,Level8FlascheY,Level8FlascheY
		SETBOB	5274,70,0,Level8FlascheY,Level8FlascheY

		SETBOB	5313,70,0,Level8FlascheY,Level8FlascheY
		SETBOB	5343,120,0,Level8JumpBob,Level8JumpBob
		SETBOB	5360,159,0,Level8SchneeMann,Level8SchneeMann
		SETBOB	5395,28,0,Level8EmptyBob,Level8EmptyBob

		SETBOB	5411,90,0,Level8FrageZeichen,Level8FrageZeichen
		SETBOB	5440,28,0,Level8EmptyBob,Level8EmptyBob

		SETBOB	5500,175,0,Level8CoinBob,Level8CoinBob
		SETBOB	5503,28,0,Level8CoinBob,Level8CoinBob
		SETBOB	5543,15,0,Level8CubeBob1,Level8CubeBob1
		SETBOB	5552,171,0,Level8CubeBob2,Level8CubeBob2
		SETBOB	5567,31,0,Level8Fass,Level8Fass
		SETBOB	5584,31,0,Level8Affe,Level8Affe

		SETBOB	5623,105,0,Level8HutKopf,Level8HutKopf
		SETBOB	5649,85,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	5679,85,0,Level8EmptyBob,Level8EmptyBob

		SETBOB	5709,85,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	5714,68,0,Level8ZeitungX,Level8ZeitungX

		SETBOB	5800,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	5811,53,0,Level8CoinBob,Level8CoinBob
		SETBOB	5830,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	5860,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	5890,0,0,Level8Tropfen3,Level8Tropfen3

		SETBOB	5920,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	5950,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	5953,167,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	5980,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	5986,94,0,Level8BonusBob3,Level8BonusBob3

		SETBOB	6010,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	6040,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	6070,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	6090,175,0,Level8Bulle2,Level8Bulle2

		SETBOB	6100,0,0,Level8Tropfen3,Level8Tropfen3
		SETBOB	6123,64,0,Level8HonkBob,Level8HonkBob
		SETBOB	6124,31,0,Level8Einrad,Level8Einrad

		SETBOB	6240,95,0,Level8Katze,Level8Katze
		SETBOB	6273,25,0,Level8CoinBob,Level8CoinBob
		SETBOB	6281,175,0,Level8SchneeMann,Level8SchneeMann
		SETBOB	6287,121,0,Level8SeifenBlase,Level8SeifenBlase

		SETBOB	6311,157,0,Level8CubeBob3,Level8CubeBob3
		SETBOB	6338,121,0,Level8SeifenBlase,Level8SeifenBlase
		SETBOB	6382,95,0,Level8Einrad,Level8Einrad

		SETBOB	6455,31,0,Level8Einrad,Level8Einrad
		SETBOB	6457,9,0,Level8CubeBob4,Level8CubeBob4
		SETBOB	6462,162,0,Level8CoinBob,Level8CoinBob

		SETBOB	6565,95,0,Level8Einrad,Level8Einrad

		SETBOB	6607,31,0,Level8Einrad,Level8Einrad
		SETBOB	6653,170,0,Level8EmptyBob,Level8EmptyBob
		SETBOB	6675,47,0,Level8FrageZeichen,Level8FrageZeichen
		SETBOB	6695,112,0,Level8AtomX,Level8AtomX

		SETBOB	6729,154,0,Level8CubeBob1,Level8CubeBob1
		SETBOB	6729,24,0,Level8CoinBob,Level8CoinBob
		SETBOB	6730,184,0,Level8Wasser,Level8Wasser
		SETBOB	6759,114,0,Level8SeifenBlase,Level8SeifenBlase

		SETBOB	6825,168,0,Level8Wasser,Level8Wasser
		SETBOB	6857,79,0,Level8Einrad,Level8Einrad

		SETBOB	6914,95,0,Level8Banane,Level8Banane

		SETBOB	6988,126,0,Level8GetJobBob2,Level8GetJobBob2
		SETBOB	6998,175,0,Level8Dame,Level8Dame

		SETBOB	7166,175,0,Level8BusStop,Level8BusStop

		SETBOB	30000,0,0,0,0

****************************************************************************

Lev8Ballon:	SETDATA		Level5Bob19,WonderVars+BobBase
		SETMOVE		BallonMove
		GOTO		BallonGlobal


Lev8Global:	SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETHITMASK	RONNY_HITCOLL
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		ENDE

BallonMove:	LEFT		120
		RIGHT		120
		LOOP

****************************************************************************

Lev8MondY:	SETDATA		Level5Bob21,WonderVars+BobBase
		SETMOVE		1$
		SETMOVESTEP	2
		GOTO		JumpGlobal2

1$:		UP		20
		DOWN		20
		LOOP

****************************************************************************

Lev8HutKopf:	SETDATA		Level5Bob72,WonderVars+BobBase
		GOTO		HutGlobal

Lev8HutKopfY:	SETDATA		Level5Bob72,WonderVars+BobBase
		SETMOVE		1$
		SETANIM		2$
		GOTO		BlauKopfGlobal

1$:		UP		30
		DOWN		30
		LOOP

2$:		ANIMTO		0,11
		LOOP


****************************************************************************

Lev8SeifenBlaseJ:
		SETDATA		Level5Bob128,WonderVars+BobBase
		GOTO		GlobalSeife

Lev8SeifenBlase:
		SETDATA		Level5Bob128,WonderVars+BobBase
		SETMOVE		1$
		GOTO		SeifeGlobal

1$:		UP		35
		DOWN		35
		LOOP

****************************************************************************

Lev8Zeitung:	SETDATA		Level5Bob150,WonderVars+BobBase
		GOTO		ZeitungGlobal

Lev8ZeitungY:	SETDATA		Level5Bob150,WonderVars+BobBase
		SETANIM		ZAnim
		SETMOVE		ZMoveY
		GOTO		ZeitungGlobal2

Lev8ZeitungX:	SETDATA		Level5Bob150,WonderVars+BobBase
		SETANIM		ZAnim
		SETMOVE		ZMoveX
		GOTO		ZeitungGlobal2

ZAnim:		ANIMTO		0,7
		LOOP

ZMoveY:		UP		80
		DOWN		80
		LOOP

ZMoveX:		LEFT		80
		RIGHT		80
		LOOP

****************************************************************************

Lev8Dame:	SETDATA		Level5Bob158,WonderVars+BobBase
		GOTO		BonusDameGlobal

Lev8Dame1:	SETDATA		Level5Bob158,WonderVars+BobBase
		SETID		LADY1_ID
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		GOTO		DameGlobal

****************************************************************************

Lev8Büchse:	SETDATA		Level5Bob189,WonderVars+BobBase
JumpGlobal:	SETMOVE		JumpMove
JumpGlobal2:	SETUSERDATA	$01000000
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE

JumpMove:	CPUJUMP		Coin,0			* Init
		FOREVER
		 CPUJUMP	Coin,1			* Move
		 DELAY		1
		NEXT

****************************************************************************

Lev8Banane:	SETDATA		Level5Bob201,WonderVars+BobBase
		SETMOVE		1$
		SETMOVESPEED	2
		SETUSERDATA	$02000000
		SETHITMASK	RONNY_STURZ
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		ENDE

1$:		LEFT	20
		RIGHT	20
		LOOP

****************************************************************************

Lev8KeuleY:	SETDATA		Level5Bob202,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		2$
		GOTO		LKeuleGlobal2

1$:		ANIMTO		0,7
		LOOP

2$:		UP		30
		DOWN		30
		LOOP

****************************************************************************
