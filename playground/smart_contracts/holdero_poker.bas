/// dReam Tables Holdero Poker Contract v1.0.0
Function InitializePrivate() Uint64
10 IF EXISTS("owner:") == 0 THEN GOTO 30
20 RETURN 1
30 STORE("owner:", SIGNER())
40 STORE("Deck Count:", 52)
50 STORE("Player:", 0)
60 STORE("New", 1)
70 STORE("V:", 100)
80 shuffleDeck()
90 RETURN 0
End Function

Function clearTable() Uint64
10 DIM i as Uint64
20 LET i = LOAD("OBF")
30 DELETE(SHA256(ITOA(i*i*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3)))
40 LET i = i +1
50 IF i < 1+LOAD("OBF")+52 THEN GOTO 30
60 RETURN 0
End Function

Function shuffleDeck() Uint64
5 IF EXISTS("New") THEN GOTO 30 ELSE GOTO 10
10 IF LOAD("owner:") == SIGNER() THEN GOTO 20
15 RETURN 1
20 clearTable()
30 STORE("Deck Count:", 52)
40 IF EXISTS("New") THEN GOTO 330
50 DELETE("End")
60 DELETE("Bet")
70 DELETE("Wager:")
80 DELETE("Raised:")
90 takeBackCards(1)
100 takeBackCards(2)
110 takeBackCards(3)
120 takeBackCards(4)
130 takeBackCards(5)
140 takeBackCards(6)
150 IF EXISTS("1SO") THEN GOTO 170
160 DELETE("1F")
170 IF EXISTS("2SO") THEN GOTO 190
180 DELETE("2F")
190 IF EXISTS("3SO") THEN GOTO 210
200 DELETE("3F")
210 IF EXISTS("4SO") THEN GOTO 230
220 DELETE("4F")
230 IF EXISTS("5SO") THEN GOTO 250
240 DELETE("5F")
250 IF EXISTS("0SO") THEN GOTO 270
260 DELETE("0F")
270 STORE("Player:", LOAD("Dealer:")+1)
280 STORE("Dealer:", LOAD("Dealer:")+1)
290 IF LOAD("Player:") == LOAD("Seats at Table:") THEN GOTO 300 ELSE GOTO 320
300 STORE("Player:", 0)
310 STORE("Dealer:", 0)
320 IF EXISTS(ITOA(LOAD("Player:"))+"SO") THEN GOTO 270
330 STORE("Counter:", 1)
340 DELETE("New")
350 DELETE("W")
360 STORE("Pot:", 0)
370 STORE("IV", 1+ RANDOM(99999))
380 STORE("OBF", 1+ RANDOM(9999999))
390 DELETE("Flop")
400 DELETE("Turn")
410 DELETE("River")
420 DELETE("FlopCard1")
430 DELETE("FlopCard2")
440 DELETE("FlopCard3")
450 DELETE("TurnCard")
460 DELETE("RiverCard")
470 DELETE("Reveal")
480 STORE("HandSeed", SHA256(ITOA(9999999)))
490 RETURN 0
End Function

Function takeBackCards(playerNumber Uint64) Uint64
10 DELETE(("Player")+ITOA(playerNumber)+("card1"))
20 DELETE(("Player")+ITOA(playerNumber)+("card2"))
30 DELETE("Player"+ITOA(playerNumber)+"Key")
40 RETURN 0
End Function

Function Winner(whoWon String) Uint64
10 IF LOAD("owner:") == SIGNER() THEN GOTO 30
20 RETURN 1
30 SEND_DERO_TO_ADDRESS(LOAD("owner:"), (150*LOAD("Pot:")/10000))  /// 1.5% rake for owner
40 SEND_DERO_TO_ADDRESS(LOAD(whoWon), (9850*LOAD("Pot:")/10000)) /// winner takes 98.5% of pot
50 shuffleDeck()
60 RETURN 0
End Function

