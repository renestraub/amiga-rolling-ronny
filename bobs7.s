************************************************************************************
***  Büro
************************************************************************************

		XDEF	EnemyList7,Level7BobTab

		XREF	GlobalBobbel
		XREF	ZeitungGlobal2,BlueCarGlobal,AmigaGlobal
		XREF	ShootColl,RonnyColl,EnergyColl,HealthColl
		XREF	Lev4Global2,KugelGlobal2,GlobalClown,Lev4Global
		XREF	GameEnd

		XREF	FallHandler,CommonRemBobTest,CommonRemBob,WonderVars
		XREF	GetElem,GetInfo,ShopColl

		XREF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XREF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XREF	ImmerShopBob1
		XREF	ImmerCoinBob,Coin,ImmerEmptyBob
		XREF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XREF	ImmerGetJobBob14,ImmerGetJobBob15,ImmerGetJobBob16
		XREF	ImmerBusStop3,ImmerSandUhr

		XREF	Job1Done
		XREF	Play8SVX,Blip

		XREF	Global,LKeuleGlobal,LBiene,FussGänger
		XREF	KopfGlobal,KopfBigGlobal
		XREF	LokGlobal,PlattGlobal
		XREF	DameGlobal,FliegerGlobal,GlobalKiss
		XREF	SchereGlobal,WeckerGlobal,Tropfen2,Tropfen3
		XREF	GlobalBall,SeifenGlobal,BuchGlobal,SeifeGlobal
		XREF	LKeuleGlobal2,SchereGlobal2,WeckerGlobal2
		XREF	BonusDameGlobal

		XREF	LampeGlobal,GlühLGlobal,KugelGlobal
		XREF	Tropfen3Global,BatManXGlobal,BatManGlobal,MouthGlobal
		XREF	KeuleGlobal,HamburgerGlobal,RöhreGlobal

		XREF	Lev4RedCar,Lev4BlueCar,Lev4SeifenBlase,Lev4Lampe
		XREF	Lev4Bobbel,Lev4Kugel3,Lev4Buch,Lev4RotBall,Lev4BlauBall
		XREF	Lev4Koffer,Lev4Hamburger,Lev4Wecker
		XREF	Lev4Flieger,Lev4Kopf,Lev4Röhre,Lev4KissMouth
		XREF	Lev4Schere,Lev4Tropfen3,Lev4BatMan,Lev4BatManX
		XREF	Lev4Mouth

		INCLUDE "myexec.i"
		INCLUDE	"drawbob.i"
		INCLUDE	"sfx.i"
		INCLUDE	"definitions.i"
		INCLUDE	"Gfx/Level4Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"


