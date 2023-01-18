//       ______  _______  ______  _____       ______   ______ _____ ______   ______ _______
//       |     \ |______ |_____/ |     |      |_____] |_____/   |   |     \ |  ____ |______
//       |_____/ |______ |    \_ |_____|      |_____] |    \_ __|__ |_____/ |_____| |______
//
//       Token Contract

Function Initialize() Uint64
	10 IF EXISTS("version") THEN GOTO 1100
	20 STORE("t:" + HEX(SIGNER()), 0)
	30 STORE("tl:0", HEX(SIGNER()))
	40 STORE("numTrustees", 1)
	50 STORE("bridgeOpen", 1)
	60 STORE("quorum", 1)
	70 STORE("totalsupply", 0)
	80 STORE("name", "Dero wrapped Tether USD")
	90 STORE("symbol", "DUSDT")
	100 STORE("decimals", 6)
	110 STORE("native_decimals", 6)
	120 STORE("native_symbol", "USDT")
	130 STORE("bridgeFee", 500)
	140 STORE("version", "0.210")

	1000 RETURN 0
	1100 RETURN 100
End Function

Function toLower(eth String) String
	10 DIM i AS Uint64
	20 DIM res,c AS String

	25 LET res = ""
	30 LET i = 0

	50 LET c = SUBSTR(eth, i, 1)

	60 IF (c != "A") THEN GOTO 70
	65 LET c = "a"
	67 GOTO 120

	70 IF (c != "B") THEN GOTO 80
	75 LET c = "b"
	77 GOTO 120

	80 IF (c != "C") THEN GOTO 90
	85 LET c = "c"
	87 GOTO 120

	90 IF (c != "D") THEN GOTO 100
	95 LET c = "d"
	97 GOTO 120

	100 IF (c != "E") THEN GOTO 110
	105 LET c = "e"
	107 GOTO 120

	110 IF (c != "F") THEN GOTO 120
	115 LET c = "f"

	120 LET res = res + c
	130 LET i = i + 1
	140 IF (i == 40) THEN GOTO 160
	150 GOTO 50

	160 RETURN res
End Function

Function toUpper(char String) String
	20 IF (char != "a") THEN GOTO 30
	25 RETURN "A"

	30 IF (char != "b") THEN GOTO 40
	35 RETURN "B"

	40 IF (char != "c") THEN GOTO 50
	45 RETURN "C"

	50 IF (char != "d") THEN GOTO 60
	55 RETURN "D"

	60 IF (char != "e") THEN GOTO 70
	65 RETURN "E"

	70 IF (char != "f") THEN GOTO 80
	75 RETURN "F"

	80 RETURN char
End Function

Function rebuildEth(eth_lower String, keccak String) String
	10 DIM c, k, res AS String
	20 DIM i, n AS Uint64
	30 LET res = "0x"
	40 LET i = 0

	50 LET c = SUBSTR(eth_lower, i, 1)
	60 LET k = SUBSTR(keccak, i, 1)
	70 IF (k == "0" || k == "1" || k == "2" || k == "3" || k == "4" || k == "5" || k == "6" || k == "7") THEN GOTO 100
	90 LET c = toUpper(c)
	100 LET res = res + c
	110 LET i = i + 1
	120 IF (i == 40) THEN GOTO 160
	130 GOTO 50

	160 RETURN res
End Function

Function ValidateETH(eth String) Uint64
	10 DIM eth_stripped, eth_lower, keccak, eth_rebuilt AS String

	100 IF (STRLEN(eth) != 42) THEN GOTO 1000
	110 IF (SUBSTR(eth, 0, 2) != "0x") THEN GOTO 1000

	200 LET eth_lower = toLower(SUBSTR(eth, 2, 40))
	210 LET eth_rebuilt = rebuildEth(eth_lower, HEX(KECCAK256(eth_lower)))
	220 IF (eth != eth_rebuilt) THEN GOTO 1000
	230 RETURN 0

	1000 RETURN 1
End Function

Function countVotes(tally Uint64) Uint64
	10 DIM votes, i AS Uint64
	20 LET votes = 0
	30 LET i = LOAD("numTrustees")

	100 IF (tally & (1<<i)) < 1 THEN GOTO 120
	110 LET votes = votes + 1
	120 LET i = i - 1
	130 IF i < 1 THEN GOTO 1000
	140 GOTO 100

	1000 RETURN votes