Function SplitWinner(div Uint64, split1 String, split2 String, split3 String, split4 String, split5 String, split6 String) Uint64
10 IF LOAD("owner:") == SIGNER() THEN GOTO 80
20 RETURN 1
80 IF div == 2 THEN GOTO 150
90 IF div == 3 THEN GOTO 200
100 IF div == 4 THEN GOTO 270
110 IF div == 5 THEN GOTO 350
120 IF div == 6 THEN GOTO 430
130 RETURN 1
150 SEND_DERO_TO_ADDRESS(LOAD(split1), (LOAD("Pot:")/div))
160 SEND_DERO_TO_ADDRESS(LOAD(split2), (LOAD("Pot:")/div))
165 SEND_DERO_TO_ADDRESS(LOAD("owner:"), (LOAD("Pot:")%div))
170 shuffleDeck()
180 RETURN 0
200 SEND_DERO_TO_ADDRESS(LOAD(split1), (LOAD("Pot:")/div))
210 SEND_DERO_TO_ADDRESS(LOAD(split2), (LOAD("Pot:")/div))
220 SEND_DERO_TO_ADDRESS(LOAD(split3), (LOAD("Pot:")/div))
230 SEND_DERO_TO_ADDRESS(LOAD("owner:"), (LOAD("Pot:")%div))  /// remainder to 0 pot
240 shuffleDeck()
250 RETURN 0
270 SEND_DERO_TO_ADDRESS(LOAD(split1), (LOAD("Pot:")/div))
280 SEND_DERO_TO_ADDRESS(LOAD(split2), (LOAD("Pot:")/div))
290 SEND_DERO_TO_ADDRESS(LOAD(split3), (LOAD("Pot:")/div))
300 SEND_DERO_TO_ADDRESS(LOAD(split4), (LOAD("Pot:")/div))
310 SEND_DERO_TO_ADDRESS(LOAD("owner:"), (LOAD("Pot:")%div))
320 shuffleDeck()
330 RETURN 0
350 SEND_DERO_TO_ADDRESS(LOAD(split1), (LOAD("Pot:")/div))
360 SEND_DERO_TO_ADDRESS(LOAD(split2), (LOAD("Pot:")/div))
370 SEND_DERO_TO_ADDRESS(LOAD(split3), (LOAD("Pot:")/div))
380 SEND_DERO_TO_ADDRESS(LOAD(split4), (LOAD("Pot:")/div))
390 SEND_DERO_TO_ADDRESS(LOAD(split5), (LOAD("Pot:")/div))
395 SEND_DERO_TO_ADDRESS(LOAD("owner:"), (LOAD("Pot:")%div))
400 shuffleDeck()
410 RETURN 0
430 SEND_DERO_TO_ADDRESS(LOAD(split1), (LOAD("Pot:")/div))
440 SEND_DERO_TO_ADDRESS(LOAD(split2), (LOAD("Pot:")/div))
450 SEND_DERO_TO_ADDRESS(LOAD(split3), (LOAD("Pot:")/div))
460 SEND_DERO_TO_ADDRESS(LOAD(split4), (LOAD("Pot:")/div))
470 SEND_DERO_TO_ADDRESS(LOAD(split5), (LOAD("Pot:")/div))
480 SEND_DERO_TO_ADDRESS(LOAD(split6), (LOAD("Pot:")/div))
490 SEND_DERO_TO_ADDRESS(LOAD("owner:"), (LOAD("Pot:")%div))
500 shuffleDeck()
510 RETURN 0
End Function

