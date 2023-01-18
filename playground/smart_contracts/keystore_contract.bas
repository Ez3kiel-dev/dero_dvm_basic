//   _     _ _______ __   __ _______ _______  _____   ______ _______
//   |____/  |______   \_/   |______    |    |     | |_____/ |______
//   |    \_ |______    |    ______|    |    |_____| |    \_ |______
//
//   by Deroholic

Function Initialize(mainnet Uint64) Uint64
	10 IF EXISTS("k:mainnet") THEN GOTO 1100
	20 STORE("k:mainnet", mainnet)

	1000 RETURN 0
	1100 RETURN 100
End Function

Function checkAuth(k String) Uint64
	10 IF STRLEN(k) >= 60 THEN GOTO 1100
	20 IF STRLEN(k) <  4  THEN GOTO 1100
	30 IF EXISTS("o:" + k) == 0 THEN GOTO 50
	40 IF LOAD("o:" + k) == SIGNER() THEN GOTO 1000
	50 IF EXISTS("k:" + k) THEN GOTO 1100

	100 STORE("o:" + k, SIGNER())

	1000 RETURN 0
	1100 RETURN 100
End Function

Function StoreKeyString(k String, v String) Uint64
	10 IF checkAuth(k) != 0 THEN GOTO 1100

	100 STORE("k:" + k, v)

	1000 RETURN 0
	1100 RETURN 100
End Function

Function StoreKeyHex(k String, v String) Uint64
	10 IF checkAuth(k) != 0 THEN GOTO 1100

	100 STORE("k:" + k, HEXDECODE(v))

	1000 RETURN 0
	1100 RETURN 100
End Function

Function StoreKeyUint64(k String, v Uint64) Uint64
	10 IF checkAuth(k) != 0 THEN GOTO 1100

	100 STORE("k:" + k, v)

	1000 RETURN 0
	1100 RETURN 100
End Function

Function DeleteKey(k String) Uint64
	10 IF EXISTS("o:" + k) == 0 THEN GOTO 1100
	20 IF LOAD("o:" + k) != SIGNER() THEN GOTO 1100

	100 DELETE("o:" + k)
	110 DELETE("k:" + k)

	1000 RETURN 0
	1100 RETURN 100
End Function

Function LockKey(k String) Uint64
	10 IF EXISTS("o:" + k) == 0 THEN GOTO 1100
	20 IF LOAD("o:" + k) != SIGNER() THEN GOTO 1100

	100 DELETE("o:" + k)

	1000 RETURN 0
	1100 RETURN 100
End Function