Level7BobTab:	dc.l	0			* Dummy
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
		dc.l	ImmerGetJobBob14
		dc.l	ImmerGetJobBob15
		dc.l	ImmerGetJobBob16
 		dc.l	ImmerBusStop3
 		dc.l	ImmerSandUhr

		dc.l	Lev4BatMan
		dc.l	Lev4Mouth
		dc.l	Lev7Keule
		dc.l	Lev7KeuleY
		dc.l	Lev4Flieger
		dc.l	Lev4RedCar
		dc.l	Lev4BlueCar
		dc.l	Lev4KissMouth
		dc.l	Lev4Kopf
		dc.l	Lev4Schere
		dc.l	Lev7SchereX
		dc.l	Lev4Wecker
		dc.l	Lev7WeckerY
		dc.l	Lev4Hamburger
		dc.l	Lev7Tropfen
		dc.l	Lev4RotBall
		dc.l	Lev4BlauBall
		dc.l	Lev4SeifenBlase
		dc.l	Lev4Buch
		dc.l	Lev7BuchY
		dc.l	Lev7AmigaBall
		dc.l	Lev7AmigaBallJ
		dc.l	Lev7AmigaBallX
		dc.l	Lev7Dame
		dc.l	Lev7Herr
		dc.l	Lev4Koffer
		dc.l	Lev4Röhre
		dc.l	Lev4Tropfen3
		dc.l	Lev7Dame1
		dc.l	Lev7Dame2
		dc.l	Lev7Herr1
		dc.l	Lev7Herr2
 		dc.l	Lev4BatManX
 		dc.l	Lev7Zeitung
 		dc.l	Lev7SeifenBlaseY
 		dc.l	Lev4Kugel3
 		dc.l	Lev7Kugel3Y
 		dc.l	Lev4Bobbel
 		dc.l	Lev7AmigaHupf
 		dc.l	Lev4Lampe
 		dc.l	Lev7HüpfClown
 		dc.l	Lev7SKugel

	STRUCTURE Level7bobStructure,0

		BYTE	Level7Dummy
		BYTE	Level7ShopBob
		BYTE	Level7CoinBob
		BYTE	Level7CubeBob1
		BYTE	Level7CubeBob2
		BYTE	Level7CubeBob3
		BYTE	Level7CubeBob4
		BYTE	Level7JumpBob
		BYTE	Level7CheeseBob
		BYTE	Level7BombBob
		BYTE	Level7MagnetoBob
		BYTE	Level7HonkBob
		BYTE	Level7BonusBob1
		BYTE	Level7BonusBob3
		BYTE	Level7FrageZeichen
		BYTE	Level7EmptyBob
		BYTE	Level7GetJobBob
		BYTE	Level7GetJobBob2
		BYTE	Level7GetJobBob3
		BYTE	Level7BusStop
		BYTE	Level7SandUhr

		BYTE	Level7BatMan
		BYTE	Level7Mouth
		BYTE	Level7Keule
		BYTE	Level7KeuleY
		BYTE	Level7Flieger
		BYTE	Level7RedCar
		BYTE	Level7BlueCar
		BYTE	Level7KissMouth
		BYTE	Level7Kopf
		BYTE	Level7Schere
		BYTE	Level7SchereX
		BYTE	Level7Wecker
		BYTE	Level7WeckerY
		BYTE	Level7Hamburger
		BYTE	Level7Tropfen
		BYTE	Level7RotBall
		BYTE	Level7BlauBall
		BYTE	Level7SeifenBlase
		BYTE	Level7Buch
		BYTE	Level7BuchY
		BYTE	Level7AmigaBall
		BYTE	Level7AmigaBallJ
		BYTE	Level7AmigaBallX
		BYTE	Level7Dame
		BYTE	Level7Herr
		BYTE	Level7Koffer
		BYTE	Level7Röhre
		BYTE	Level7Tropfen3
		BYTE	Level7Dame1
		BYTE	Level7Dame2
		BYTE	Level7Herr1
		BYTE	Level7Herr2
		BYTE	Level7BatManX
		BYTE	Level7Zeitung
		BYTE	Level7SeifenBlaseY
		BYTE	Level7Kugel3
		BYTE	Level7Kugel3Y
		BYTE	Level7Bobbel
		BYTE	Level7AmigaHupf
		BYTE	Level7Lampe
		BYTE	Level7HüpfClown
		BYTE	Level7SKugel

		SECTION	MyData,DATA

		SETBOB	-30000,0,0,0,0
EnemyList7:
		SETBOB	-217,29,0,Level7CubeBob1,Level7CubeBob1

		SETBOB	-180,61,0,Level7CubeBob2,Level7CubeBob2