Function SetTable(seats Uint64, ante Uint64, bigBlind Uint64, smallBlind Uint64, address String) Uint64
10 IF LOAD("owner:") == SIGNER() THEN GOTO 30
20 RETURN 1
30 IF seats == 1 THEN GOTO 160
35 IF EXISTS("Seats at Table:") THEN GOTO 20
40 STORE("Seats at Table:", seats)
50 IF LOAD("Seats at Table:") > 6 THEN GOTO 20
60 STORE("Ante:", ante)
65 STORE("BB:", bigBlind)
66 STORE("SB:", smallBlind)
70 STORE("Player:", LOAD("Player:")+1)
80 STORE(("Player")+ITOA(LOAD("Player:")), SIGNER())
90 STORE(("Player")+ITOA(LOAD("Player:"))+(" ID:"), HEXDECODE(address))
100 STORE("Counter:", 1)
110 STORE("Pot:", 0)
120 STORE("IV", 1+ RANDOM(99999))
130 STORE("Dealer:", 0)
140 STORE("OBF", 1+ RANDOM(9999999))
150 STORE("HandSeed", SHA256(ITOA(9999999)))
155 RETURN 0
160 clearTable()
170 DELETE("Player1")
180 DELETE("Player2")
190 DELETE("Player3")
200 DELETE("Player4")
210 DELETE("Player5")
220 DELETE("Player6")
230 DELETE("Player1 ID:")
240 DELETE("Player2 ID:")
250 DELETE("Player3 ID:")
260 DELETE("Player4 ID:")
270 DELETE("Player4 ID:")
280 DELETE("Player5 ID:")
290 DELETE("Player6 ID:")
300 DELETE("Seats at Table:")
310 DELETE("Ante:")
320 DELETE("GameKey:")
330 STORE("Player:", 0)
340 DELETE("Full")
350 DELETE("IV")
360 DELETE("Open")
370 takeBackCards(1)
380 takeBackCards(2)
390 takeBackCards(3)
400 takeBackCards(4)
410 takeBackCards(5)
420 takeBackCards(6)
430 DELETE("0F")
440 DELETE("1F")
450 DELETE("2F")
460 DELETE("3F")
470 DELETE("4F")
480 DELETE("5F")
490 DELETE("0SO")
500 DELETE("1SO")
510 DELETE("2SO")
520 DELETE("3SO")
530 DELETE("4SO")
540 DELETE("5SO")
550 DELETE("Dealer:")
560 DELETE("OBF")
570 DELETE("W")
580 DELETE("Bet")
590 DELETE("Wager:")
600 DELETE("Raised:")
610 DELETE("End")
620 STORE("Pot:", 0)
630 STORE("Deck Count:", 52)
640 DELETE("HandSeed")
650 DELETE("Flop")
660 DELETE("Turn")
670 DELETE("River")
680 DELETE("FlopCard1")
690 DELETE("FlopCard2")
700 DELETE("FlopCard3")
710 DELETE("TurnCard")
720 DELETE("RiverCard")
730 DELETE("Reveal")
740 DELETE("BB:")
750 DELETE("SB:")
760 DELETE("Face:")
770 DELETE("Back:")
780 RETURN 0
End Function

Function PlayerEntry(address String) Uint64
10 IF LOAD("Player:") == LOAD("Seats at Table:") THEN GOTO 150
20 IF EXISTS("Full") THEN GOTO 150
30 IF LOAD("owner:") == SIGNER() THEN GOTO 130
40 IF EXISTS("Open") THEN GOTO 160
50 IF LOAD("Player:") == 0 THEN GOTO 145
60 STORE("Player:", LOAD("Player:")+1)
70 STORE(("Player")+ITOA(LOAD("Player:")), SIGNER())
80 STORE(("Player")+ITOA(LOAD("Player:"))+(" ID:"), HEXDECODE(address))
90 IF LOAD("Player:") == LOAD("Seats at Table:") THEN GOTO 110
100 RETURN 0
110 STORE("Full", 1)
120 RETURN 0
130 DELETE("0SO")
135 STORE("Open", LOAD("Open")-1)
136 IF LOAD("Open") == 0 THEN GOTO 260
140 RETURN 0
145 IF EXISTS("Open") THEN GOTO 160
150 RETURN 1
160 MAPSTORE("checkSeats", 0)
170 MAPSTORE("checkSeats", MAPGET("checkSeats")+1)
180 IF MAPGET("checkSeats") >= 7 THEN GOTO 150
190 IF EXISTS(("Player")+ITOA(MAPGET("checkSeats"))+(" ID:")) THEN GOTO 170
200 STORE(("Player")+ITOA(MAPGET("checkSeats")), SIGNER())
210 STORE(("Player")+ITOA(MAPGET("checkSeats"))+(" ID:"), HEXDECODE(address))
220 STORE("Open", LOAD("Open")-1)
230 DELETE(ITOA(MAPGET("checkSeats")-1)+"SO")
240 IF LOAD("Open") == 0 THEN GOTO 260
250 RETURN 0
260 DELETE("Open")
270 STORE("Full", 1)
280 RETURN 0
End Function

