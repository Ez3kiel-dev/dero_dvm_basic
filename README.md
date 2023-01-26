DVM-BASIC parser in Dart for [Dero] smart contracts.

## Features

* DVM-BASIC SC parser/lexer

## Usage

Below, the way to load a `bas` file containing a smart contract, And to perform the syntactic
analysis.

It is then possible, for example, to pretty print all function signatures.

```dart
import 'dart:io';

import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  var filePath =
  p.join(Directory.current.path, 'smart_contracts', 'lottery.bas');

  try {
    var file = File(filePath);
    var data = await file.readAsString();
    var dBasicRepository = DBasicRepository.loadSmartContract(data);
  } catch (e) {
    print(e);
  }

  var sc = dBasicRepository.smartContract;

  sc.prettyPrintFunctionSignatures();
  // Console output:
  // Function: Lottery - params : {} - returnType : DvmType.uint64
  // Function: Initialize - params : {} - returnType : DvmType.uint64
  // Function: TuneLotteryParameters - params : {input : DvmType.uint64, lotteryeveryXdeposit : DvmType.uint64, lotterygiveback : DvmType.uint64} - returnType : DvmType.uint64
  // Function: TransferOwnership - params : {newowner : DvmType.string} - returnType : DvmType.uint64
  // Function: ClaimOwnership - params : {} - returnType : DvmType.uint64
  // Function: Withdraw - params : {amount : DvmType.uint64} - returnType : DvmType.uint64
  // Function: UpdateCode - params : {code : DvmType.string} - returnType : DvmType.uint64
}
```

Once the parsing is successful, we can retrieve each function of the SC and browse its 
numbered execution lines.

```dart
var lotteryFunc = sc.getFunction('Lottery');

Map<int, DvmObject> lines = lotteryFunc.lines ?? {};

for (var line in lines.entries) {
    print(
    'Number: ${line.key} | Type: ${line.value.runtimeType} | Code: ${line.value.toDBasicCode()}');
}
// Console output:
// Number: 10 | Type: _$_DimStatement | Code: DIM deposit_count, winner as Uint64
// Number: 20 | Type: _$_LetStatement | Code: LET deposit_count = LOAD("deposit_count") + 1
// Number: 25 | Type: _$_IfStatement | Code: IF DEROVALUE() == 0 THEN GOTO 110
// Number: 30 | Type: _$_FunctionInvocation | Code: STORE("depositor_address" + (deposit_count - 1), SIGNER())
// Number: 40 | Type: _$_FunctionInvocation | Code: STORE("deposit_total", LOAD("deposit_total") + DEROVALUE())
// Number: 50 | Type: _$_FunctionInvocation | Code: STORE("deposit_count", deposit_count)
// Number: 60 | Type: _$_IfStatement | Code: IF LOAD("lotteryeveryXdeposit") > deposit_count THEN GOTO 110
// Number: 70 | Type: _$_LetStatement | Code: LET winner = RANDOM() % deposit_count
// Number: 80 | Type: _$_FunctionInvocation | Code: SEND_DERO_TO_ADDRESS(LOAD("depositor_address" + winner), LOAD("lotterygiveback") * LOAD("deposit_total") / 10000)
// Number: 90 | Type: _$_FunctionInvocation | Code: STORE("deposit_count", 0)
// Number: 100 | Type: _$_FunctionInvocation | Code: STORE("deposit_total", 0)
// Number: 110 | Type: _$_ReturnStatement | Code: RETURN 0
```

And much more (see `example` folder) ...

## Donations

If you found this package useful :)

Send any amount to `dero1qy5a6wk2r9mq3e5kagku4kdrhq407qhvht8qke5sxpm9u8lqmph3vqgl3nz8t` or use my
named address `Ez3kiel`.

Thanks!

[Dero]: https://dero.io/