//	 ______  _______  ______  _____       ______   ______ _____ ______   ______ _______
//	 |     \ |______ |_____/ |     |      |_____] |_____/   |   |     \ |  ____ |______
//	 |_____/ |______ |    \_ |_____|      |_____] |    \_ __|__ |_____/ |_____| |______
//
//       Registry Contract

Function Initialize() Uint64
10 IF EXISTS("version") THEN GOTO 1100
20 STORE("t:" + HEX(SIGNER()), 0)
30 STORE("tl:0", HEX(SIGNER()))
40 STORE("numTrustees", 1)
50 STORE("bridgeOpen", 1)
60 STORE("quorum", 1)
70 STORE("bridgeFee", 500)
80 STORE("tokens", 0)
90 STORE("version", "0.210")

1000 RETURN 0
1100 RETURN 100
End Function

Function RegisterToken(eth_contract String, symbol String, dero_contract String) Uint64
10 DIM trustee AS String
20 LET trustee = "t:" + HEX(SIGNER())
30 IF EXISTS(trustee) != 1 THEN GOTO 1100
40 IF EXISTS("e:" + eth_contract) THEN GOTO 1220
50 IF EXISTS("s:" + symbol) THEN GOTO 1230

100 STORE("e:" + eth_contract, HEXDECODE(dero_contract))
110 STORE("d:" + dero_contract, eth_contract)
120 STORE("s:" + symbol, HEXDECODE(dero_contract))
130 STORE("tokens", LOAD("tokens") + 1)

200 RETURN 0

1100 RETURN 100
1220 RETURN 220
1230 RETURN 230
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