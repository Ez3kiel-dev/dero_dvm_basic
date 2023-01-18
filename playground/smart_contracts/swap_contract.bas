//    _____  _____ _______ _______ _  _  _ _______  _____
//   |_____]   |   |______ |______ |  |  | |_____| |_____]
//   |       __|__ |______ ______| |__|__| |     | |
//
//   Swap contract

Function Initialize(asset1 String, asset2 String, symbol String, name String, fee Uint64) Uint64
	10 IF EXISTS("version") THEN GOTO 1100
	20 STORE("version", GetVer())
        30 STORE("o:" + HEX(SIGNER()), 0)
        40 STORE("ol:0", HEX(SIGNER()))
        50 STORE("numTrustees", 1)
        60 STORE("quorum", 1)
	70 STORE("asset1", HEXDECODE(asset1))
	80 STORE("asset2", HEXDECODE(asset2))
	90 STORE("symbol", symbol)
	100 STORE("decimals", 0)
	110 STORE("name", name)
	120 STORE("fee", fee)
	130 STORE("val1", 0)
	140 STORE("val2", 0)
	150 STORE("sharesOutstanding", 0)
	160 STORE("adds", 0)
	170 STORE("rems", 0)
	180 STORE("swaps", 0)

	1000 RETURN 0
	1100 RETURN 100
End Function

Function GetVer() String
	10 return "2.010"
End Function

// lossless (a * b ) / c
// (cause there ain't no Uint256)
Function multDiv(a Uint64, b Uint64, c Uint64) Uint64
	10 DIM base, maxdiv AS Uint64
	20 LET base = 4294967296	// (1<<32)
	30 LET maxdiv = (base-1)*base + (base-1)

	50 DIM res AS Uint64
	60 LET res = (a/c) * b + (a%c) * (b/c)
	70 LET a = a % c
	80 LET b = b % c
	90 IF (a == 0 || b == 0) THEN GOTO 1000

	100 IF (c >= base) THEN GOTO 200
        110 LET res = res + (a*b/c)
	120 GOTO 1000

	200 DIM norm AS Uint64
	210 LET norm = maxdiv/c
    	220 LET c = c * norm
	230 LET a = a * norm

	300 DIM ah, al, bh, bl, ch, cl AS Uint64
	310 LET ah = a / base
	320 LET al = a % base
	330 LET bh = b / base
	340 LET bl = b % base
	350 LET ch = c / base
	360 LET cl = c % base

	400 DIM p0, p1, p2 AS Uint64
	410 LET p0 = al*bl
	420 LET p1 = p0 / base + al*bh
	430 LET p0 = p0 % base
	440 LET p2 = p1 / base + ah*bh
	450 LET p1 = (p1 % base) + ah*bl
	460 LET p2 = p2 + p1 / base
	470 LET p1 = p1 % base

	500 DIM q0, q1, rhat AS Uint64
	510 LET p2 = p2 % c
	520 LET q1 = p2 / ch
	530 LET rhat = p2 % ch

	600 IF (q1 < base && (rhat >= base || q1*cl <= rhat*base+p1)) THEN GOTO 700
        610 LET q1 = q1 - 1
        620 LET rhat = rhat + ch
	630 GOTO 600

	700 LET p1 = ((p2 % base) * base + p1) - q1 * cl
    	710 LET p2 = (p2 / base * base + p1 / base) - q1 * ch
    	720 LET p1 = (p1 % base) + (p2 % base) * base
	730 LET q0 = p1 / ch
	740 LET rhat = p1 % ch

	800 IF (q0 < base && (rhat >= base || q0*cl <= rhat*base+p0)) THEN GOTO 900
        810 LET q0 = q0 - 1
        820 LET rhat = rhat + ch
	830 GOTO 800

	900 LET res = res + q0 + q1 * base

	1000 RETURN res
End Function