;		SETBOB	0,175,0,Level7Herr2,Level7Herr2

		SETBOB	-33,74,0,Level7BuchY,Level7BuchY

		SETBOB	0, 24,0,Level7CoinBob,Level7CoinBob
		SETBOB	21,90,0,Level7CoinBob,Level7CoinBob
		SETBOB	62,109,0,Level7Röhre,Level7Röhre
		SETBOB	72,24,0,Level7CoinBob,Level7CoinBob

		SETBOB	111,71,0,Level7CoinBob,Level7CoinBob
		SETBOB	111,118,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	111,64,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	142,47,0,Level7AmigaBallX,Level7AmigaBallX
		SETBOB	155,104,0,Level7JumpBob,Level7JumpBob
		SETBOB	159,165,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	171,165,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	185,95,0,Level7CoinBob,Level7CoinBob

		SETBOB	312,175,0,Level7RedCar,Level7RedCar
		SETBOB	344,159,$FD00,Level7RotBall,Level7RotBall
		SETBOB	362,42,0,Level7CoinBob,Level7CoinBob
		SETBOB	376,124,$FD00,Level7RotBall,Level7RotBall

		SETBOB	407,95,$FD00,Level7RotBall,Level7RotBall
		SETBOB	445,175,0,Level7Koffer,Level7Koffer
		SETBOB	446,170,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	463,155,0,Level7WeckerY,Level7WeckerY
		SETBOB	497,170,0,Level7CoinBob,Level7CoinBob

		SETBOB	504,75,0,Level7Kugel3Y,Level7Kugel3Y
		SETBOB	566,98,0,Level7CubeBob3,Level7CubeBob3
		SETBOB	574,175,0,Level7KissMouth,Level7KissMouth
		SETBOB	599,124,0,Level7BonusBob1,Level7BonusBob1

		SETBOB	649,38,0,Level7CoinBob,Level7CoinBob

		SETBOB	712,79,0,Level7Lampe,Level7Lampe
		SETBOB	715,159,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	726,165,0,Level7HonkBob,Level7HonkBob
		SETBOB	760,25,0,Level7CoinBob,Level7CoinBob

		SETBOB	855,175,0,Level7HüpfClown,Level7HüpfClown
		SETBOB	886,105,0,Level7CoinBob,Level7CoinBob

		SETBOB	905,91,0,Level7Schere,Level7Schere
		SETBOB	937,122,0,Level7Schere,Level7Schere
		SETBOB	940,168,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	941,31,0,Level7RedCar,Level7RedCar
		SETBOB	968,152,0,Level7Schere,Level7Schere
		SETBOB	971,52,0,Level7CubeBob4,Level7CubeBob4

		SETBOB	1036,168,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	1069,126,0,Level7GetJobBob,Level7GetJobBob
		SETBOB	1075,168,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	1079,175,0,Level7Herr,Level7Herr
		SETBOB	1089,31,0,Level7BlueCar,Level7BlueCar
		SETBOB	1093,64,0,Level7CubeBob1,Level7CubeBob1

		SETBOB	1188,171,0,Level7BatMan,Level7BatMan

		SETBOB	1225,17,0,Level7CoinBob,Level7CoinBob
		SETBOB	1236,103,0,Level7BombBob,Level7BombBob
		SETBOB	1249,17,0,Level7CoinBob,Level7CoinBob
		SETBOB	1266,31+48,0,Level7RedCar,Level7RedCar
		SETBOB	1271,152,0,Level7AmigaBall,Level7AmigaBall
		SETBOB	1273,17,0,Level7CoinBob,Level7CoinBob
		SETBOB	1298,75,0,Level7CubeBob2,Level7CubeBob2

		SETBOB	1336,175,0,Level7Bobbel,Level7Bobbel
		SETBOB	1348,54,0,Level7Mouth,Level7Mouth
		SETBOB	1360,175,0,Level7KissMouth,Level7KissMouth
		SETBOB	1372,104,0,Level7CoinBob,Level7CoinBob
		SETBOB	1393,143,0,Level7Hamburger,Level7Hamburger

		SETBOB	1447,99,0,Level7CubeBob3,Level7CubeBob3
		SETBOB	1498,140,0,Level7BonusBob3,Level7BonusBob3

		SETBOB	1522,22,0,Level7CubeBob4,Level7CubeBob4
		SETBOB	1556,105,0,Level7SeifenBlaseY,Level7SeifenBlaseY
		SETBOB	1558,72,0,Level7EmptyBob,Level7EmptyBob

		SETBOB	1627,72,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	1638,106,0,Level7BuchY,Level7BuchY
		SETBOB	1690,168,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	1699,72,0,Level7EmptyBob,Level7EmptyBob

		SETBOB	1712,62,0,Level7Kugel3,Level7Kugel3
		SETBOB	1720,12,0,Level7CubeBob1,Level7CubeBob1
		SETBOB	1720,103,0,Level7Röhre,Level7Röhre

		SETBOB	1815,79,$FD00,Level7BlauBall,Level7BlauBall
		SETBOB	1844,111,$FD00,Level7BlauBall,Level7BlauBall
		SETBOB	1849,39,0,Level7CoinBob,Level7CoinBob
		SETBOB	1849,72,0,Level7CoinBob,Level7CoinBob
		SETBOB	1849,105,0,Level7CoinBob,Level7CoinBob

		SETBOB	1914,36,0,Level7Keule,Level7Keule
		SETBOB	1914,71,0,Level7Keule,Level7Keule
		SETBOB	1914,102,0,Level7Keule,Level7Keule
		SETBOB	1935,74,0,Level7CheeseBob,Level7CheeseBob

		SETBOB	2080,79,0,Level7CoinBob,Level7CoinBob
		SETBOB	2080,97,0,Level7CoinBob,Level7CoinBob

		SETBOB	2145,61,0,Level7Tropfen,Level7Tropfen
		SETBOB	2160,92,0,Level7CoinBob,Level7CoinBob
		SETBOB	2175,61,0,Level7Tropfen,Level7Tropfen

		SETBOB	2202,46,0,Level7CubeBob2,Level7CubeBob2
		SETBOB	2205,61,0,Level7Tropfen,Level7Tropfen
		SETBOB	2208,152,0,Level7SchereX,Level7SchereX
		SETBOB	2214,31,0,Level7BlueCar,Level7BlueCar
		SETBOB	2235,61,0,Level7Tropfen,Level7Tropfen
		SETBOB	2237,70,0,Level7BatMan,Level7BatMan
		SETBOB	2239,159,0,Level7Wecker,Level7Wecker
		SETBOB	2248,92,0,Level7CoinBob,Level7CoinBob
		SETBOB	2265,61,0,Level7Tropfen,Level7Tropfen
		SETBOB	2295,61,0,Level7Tropfen,Level7Tropfen

		SETBOB	2325,61,0,Level7Tropfen,Level7Tropfen
		SETBOB	2355,61,0,Level7Tropfen,Level7Tropfen
		SETBOB	2380,146,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	2385,61,0,Level7Tropfen,Level7Tropfen

		SETBOB	2404,146,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	2430,146,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	2445,61,0,Level7Tropfen,Level7Tropfen
		SETBOB	2498,102,0,Level7CoinBob,Level7CoinBob

		SETBOB	2552,104,0,Level7CubeBob3,Level7CubeBob3
		SETBOB	2578,32,0,Level7Röhre,Level7Röhre

		SETBOB	2600,143,$FD00,Level7AmigaBallJ,Level7AmigaBallJ
		SETBOB	2632,111,$FE00,Level7AmigaBallJ,Level7AmigaBallJ
		SETBOB	2674,51,0,Level7SeifenBlase,Level7SeifenBlase
		SETBOB	2680,106,0,Level7CoinBob,Level7CoinBob

		SETBOB	2750,104,0,Level7CoinBob,Level7CoinBob
		SETBOB	2773,58,0,Level7Mouth,Level7Mouth
		SETBOB	2780,63,0,Level7RedCar,Level7RedCar

		SETBOB	2800,111,0,Level7Koffer,Level7Koffer
		SETBOB	2815,136,0,Level7CubeBob4,Level7CubeBob4
		SETBOB	2883,175,0,Level7SKugel,Level7SKugel

		SETBOB	2914,82,0,Level7FrageZeichen,Level7FrageZeichen

		SETBOB	3012,19,0,Level7CoinBob,Level7CoinBob
		SETBOB	3025,175,0,Level7KissMouth,Level7KissMouth
		SETBOB	3034,73,0,Level7MagnetoBob,Level7MagnetoBob
		SETBOB	3043,83,0,Level7CoinBob,Level7CoinBob
		SETBOB	3060,47,$FD00,Level7BlauBall,Level7BlauBall

		SETBOB	3157,83,0,Level7SandUhr,Level7SandUhr

		SETBOB	3202,29,0,Level7CubeBob1,Level7CubeBob1
		SETBOB	3219,95,0,Level7HüpfClown,Level7HüpfClown
		SETBOB	3229,175,0,Level7Lampe,Level7Lampe
		SETBOB	3257,29,0,Level7CubeBob2,Level7CubeBob2
		SETBOB	3265,146,0,Level7BonusBob1,Level7BonusBob1

		SETBOB	3316,162,0,Level7Zeitung,Level7Zeitung
		SETBOB	3331,166,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	3343,162,0,Level7Zeitung,Level7Zeitung

		SETBOB	3412,100,0,Level7Wecker,Level7Wecker
		SETBOB	3413,175,0,Level7Bobbel,Level7Bobbel
		SETBOB	3488,159,0,Level7FrageZeichen,Level7FrageZeichen

		SETBOB	3600,102,0,Level7CoinBob,Level7CoinBob
		SETBOB	3640,166,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	3655,63,$FD00,Level7BlauBall,Level7BlauBall
		SETBOB	3655,111,$FE00,Level7BlauBall,Level7BlauBall
		SETBOB	3655,159,$FD00,Level7BlauBall,Level7BlauBall
		SETBOB	3666,153,0,Level7AmigaBall,Level7AmigaBall
		SETBOB	3686,18,0,Level7CubeBob3,Level7CubeBob3
		SETBOB	3696,135,0,Level7AmigaBall,Level7AmigaBall

		SETBOB	3750,166,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	3770,175,0,Level7Dame1,Level7Dame1
		SETBOB	3778,135,0,Level7SeifenBlase,Level7SeifenBlase

		SETBOB	3800,35,0,Level7HonkBob,Level7HonkBob
		SETBOB	3811,135,0,Level7SeifenBlase,Level7SeifenBlase
		SETBOB	3877,175,0,Level7HüpfClown,Level7HüpfClown
		SETBOB	3879,166,0,Level7EmptyBob,Level7EmptyBob

		SETBOB	3908,135,0,Level7Mouth,Level7Mouth
		SETBOB	3938,135,0,Level7Mouth,Level7Mouth
		SETBOB	3952,11,0,Level7CubeBob4,Level7CubeBob4
		SETBOB	3968,135,0,Level7Mouth,Level7Mouth

		SETBOB	4014,123,0,Level7BuchY,Level7BuchY
		SETBOB	4047,54,0,Level7CoinBob,Level7CoinBob
		SETBOB	4047,71,0,Level7CoinBob,Level7CoinBob
		SETBOB	4047,91,0,Level7CoinBob,Level7CoinBob

		SETBOB	4106,155,0,Level7BatManX,Level7BatManX
		SETBOB	4188,81,0,Level7CoinBob,Level7CoinBob

		SETBOB	4207,175,0,Level7GetJobBob2,Level7GetJobBob2
		SETBOB	4218,35,0,Level7CubeBob1,Level7CubeBob1
		SETBOB	4278,47,0,Level7Koffer,Level7Koffer

		SETBOB	4300,127,0,Level7BlueCar,Level7BlueCar
		SETBOB	4300,90,0,Level7SchereX,Level7SchereX
		SETBOB	4357,169,0,Level7FrageZeichen,Level7FrageZeichen

		SETBOB	4422,27,0,Level7CubeBob2,Level7CubeBob2
		SETBOB	4481,95,0,Level7Herr1,Level7Herr1
		SETBOB	4494,81,0,Level7KeuleY,Level7KeuleY

		SETBOB	4550,81,0,Level7KeuleY,Level7KeuleY

		SETBOB	4600,81,0,Level7KeuleY,Level7KeuleY
		SETBOB	4608,87,0,Level7EmptyBob,Level7EmptyBob