Function PlayerLeave(id Uint64) Uint64
10 IF EXISTS("Bet") THEN GOTO 280
30 IF playerCheck() THEN GOTO 40 ELSE GOTO 280
40 STORE(ITOA(id-1)+"F", 1)
50 STORE(ITOA(id-1)+"SO", 1)
60 IF LOAD("owner:") == SIGNER() THEN GOTO 90
70 STORE(("Player")+ITOA(id), "Out")
80 DELETE(("Player")+ITOA(id)+(" ID:"))
90 DELETE("Full")
100 takeBackCards(id)
110 clock()
120 foldedLoop()
130 IF playerLoop() THEN GOTO 140 ELSE GOTO 160
140 STORE("Player:", 0)
150 foldedLoop()
160 IF counterLoop() THEN GOTO 170 ELSE GOTO 220
170 STORE("Counter:", 1)
180 STORE("Bet", 1)
220 IF EXISTS("Open") THEN GOTO 260
230 STORE("Open", 1)
250 RETURN 0
260 STORE("Open", LOAD("Open")+1)
270 RETURN 0
280 RETURN 1
End Function

Function clock() Uint64
10 STORE("Player:", LOAD("Player:")+1)
20 STORE("Counter:", LOAD("Counter:")+1)
30 IF EXISTS("W") THEN GOTO 40 ELSE GOTO 50
40 STORE("W", LOAD("W")+1)
50 RETURN 0
End Function

Function playerLoop() Uint64
10 IF LOAD("Player:") == LOAD("Seats at Table:") THEN GOTO 30
20 RETURN 0
30 RETURN 1
End Function

Function counterLoop() Uint64
10 IF LOAD("Counter:") > LOAD("Seats at Table:") THEN GOTO 30
20 RETURN 0
30 RETURN 1
End Function

Function foldedLoop() Uint64
10 folded()
20 folded()
30 folded()
40 folded()
50 folded()
60 RETURN 0
End Function

Function folded() Uint64
10 IF LOAD("Player:") == 0 THEN GOTO 20 ELSE GOTO 50
20 IF EXISTS("0F") THEN GOTO 30 ELSE GOTO 40
30 clock()
40 RETURN 0
50 IF LOAD("Player:") == 1 THEN GOTO 60 ELSE GOTO 90
60 IF EXISTS("1F") THEN GOTO 70 ELSE GOTO 80
70 clock()
80 RETURN 0
90 IF LOAD("Player:") == 2 THEN GOTO 100 ELSE GOTO 130
100 IF EXISTS("2F") THEN GOTO 110 ELSE GOTO 120
110 clock()
120 RETURN 0
130 IF LOAD("Player:") == 3 THEN GOTO 140 ELSE GOTO 170
140 IF EXISTS("3F") THEN GOTO 150 ELSE GOTO 160
150 clock()
160 RETURN 0
170 IF LOAD("Player:") == 4 THEN GOTO 180 ELSE GOTO 210
180 IF EXISTS("4F") THEN GOTO 190 ELSE GOTO 200
190 clock()
200 RETURN 0
210 IF LOAD("Player:") == 5 THEN GOTO 220 ELSE GOTO 250
220 IF EXISTS("5F") THEN GOTO 230 ELSE GOTO 200
230 clock()
240 RETURN 0
250 RETURN 1
End Function