Function AddLiquidity() Uint64
	10 DIM in1, in2, val1, val2, inRatio, valRatio, sharesOutstanding, share AS Uint64
	20 DIM asset1, asset2 AS String

	30 LET asset1 = LOAD("asset1")
	40 LET asset2 = LOAD("asset2")
	50 LET val1 = LOAD("val1")
	60 LET val2 = LOAD("val2")
	70 LET sharesOutstanding = LOAD("sharesOutstanding")
	80 LET in1 = ASSETVALUE(asset1)
	90 LET in2 = ASSETVALUE(asset2)

	100 IF in1 < 1 || in2 < 1 THEN GOTO 1110
	110 IF sharesOutstanding > 0 THEN GOTO 130
	115 LET share = MAX(in1, in2)
	120 GOTO 300

	130 IF val2 > val1 THEN GOTO 170
	140 LET valRatio = val1 / val2
	150 LET inRatio = in1 / in2
	160 GOTO 190

	170 LET valRatio = val2 / val1
	180 LET inRatio = in2 / in1
	190 IF valRatio != inRatio THEN GOTO 1120

	200 LET share = multDiv(sharesOutstanding, in1, val1)

	300 SEND_ASSET_TO_ADDRESS(SIGNER(), share, SCID())
	310 STORE("val1", val1 + in1)
	320 STORE("val2", val2 + in2)
	330 STORE("sharesOutstanding", sharesOutstanding + share)
	340 STORE("adds", LOAD("adds") + 1)

	1000 RETURN 0
	1110 RETURN 110
	1120 RETURN 120
End Function

Function RemoveLiquidity() Uint64
	10 DIM out1, out2, val1, val2, shares, sharesOutstanding AS Uint64
	20 DIM asset1, asset2 AS String

	30 LET val1 = LOAD("val1")
	40 LET val2 = LOAD("val2")
	50 LET shares = ASSETVALUE(SCID())
	60 LET sharesOutstanding = LOAD("sharesOutstanding")
	70 LET asset1 = LOAD("asset1")
	80 LET asset2 = LOAD("asset2")

	90 IF sharesOutstanding < 1 || shares < 1 THEN GOTO 1130
	100 LET out1 = multDiv(val1, shares, sharesOutstanding)
	110 LET out2 = multDiv(val2, shares, sharesOutstanding)

	120 STORE("val1", val1 - out1)
	130 STORE("val2", val2 - out2)
	140 STORE("sharesOutstanding", sharesOutstanding - shares)
	150 STORE("rems", LOAD("rems") + 1)
	160 SEND_ASSET_TO_ADDRESS(SIGNER(), out1, asset1)
	170 SEND_ASSET_TO_ADDRESS(SIGNER(), out2, asset2)

	1000 RETURN 0
	1100 RETURN 100
	1130 RETURN 130
End Function

Function Swap() Uint64
	10 DIM in1, in2, out1, out2, val1, val2, fee AS Uint64
	20 DIM asset1, asset2 AS String

	30 LET asset1 = LOAD("asset1")
	40 LET asset2 = LOAD("asset2")
	50 LET in1 = ASSETVALUE(asset1)
	60 LET in2 = ASSETVALUE(asset2)
	70 LET val1 = LOAD("val1")
	80 LET val2 = LOAD("val2")
	90 LET fee = LOAD("fee")

	100 IF in1 > 0 && in2 > 0 THEN GOTO 1140
	110 IF in1 < 1 && in2 < 1 THEN GOTO 1110
	120 IF in2 > 0 THEN GOTO 300

	200 LET out2 = multDiv(in1, val2, (val1 + in1))
	210 LET out2 = multDiv(out2, (10000-fee), 10000)
	220 STORE("val1", val1 + in1)
	230 STORE("val2", val2 - out2)
	250 SEND_ASSET_TO_ADDRESS(SIGNER(), out2, asset2)
	260 GOTO 400

	300 LET out1 = multDiv(in2, val1, (val2 + in2))
	310 LET out1 = multDiv(out1, (10000-fee), 10000)
	320 STORE("val1", val1 - out1)
	330 STORE("val2", val2 + in2)
	350 SEND_ASSET_TO_ADDRESS(SIGNER(), out1, asset1)

	400 STORE("swaps", LOAD("swaps") + 1)

	1000 RETURN 0
	1100 RETURN 100
	1110 RETURN 110
	1140 RETURN 140