End Function

Function SHL(a Uint64, b Uint64) Uint64
	10 RETURN a << b
End Function

Function castVote(trustee String, key String, proposal String) Uint64
	10 DIM value, c, tally_str AS String
	20 DIM i, tally AS Uint64
	30 LET tally_str = "0"
	40 IF EXISTS("i:" + key) != 1 THEN GOTO 200
	50 LET value = LOAD("i:" + key)
	60 LET i = 0

	100 LET c = SUBSTR(value, i, 1)
	110 IF (c == ":") THEN GOTO 200
	120 LET tally_str = tally_str + c
	130 LET i = i + 1
	140 GOTO 100

	200 LET tally = ATOI(tally_str)
	210 IF ((tally & 1) == 1) THEN GOTO 1000
	220 IF SUBSTR(value, i+1, STRLEN(proposal)) == proposal THEN GOTO 300
	230 LET tally = 0

	300 LET tally = tally | SHL(1, LOAD(trustee) + 1)
	310 IF countVotes(tally) < LOAD("quorum") THEN GOTO 400
	320 LET tally = tally | 1

	400 STORE("i:" + key, ITOA(tally) + ":" + proposal)
	410 RETURN (tally & 1)

	1000 RETURN 0
End Function

Function VoteSetBridgeFee(fee Uint64) Uint64
	10 DIM trustee AS String
	20 LET trustee = "t:" + HEX(SIGNER())
	30 IF EXISTS(trustee) != 1 THEN GOTO 1100
	40 IF LOAD("bridgeFee") == fee THEN GOTO 1260

	100 IF castVote(trustee, "0", ITOA(fee)) != 1 THEN GOTO 200
	110 DELETE("i:0")
	120 STORE("bridgeFee", fee)

	200 RETURN 0

	1100 RETURN 100
	1260 RETURN 260
End Function

Function VoteMint(eth_txid String, deroAddr String, amount Uint64) Uint64
	10 DIM trustee AS String
	20 LET trustee = "t:" + HEX(SIGNER())
	30 IF LOAD("bridgeOpen") == 0 THEN GOTO 1290
	40 IF EXISTS(trustee) != 1 THEN GOTO 1100

	100 IF castVote(trustee, eth_txid, deroAddr + "." + ITOA(amount) + ".") != 1 THEN GOTO 200
	110 STORE("totalsupply", LOAD("totalsupply") + amount)
	120 SEND_ASSET_TO_ADDRESS(HEXDECODE(deroAddr), amount, SCID())

	200 RETURN 0

	1100 RETURN 100
	1260 RETURN 260
	1290 RETURN 290
End Function

Function VoteAddTrustee(new_trustee String) Uint64
	10 DIM trustee AS String
	20 LET trustee = "t:" + HEX(SIGNER())
	30 IF EXISTS(trustee) != 1 THEN GOTO 1100
	40 IF EXISTS("t:" + new_trustee) THEN GOTO 1260
	50 IF STRLEN(new_trustee) != 64 THEN GOTO 1260

	100 IF castVote(trustee, "1", new_trustee) != 1 THEN GOTO 200
	110 DELETE("i:1")
	120 DIM numTrustees AS Uint64
	130 LET numTrustees = LOAD("numTrustees")
	140 STORE("tl:" + numTrustees, new_trustee)
	150 STORE("t:"+ new_trustee, numTrustees)
	160 STORE("numTrustees", numTrustees + 1)

	200 RETURN 0

	1100 RETURN 100
	1260 RETURN 260
End Function