Function playerCheck() Uint64
5 IF LOAD("Player:") == LOAD("Seats at Table:") THEN GOTO 6 ELSE GOTO 10
6 STORE("Player:", 0)
10 IF LOAD("Player:") == 0 THEN GOTO 20 ELSE GOTO 30
20 IF SIGNER() == LOAD("Player1") THEN GOTO 150 ELSE GOTO 200
30 IF LOAD("Player:") == 1 THEN GOTO 40 ELSE GOTO 50
40 IF SIGNER() == LOAD("Player2") THEN GOTO 150 ELSE GOTO 200
50 IF LOAD("Player:") == 2 THEN GOTO 60 ELSE GOTO 70
60 IF SIGNER() == LOAD("Player3") THEN GOTO 150 ELSE GOTO 200
70 IF LOAD("Player:") == 3 THEN GOTO 80 ELSE GOTO 90
80 IF SIGNER() == LOAD("Player4") THEN GOTO 150 ELSE GOTO 200
90 IF LOAD("Player:") == 4 THEN GOTO 100 ELSE GOTO 110
100 IF SIGNER() == LOAD("Player5") THEN GOTO 150 ELSE GOTO 200
110 IF LOAD("Player:") == 5 THEN GOTO 120 ELSE GOTO 200
120 IF SIGNER() == LOAD("Player6") THEN GOTO 150 ELSE GOTO 200
150 RETURN 1
200 RETURN 0
End Function

Function dealFunc(pcSeed String) Uint64
10 doubleCard(pcSeed)
20 foldedLoop()
30 STORE("Pot:", LOAD("Pot:")+DEROVALUE())
40 IF playerLoop() THEN GOTO 70
50 IF counterLoop() THEN GOTO 110
60 RETURN 0
70 STORE("Player:", 0)
80 foldedLoop()
90 IF counterLoop() THEN GOTO 110
100 RETURN 0
110 STORE("Bet", 1)
120 STORE("Counter:", 1)
130 RETURN 0
End Function

Function DealHand(pcSeed String) Uint64
4 IF EXISTS("Reveal") THEN GOTO 600
5 IF EXISTS("Flop") THEN GOTO 600
10 IF EXISTS("Turn") THEN GOTO 600
20 IF EXISTS("River") THEN GOTO 600
30 IF EXISTS("Bet") THEN GOTO 600
40 IF playerCheck() THEN GOTO 50 ELSE GOTO 600
50 IF LOAD("Pot:") == 0 THEN GOTO 60 ELSE GOTO 90
60 IF DEROVALUE() == LOAD("Ante:")+LOAD("SB:") THEN GOTO 70 ELSE GOTO 600
70 dealFunc(pcSeed)
80 RETURN 0
90 IF LOAD("Pot:") == LOAD("Ante:")+LOAD("SB:") THEN GOTO 100 ELSE GOTO 130
100 IF DEROVALUE() == LOAD("Ante:")+LOAD("BB:") THEN GOTO 110 ELSE GOTO 600
110 dealFunc(pcSeed)
120 RETURN 0
130 IF DEROVALUE() == LOAD("Ante:") THEN GOTO 140 ELSE GOTO 600
140 dealFunc(pcSeed)
150 RETURN 0
600 RETURN 1
End Function