;		SETBOB	4622,134,0,Level7Flieger,Level7Flieger
		SETBOB	4622,168,0,Level7Flieger,Level7Flieger
		SETBOB	4650,81,0,Level7KeuleY,Level7KeuleY
		SETBOB	4680,134,0,Level7Flieger,Level7Flieger
;		SETBOB	4680,168,0,Level7Flieger,Level7Flieger
		SETBOB	4689,87,0,Level7EmptyBob,Level7EmptyBob

		SETBOB	4700,81,0,Level7KeuleY,Level7KeuleY
		SETBOB	4750,81,0,Level7KeuleY,Level7KeuleY
		SETBOB	4760,134,0,Level7Flieger,Level7Flieger
;		SETBOB	4760,168,0,Level7Flieger,Level7Flieger

		SETBOB	4800,81,0,Level7KeuleY,Level7KeuleY
		SETBOB	4846,10,0,Level7CubeBob4,Level7CubeBob4
		SETBOB	4860,134,0,Level7Flieger,Level7Flieger
		SETBOB	4860,168,0,Level7Flieger,Level7Flieger

		SETBOB	4926,127,0,Level7KissMouth,Level7KissMouth
		SETBOB	4967,82,0,Level7CubeBob3,Level7CubeBob3
		SETBOB	4967,175,0,Level7KissMouth,Level7KissMouth

		SETBOB	5010,63,0,Level7Bobbel,Level7Bobbel
		SETBOB	5032,117,0,Level7AmigaBallX,Level7AmigaBallX

		SETBOB	5145,24,0,Level7CoinBob,Level7CoinBob
		SETBOB	5187,94,0,Level7BonusBob3,Level7BonusBob3

		SETBOB	5391,83,0,Level7CoinBob,Level7CoinBob

		SETBOB	5414,63,0,Level7Lampe,Level7Lampe

		SETBOB	5500,91,0,Level7Kugel3,Level7Kugel3
		SETBOB	5544,10,0,Level7CubeBob1,Level7CubeBob1
		SETBOB	5557,87,0,Level7BonusBob1,Level7BonusBob1

		SETBOB	5650,100,0,Level7Mouth,Level7Mouth
		SETBOB	5684,171,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	5690,156,0,Level7Schere,Level7Schere

		SETBOB	5723,130,0,Level7CoinBob,Level7CoinBob
		SETBOB	5732,86,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	5774,86,0,Level7EmptyBob,Level7EmptyBob

		SETBOB	5828,115,0,Level7CubeBob3,Level7CubeBob3
		SETBOB	5830,26,0,Level7Buch,Level7Buch
		SETBOB	5858,86,0,Level7EmptyBob,Level7EmptyBob

		SETBOB	5905,16,0,Level7JumpBob,Level7JumpBob
		SETBOB	5927,134,0,Level7BatManX,Level7BatManX
		SETBOB	5930,121,0,Level7EmptyBob,Level7EmptyBob
		SETBOB	5933,31,$FD00,Level7BlauBall,Level7BlauBall
		SETBOB	5942,83,0,Level7FrageZeichen,Level7FrageZeichen
		SETBOB	5960,121,0,Level7EmptyBob,Level7EmptyBob

		SETBOB	6000,70,0,Level7Mouth,Level7Mouth
		SETBOB	6077,96,0,Level7CoinBob,Level7CoinBob
		SETBOB	6080,31,$FE00,Level7RotBall,Level7RotBall

		SETBOB	6112,134,0,Level7GetJobBob3,Level7GetJobBob3
		SETBOB	6120,10,0,Level7CubeBob2,Level7CubeBob2
		SETBOB	6142,175,0,Level7Herr,Level7Herr
		SETBOB	6180,34,0,Level7CubeBob1,Level7CubeBob1
		SETBOB	6187,135,0,Level7SandUhr,Level7SandUhr

		SETBOB	6275,74,0,Level7CoinBob,Level7CoinBob

		SETBOB	6305,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6320,74,0,Level7CoinBob,Level7CoinBob
		SETBOB	6335,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6342,14,0,Level7CubeBob4,Level7CubeBob4
		SETBOB	6365,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6395,29,0,Level7Tropfen,Level7Tropfen

		SETBOB	6400,76,0,Level7SchereX,Level7SchereX
		SETBOB	6425,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6441,108,0,Level7SchereX,Level7SchereX
		SETBOB	6452,52,0,Level7CoinBob,Level7CoinBob
		SETBOB	6455,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6485,29,0,Level7Tropfen,Level7Tropfen

		SETBOB	6515,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6545,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6575,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6580,175,0,Level7HüpfClown,Level7HüpfClown

		SETBOB	6605,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6635,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6665,29,0,Level7Tropfen,Level7Tropfen
		SETBOB	6693,175,0,Level7Dame2,Level7Dame2
		SETBOB	6698,166,0,Level7CoinBob,Level7CoinBob

		SETBOB	6866,160,0,Level7AmigaBall,Level7AmigaBall

		SETBOB	6914,160,0,Level7AmigaBall,Level7AmigaBall
		SETBOB	6919,119,0,Level7Wecker,Level7Wecker

		SETBOB	7136,175,0,Level7Herr2,Level7Herr2
		SETBOB	7136,83,0,Level7BusStop,Level7BusStop

		SETBOB	30000,0,0,0,0

