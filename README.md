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
  p.join(Directory.current.path, 'smart_contracts', 'token.bas');

  try {
    File file = File(filePath);
    String data = await file.readAsString();
    
    var dBasicRepository = DBasicRepository.loadSmartContract(data);

    dBasicRepository.sc.prettyPrintFunctionSignatures();
    // Console output:
    // Function: Lottery - params : {} - returnType : DvmType.uint64
    // Function: Initialize - params : {} - returnType : DvmType.uint64
    // Function: TuneLotteryParameters - params : {input : DvmType.uint64, lotteryeveryXdeposit : DvmType.uint64, lotterygiveback : DvmType.uint64} - returnType : DvmType.uint64
    // Function: TransferOwnership - params : {newowner : DvmType.string} - returnType : DvmType.uint64
    // Function: ClaimOwnership - params : {} - returnType : DvmType.uint64
    // Function: Withdraw - params : {amount : DvmType.uint64} - returnType : DvmType.uint64
    // Function: UpdateCode - params : {code : DvmType.string} - returnType : DvmType.uint64

  } catch (e) {
    print(e);
  }
}
```

Once the parsing is successful, we can retrieve each function of the SC and browse its 
numbered execution lines.

```dart
var dbasicRepository = DbasicRepository.loadSmartContract(filePath);

DBasicFunction register = dbasicRepository.sc.getFunction('Register');

Map<int, DvmObject> lines = register.lines ?? {};
for (var line in lines.entries) {
  print(
    'Number: ${line.key} | Type: ${line.value.runtimeType} | Code: ${line.value.toDBasicCode()}');
}
// Console output:
// Number: 10 | Type: _$_IfStatement | Code: IF EXISTS(name) THEN GOTO 50
// Number: 20 | Type: _$_IfStatement | Code: IF STRLEN(name) >= 6 THEN GOTO 40
// Number: 30 | Type: _$_IfStatement | Code: IF SIGNER() != address_raw("deto1qyvyeyzrcm2fzf6kyq7egkes2ufgny5xn77y6typhfx9s7w3mvyd5qqynr5hx") THEN GOTO 50
// Number: 40 | Type: _$_FunctionInvocation | Code: STORE(name, SIGNER())
// Number: 50 | Type: _$_ReturnStatement | Code: RETURN 0
```

And much more (see example) ...

## Donations

If this package was useful to you, and you want to support me :

Send any amount to `dero1qy5a6wk2r9mq3e5kagku4kdrhq407qhvht8qke5sxpm9u8lqmph3vqgl3nz8t` or use my
named address `Ez3kiel`.

Thx!

[Dero]: https://dero.io/