Function flop() Uint64
10 DIM flopCardOne, flopCardTwo, flopCardThree as Uint64
20 LET flopCardOne = 1+LOAD("OBF")+ RANDOM(52)
30 IF EXISTS(SHA256(ITOA(flopCardOne*flopCardOne*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3))) THEN GOTO 20
40 STORE(SHA256(ITOA(flopCardOne*flopCardOne*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3)), flopCardOne/LOAD("IV"))
50 STORE("FlopCard1", flopCardOne-LOAD("OBF"))
60 LET flopCardTwo = 1+LOAD("OBF")+ RANDOM(52)
70 IF EXISTS(SHA256(ITOA(flopCardTwo*flopCardTwo*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3))) THEN GOTO 60
80 STORE(SHA256(ITOA(flopCardTwo*flopCardTwo*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3)), flopCardTwo/LOAD("IV"))
90 STORE("FlopCard2", flopCardTwo-LOAD("OBF"))
100 LET flopCardThree = 1+LOAD("OBF")+ RANDOM(52)
110 IF EXISTS(SHA256(ITOA(flopCardThree*flopCardThree*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3))) THEN GOTO 100
120 STORE(SHA256(ITOA(flopCardThree*flopCardThree*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3)), flopCardThree/LOAD("IV"))
130 STORE("FlopCard3", flopCardThree-LOAD("OBF"))
140 STORE("Deck Count:", LOAD("Deck Count:")-3)
150 RETURN 0
End Function

Function turnCard() Uint64
5 DIM turnCard as Uint64
10 LET turnCard = 1+LOAD("OBF")+ RANDOM(52)
20 IF EXISTS(SHA256(ITOA(turnCard*turnCard*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3))) THEN GOTO 10
30 STORE(SHA256(ITOA(turnCard*turnCard*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3)), turnCard/LOAD("IV"))
40 STORE("TurnCard", turnCard-LOAD("OBF"))
50 clock()
70 STORE("Deck Count:", LOAD("Deck Count:")-1)
90 RETURN 0
End Function

Function riverCard() Uint64
5 DIM riverCard as Uint64
10 LET riverCard = 1+LOAD("OBF")+ RANDOM(52)
20 IF EXISTS(SHA256(ITOA(riverCard*riverCard*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3))) THEN GOTO 10
30 STORE(SHA256(ITOA(riverCard*riverCard*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3)), riverCard/LOAD("IV"))
40 STORE("RiverCard", riverCard-LOAD("OBF"))
50 clock()
70 STORE("Deck Count:", LOAD("Deck Count:")-1)
90 RETURN 0
End Function

Function doubleCard(pcSeed String) Uint64
5 DIM holeCardOne, holeCardTwo as Uint64
10 LET holeCardOne = 1+LOAD("OBF")+ RANDOM(52)
20 IF EXISTS(SHA256(ITOA(holeCardOne*holeCardOne*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3))) THEN GOTO 10
30 clock()
35 STORE(SHA256(ITOA(holeCardOne*holeCardOne*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3)), holeCardOne/LOAD("IV"))
40 MAPSTORE("hCard1", HEX(pcSeed)+ITOA(holeCardOne-LOAD("OBF"))+HEX(LOAD("HandSeed")))
70 STORE("Player"+ITOA(LOAD("Player:"))+"card1", SHA256(MAPGET("hCard1")))
80 LET holeCardTwo = 1+LOAD("OBF")+ RANDOM(52)
90 IF EXISTS(SHA256(ITOA(holeCardTwo*holeCardTwo*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3))) THEN GOTO 80
100 STORE(SHA256(ITOA(holeCardTwo*holeCardTwo*LOAD("IV")/LOAD("OBF")+LOAD("IV")/3)), holeCardTwo/LOAD("IV"))
110 MAPSTORE("hCard2", HEX(pcSeed)+ITOA(holeCardTwo-LOAD("OBF"))+HEX(LOAD("HandSeed")))
120 STORE("Player"+ITOA(LOAD("Player:"))+"card2", SHA256(MAPGET("hCard2")))
130 STORE("Deck Count:", LOAD("Deck Count:")-2)
140 RETURN 0
End Function