****************************************************************************

Lev7SKugel:	SETDATA		Level4Bob53,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		2$
		SETANIMSPEED	4
		GOTO		Lev4Global

1$:		ANIMTO		0,5
		ANIMTO		4,0
		LOOP

2$:		LEFT		25
		RIGHT		25
		LOOP

****************************************************************************

Lev7HüpfClown:	SETDATA		Level4Bob180,WonderVars+BobBase
		GOTO		GlobalClown

****************************************************************************

Lev7Kugel3Y:	SETDATA		Level4Bob73,WonderVars+BobBase
		SETMOVE		1$
		GOTO		KugelGlobal

1$:		UP		20
		DOWN		20
		LOOP

****************************************************************************

Lev7Zeitung:	SETDATA		Level4Bob38,WonderVars+BobBase
		SETMOVE		1$
		GOTO		ZeitungGlobal2

1$:		UP		140
		DOWN		140
		LOOP

****************************************************************************

Lev7Keule:	SETDATA		Level4Bob158,WonderVars+BobBase
		SETUSERDATA	$02000000
		SETMOVE		1$
		SETANIM		BuchAnim
		GOTO		LKeuleGlobal2

1$:		LEFT		60
		RIGHT		60
		LOOP


Lev7KeuleY:	SETDATA		Level4Bob158,WonderVars+BobBase
		SETUSERDATA	$02000000
		SETMOVE		Move35
		SETANIM		BuchAnim
		GOTO		LKeuleGlobal2