End Function

Function VoteSetFee(fee Uint64) Uint64
        10 DIM trustee AS String
        20 LET trustee = "o:" + HEX(SIGNER())
        30 IF EXISTS(trustee) != 1 THEN GOTO 1100
        40 IF LOAD("fee") == fee THEN GOTO 1260

        100 IF castVote(trustee, "0", ITOA(fee)) != 1 THEN GOTO 200
        110 DELETE("i:0")
        120 STORE("fee", fee)

        1000 RETURN 0
        1100 RETURN 100
        1260 RETURN 260
End Function

Function VoteAddTrustee(new_trustee String) Uint64
        10 DIM trustee AS String
        20 LET trustee = "o:" + HEX(SIGNER())
        30 IF EXISTS(trustee) != 1 THEN GOTO 1100
        40 IF EXISTS("o:" + new_trustee) THEN GOTO 1260
	50 IF STRLEN(new_trustee) != 64 THEN GOTO 1260

        100 IF castVote(trustee, "1", new_trustee) != 1 THEN GOTO 200
        110 DELETE("i:1")
        120 DIM numTrustees AS Uint64
        130 LET numTrustees = LOAD("numTrustees")
        140 STORE("ol:" + numTrustees, new_trustee)
        150 STORE("o:"+ new_trustee, numTrustees)
        160 STORE("numTrustees", numTrustees + 1)

        200 RETURN 0

        1100 RETURN 100
        1260 RETURN 260
End Function

Function VoteRemoveTrustee(old_trustee String) Uint64
        10 DIM trustee AS String
        20 DIM numTrustees AS Uint64
        30 LET trustee = "o:" + HEX(SIGNER())
        40 IF EXISTS(trustee) != 1 THEN GOTO 1100
        50 IF EXISTS("o:" + old_trustee) != 1 THEN GOTO 1260
        60 LET numTrustees = LOAD("numTrustees") - 1
        70 IF numTrustees == 0 THEN GOTO 1270
        80 IF numTrustees > LOAD("quorum") THEN GOTO 1280

        100 IF castVote(trustee, "2", old_trustee) != 1 THEN GOTO 300
        110 DELETE("i:2")

        200 DIM keyToMove AS String
        210 DIM rowToReplace AS Uint64
        220 LET keyToMove = LOAD("ol:" + numTrustees)
        230 LET rowToReplace = LOAD("o:" + old_trustee)
        240 STORE("o:" + keyToMove, rowToReplace)
        250 STORE("ol:" + rowToReplace, keyToMove)
        260 DELETE("o:" + old_trustee)
        270 DELETE("ol:" + numTrustees)
        280 STORE("numTrustees", numTrustees)

        300 RETURN 0

        1100 RETURN 100
        1260 RETURN 260
        1270 RETURN 270
        1290 RETURN 290
End Function

Function VoteChangeQuorum(new_quorum Uint64) Uint64
        10 DIM trustee AS String
        20 LET trustee = "o:" + HEX(SIGNER())
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
        20 LET trustee = "o:" + HEX(SIGNER())
        30 IF EXISTS(trustee) != 1 THEN GOTO 1100

        100 IF castVote(trustee, "4", sha256(code)) != 1 THEN GOTO 200
        110 DELETE("i:4")
        120 UPDATE_SC_CODE(code)

        200 RETURN 0

        1100 RETURN 100
        1260 RETURN 260
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