Function Bet() Uint64
4 IF EXISTS("Reveal") THEN GOTO 700
5 IF playerCheck() THEN GOTO 10 ELSE GOTO 700
10 IF EXISTS("Wager:") THEN GOTO 50
20 IF DEROVALUE() == 0 THEN GOTO 100
30 IF DEROVALUE() >= LOAD("Ante:") THEN GOTO 40 ELSE GOTO 700
40 STORE("Wager:", DEROVALUE())
41 STORE("Pot:", LOAD("Pot:")+DEROVALUE())
43 clock()
44 STORE("W", 1)
45 foldedLoop()
47 IF playerLoop() THEN GOTO 200
48 IF counterLoop() THEN GOTO 470
49 RETURN 0
/// Call
50 IF DEROVALUE() == LOAD("Wager:") THEN GOTO 55 ELSE GOTO 73
55 clock()
57 foldedLoop()
62 STORE("Pot:", LOAD("Pot:")+DEROVALUE())
69 IF playerLoop() THEN GOTO 200
70 IF counterLoop() THEN GOTO 470
71 IF LOAD("W") >= LOAD("Seats at Table:") THEN GOTO 475
72 RETURN 0
/// Call raise
73 IF EXISTS("Raised:") THEN GOTO 74 ELSE GOTO 89
74 IF DEROVALUE() == LOAD("Raised:") THEN GOTO 75 ELSE GOTO 89
75 STORE("Pot:", LOAD("Pot:")+DEROVALUE())
76 clock()
77 foldedLoop()
78 IF playerLoop() THEN GOTO 200
79 IF counterLoop() THEN GOTO 470
80 IF LOAD("W") >= LOAD("Seats at Table:") THEN GOTO 475
81 RETURN 0
/// Raise
89 IF EXISTS("Raised:") THEN GOTO 118
90 IF DEROVALUE() > LOAD("Wager:") THEN GOTO 91 ELSE GOTO 118
91 clock()
92 STORE("W", 1)
93 foldedLoop()
94 STORE("Raised:", DEROVALUE()-LOAD("Wager:"))
95 STORE("Pot:", LOAD("Pot:")+DEROVALUE())
96 STORE("Wager:", DEROVALUE())
97 IF playerLoop() THEN GOTO 200
98 IF counterLoop() THEN GOTO 470
99 RETURN 0
/// Check
100 clock()
105 foldedLoop()
110 IF playerLoop() THEN GOTO 200
111 IF counterLoop() THEN GOTO 470
115 RETURN 0
/// Fold
118 IF DEROVALUE() == 0 THEN GOTO 120 ELSE GOTO 700
120 STORE(ITOA(LOAD("Player:"))+"F", 1)
125 clock()
126 takeBackCards(LOAD("Player:"))
127 foldedLoop()
130 IF playerLoop() THEN GOTO 200
131 IF counterLoop() THEN GOTO 470
132 IF LOAD("W") >= LOAD("Seats at Table:") THEN GOTO 475
140 RETURN 0
200 STORE("Player:", 0)
201 foldedLoop()
210 IF counterLoop() THEN GOTO 470
211 IF EXISTS("W") THEN GOTO 215 ELSE GOTO 220
215 IF LOAD("W") >= LOAD("Seats at Table:") THEN GOTO 475
220 RETURN 0
/// Flop
470 STORE("Counter:", 1)
473 IF EXISTS("W") THEN GOTO 474 ELSE GOTO 475
474 IF LOAD("W") >= LOAD("Seats at Table:") THEN GOTO 475 ELSE GOTO 220
475 IF EXISTS("Flop") THEN GOTO 485
476 flop()
478 STORE("Flop", 1)
479 IF EXISTS("Bet") THEN GOTO 580
480 RETURN 1
/// Turn
485 IF EXISTS("River") THEN GOTO 540
486 IF EXISTS("Turn") THEN GOTO 500
487 STORE("Turn", 1)
488 turnCard()
489 IF EXISTS("Bet") THEN GOTO 580
490 RETURN 1
/// River
500 riverCard()
510 STORE("River", 1)
520 IF LOAD("River") == 1 THEN GOTO 580
530 RETURN 1
540 STORE("Reveal", 1)
550 DELETE("Turn")
560 DELETE("River")
570 DELETE("Bet")
580 STORE("Player:", LOAD("Dealer:"))
590 IF EXISTS(ITOA(LOAD("Dealer:"))+"F") THEN GOTO 600 ELSE GOTO 640
600 STORE("Player:", LOAD("Player:")+1)
610 IF EXISTS(ITOA(LOAD("Player:"))+"F") THEN GOTO 600
620 IF LOAD("Player:") == LOAD("Seats at Table:") THEN GOTO 630 ELSE GOTO 640
630 STORE("Player:", 0)
640 STORE("Counter:", 1)
650 DELETE("Wager:")
670 DELETE("W")
680 DELETE("Raised:")
690 RETURN 0
700 RETURN 1
End Function