Move35:		UP		35
		DOWN		35
		LOOP

BuchAnim:	ANIMTO		0,7
		LOOP

********************************************************************************

Lev7SchereX:	SETDATA		Level4Bob2,WonderVars+BobBase
		SETMOVE		1$
		GOTO		SchereGlobal2

1$:		LEFT		30
		RIGHT		30
		LOOP

********************************************************************************

Lev7WeckerY:	SETDATA		Level4Bob1,WonderVars+BobBase
		SETMOVE		Move35
		GOTO		WeckerGlobal2

********************************************************************************

Lev7Tropfen:	SETDATA		Level4Bob4,WonderVars+BobBase
		GOTO		Tropfen2

********************************************************************************

Lev7SeifenBlaseY:
		SETDATA		Level4Bob50,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		Move25
		GOTO		SeifeGlobal
	
1$:		ANIMTO		0,2
		LOOP

Move25:		UP		25
		DOWN		25
		LOOP

********************************************************************************

Lev7BuchY:	SETDATA		Level4Bob127,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		Move25
		SETMOVESTEP	2
		SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE
		GOTO		LBiene

1$:		ANIMTO		0,7
		LOOP

********************************************************************************

Lev7AmigaHupf:	SETDATA		Level4Bob135,WonderVars+BobBase
		GOTO		GlobalBall