Function VoteRemoveTrustee(old_trustee String) Uint64
	10 DIM trustee AS String
	20 DIM numTrustees AS Uint64
	30 LET trustee = "t:" + HEX(SIGNER())
	40 IF EXISTS(trustee) != 1 THEN GOTO 1100
	50 IF EXISTS("t:" + old_trustee) != 1 THEN GOTO 1260
	60 LET numTrustees = LOAD("numTrustees") - 1
	70 IF numTrustees == 0 THEN GOTO 1270
	80 IF numTrustees > LOAD("quorum") THEN GOTO 1280

	100 IF castVote(trustee, "2", old_trustee) != 1 THEN GOTO 300
	110 DELETE("i:2")

	200 DIM keyToMove AS String
	210 DIM rowToReplace AS Uint64
	220 LET keyToMove = LOAD("tl:" + numTrustees)
	230 LET rowToReplace = LOAD("t:" + old_trustee)
	240 STORE("t:" + keyToMove, rowToReplace)
	250 STORE("tl:" + rowToReplace, keyToMove)
	260 DELETE("t:" + old_trustee)
	270 DELETE("tl:" + numTrustees)
	280 STORE("numTrustees", numTrustees)

	300 RETURN 0

	1100 RETURN 100
	1260 RETURN 260
	1270 RETURN 270
	1290 RETURN 290
End Function

Function VoteChangeQuorum(new_quorum Uint64) Uint64
	10 DIM trustee AS String
	20 LET trustee = "t:" + HEX(SIGNER())
	30 IF EXISTS(trustee) != 1 THEN GOTO 1100
	40 IF LOAD("quorum") == new_quorum THEN GOTO 1260
	50 IF new_quorum > LOAD("numTrustees") THEN GOTO 1300

	100 IF castVote(trustee, "3", ITOA(new_quorum)) != 1 THEN GOTO 200
	110 DELETE("i:3")
	120 STORE("quorum", new_quorum)

	200 RETURN 0

	1100 RETURN 100
	1260 RETURN 260
	1300 RETURN 300
End Function

Function VoteUpdateCode(code String) Uint64
	10 DIM trustee AS String
	20 LET trustee = "t:" + HEX(SIGNER())
	30 IF EXISTS(trustee) != 1 THEN GOTO 1100

	100 IF castVote(trustee, "4", sha256(code)) != 1 THEN GOTO 200
	110 DELETE("i:4")
	120 UPDATE_SC_CODE(code)

	200 RETURN 0

	1100 RETURN 100
	1260 RETURN 260
End Function

Function SetBridgeClosed() Uint64
	10 DIM trustee AS String
	20 LET trustee = "t:" + HEX(SIGNER())
	30 IF EXISTS(trustee) != 1 THEN GOTO 1100

	100 STORE("bridgeOpen", 0)

	200 RETURN 0

	1100 RETURN 100
End Function

Function VoteSetBridgeOpen() Uint64
	10 DIM trustee AS String
	20 LET trustee = "t:" + HEX(SIGNER())
	30 IF EXISTS(trustee) != 1 THEN GOTO 1100
	40 IF LOAD("bridgeOpen") == 1 THEN GOTO 1260

	100 IF castVote(trustee, "5", "true") != 1 THEN GOTO 200
	110 DELETE("i:5")
	120 STORE("bridgeOpen", 1)

	200 RETURN 0

	1100 RETURN 100
	1260 RETURN 260
End Function

Function Bridge(eth_addr String) Uint64
	10 IF LOAD("bridgeOpen") == 0 THEN GOTO 1290
	20 DIM bridgeFee AS Uint64
	30 LET bridgeFee = LOAD("bridgeFee")
	40 IF DEROVALUE() != bridgeFee THEN GOTO 1210
	50 IF ValidateETH(eth_addr) THEN GOTO 1240

	200 DIM amount AS Uint64
	210 LET amount = ASSETVALUE(SCID())
	220 IF amount < 1 THEN GOTO 1250

	300 STORE("b:" + HEX(TXID()), eth_addr + ":" + amount)
	310 STORE("totalsupply", LOAD("totalsupply") - amount)
	320 DIM i, numTrustees, portion AS Uint64
	330 LET numTrustees = LOAD("numTrustees")
	340 LET portion = bridgeFee / numTrustees
	350 SEND_DERO_TO_ADDRESS(HEXDECODE(LOAD("tl:0")), portion + bridgeFee - portion * numTrustees)
	360 LET i = 1

	400 IF i >= numTrustees THEN GOTO 500
	410 SEND_DERO_TO_ADDRESS(HEXDECODE(LOAD("tl:" + i)), portion)
	420 LET i = i + 1
	430 GOTO 400

	500 RETURN 0

	1210 RETURN 210
	1240 RETURN 240
	1250 RETURN 250
	1290 RETURN 290
End Function