Function RevealKey(pcSeed String) Uint64
10 IF EXISTS("Reveal") THEN GOTO 30
20 RETURN 1
30 IF playerCheck() THEN GOTO 40 ELSE GOTO 20
40 clock()
50 STORE("Player"+ITOA(LOAD("Player:"))+"Key", pcSeed)
60 foldedLoop()
70 IF playerLoop() THEN GOTO 80 ELSE GOTO 100
80 STORE("Player:", 0)
90 foldedLoop()
100 IF counterLoop() THEN GOTO 110 ELSE GOTO 140
110 STORE("Counter:", 1)
120 STORE("End", 1)
130 DELETE("Reveal")
140 RETURN 0
End Function

Function ForceStart() Uint64
10 IF LOAD("owner:") == SIGNER() THEN GOTO 30
20 RETURN 1
30 STORE("Player:", LOAD("Seats at Table:"))
40 MAPSTORE("Count", 0)
50 IF EXISTS("Player3 ID:") == 0 && LOAD("Seats at Table:") >= 3 THEN GOTO 60 ELSE GOTO 100
60 STORE("2SO", 1)
70 MAPSTORE("Count", 1)
80 STORE("Open", MAPGET("Count"))
90 STORE("2F", 1)
100 IF EXISTS("Player4 ID:") == 0 && LOAD("Seats at Table:") >= 4 THEN GOTO 110 ELSE GOTO 150
110 STORE("3SO", 1)
120 MAPSTORE("Count", MAPGET("Count")+1)
130 STORE("Open", MAPGET("Count"))
140 STORE("3F", 1)
150 IF EXISTS("Player5 ID:") == 0 && LOAD("Seats at Table:") >= 5 THEN GOTO 160 ELSE GOTO 200
160 STORE("4SO", 1)
170 MAPSTORE("Count", MAPGET("Count")+1)
180 STORE("Open", MAPGET("Count"))
190 STORE("4F", 1)
200 IF EXISTS("Player6 ID:") == 0 && LOAD("Seats at Table:") == 6 THEN GOTO 210 ELSE GOTO 250
210 STORE("5SO", 1)
220 MAPSTORE("Count", MAPGET("Count")+1)
230 STORE("Open", MAPGET("Count"))
240 STORE("5F", 1)
250 RETURN 0
End Function

Function CleanTable(amount Uint64) Uint64
10 IF LOAD("owner:") == SIGNER() THEN GOTO 30
20 RETURN 1
30 SEND_DERO_TO_ADDRESS(SIGNER(), amount)
40 shuffleDeck()
50 RETURN 0
End Function

Function UpdateCode(code String, version Uint64) Uint64
10 IF LOAD("owner:") == SIGNER() THEN GOTO 30
20 RETURN 1
30 UPDATE_SC_CODE(code)
40 STORE("V:", version)
50 RETURN 0
End Function

Function Deck(face String, back String) Uint64
10 IF LOAD("owner:") == SIGNER() THEN GOTO 30
20 RETURN 1
30 STORE("Face:", face)
40 STORE("Back:", back)
50 RETURN 0
End Function