********************************************************************************

Lev7AmigaBall:	SETDATA		Level4Bob135,WonderVars+BobBase
		SETMOVE		1$
		GOTO		AmigaGlobal

1$:		UP		20
		DOWN		20
		LOOP

Lev7AmigaBallX:	SETDATA		Level4Bob135,WonderVars+BobBase
		SETMOVE		1$
		GOTO		AmigaGlobal

1$:		LEFT		30
		RIGHT		30
		LOOP

Lev7AmigaBallJ:	SETDATA		Level4Bob135,WonderVars+BobBase
		GOTO		GlobalBall

********************************************************************************

Lev7Dame:	SETDATA		Level4Bob7,WonderVars+BobBase
		GOTO		DameGlobal

****************************************************************************

Lev7Dame1:	SETDATA		Level4Bob7,WonderVars+BobBase
		SETID		LADY1_ID
		GOTO		GlobalJob

****************************************************************************

Lev7Dame2:	SETDATA		Level4Bob7,WonderVars+BobBase
		SETID		LADY2_ID
		GOTO		GlobalJob

****************************************************************************

Lev7Herr:	SETDATA		Level4Bob19,WonderVars+BobBase
		GOTO		BonusDameGlobal

****************************************************************************

Lev7Herr1:	SETDATA		Level4Bob19,WonderVars+BobBase
		SETID		HERR1_ID
GlobalJob:	SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	Job1Done
		GOTO		DameGlobal

Lev7Herr2:	SETDATA		Level4Bob19,WonderVars+BobBase
		SETMEMASK	RONNY_COLL
		SETCOLLHANDLER	GameEnd
		GOTO		DameGlobal

****************************************************************************
