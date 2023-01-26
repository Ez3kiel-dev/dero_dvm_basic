import 'dart:io';

import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:dero_dvm_basic/src/exceptions/dbasic_parser_exception.dart';
import 'package:path/path.dart' as p;

const String nameServiceSC = '''
/* Name Service SMART CONTRACT in DVM-BASIC.
Allows a user to register names which could be looked by wallets for easy to use name while transfer
*/

// This function is used to initialize parameters during install time
Function Initialize() Uint64
10  RETURN 0
End Function

// Register a name, limit names of 5 or less length
Function Register(name String) Uint64
10  IF EXISTS(name) THEN GOTO 50   // if name is already used, it cannot reregistered
20  IF STRLEN(name) >= 6 THEN GOTO 40
30  IF SIGNER() != address_raw("deto1qyvyeyzrcm2fzf6kyq7egkes2ufgny5xn77y6typhfx9s7w3mvyd5qqynr5hx") GOTO 50
40  STORE(name,SIGNER())
50  RETURN 0
End Function

// This function is used to change owner
// owner is an string form of address
Function TransferOwnership(name String,newowner String) Uint64
10  IF LOAD(name) != SIGNER() THEN GOTO 30
20  STORE(name,ADDRESS_RAW(newowner))
30  RETURN 0
End Function
''';

Future<void> main() async {
  DBasicRepository dBasicRepository;

  try {
    dBasicRepository = DBasicRepository.loadSmartContract(nameServiceSC);
  } on DBasicParserException catch (exception) {
    // Print the position in the buffer where parsing failed
    print(exception.position);
    // Get the row and column where the parsing failed
    var line = exception.lineAndColumn[0];
    var column = exception.lineAndColumn[1];
  } catch (e) {
    print(e);
  }

  // Loading a contract from a BAS file
  var filePath = p.join(
      Directory.current.path, 'playground/smart_contracts', 'lottery.bas');

  try {
    var file = File(filePath);
    var data = await file.readAsString();
    dBasicRepository = DBasicRepository.loadSmartContract(data);

    // Get smart contract
    var sc = dBasicRepository.smartContract;

    // Get all functions defined in the SC
    var functions = sc.functions;

    // Get all function signatures ...
    var functionSignatures = sc.getAllFunctionSignatures();

    // ... or "pretty" print it.
    sc.prettyPrintFunctionSignatures();

    // Convert SC data structure back into code unit
    var code = sc.toDBasicCode();
    print(code);
    // Console output:
    // -------------------------------------------------------------------------
    // Function Initialize() Uint64
    // 10 RETURN 0
    // End Function
    //
    // Function Register(name String) Uint64
    // 10 IF EXISTS(name) THEN GOTO 50
    // 20 IF STRLEN(name) >= 6 THEN GOTO 40
    // 30 IF SIGNER() != address_raw("deto1qyvyeyzrcm2fzf6kyq7egkes2ufgny5xn77y6typhfx9s7w3mvyd5qqynr5hx") THEN GOTO 50
    // 40 STORE(name, SIGNER())
    // 50 RETURN 0
    // End Function
    //
    // Function TransferOwnership(name String, newowner String) Uint64
    // 10 IF LOAD(name) != SIGNER() THEN GOTO 30
    // 20 STORE(name, ADDRESS_RAW(newowner))
    // 30 RETURN 0
    // End Function
    // -------------------------------------------------------------------------

    // It is also possible to create directly an [Expression] data structure.
    var expression = DBasicRepository.createArithmeticExpression(
        '(p2 / base * base + p1 / base) - q1 * ch');

    // And then print the AST of the Expression.
    expression.prettyPrintTree();
    // Console output:
    // -------------------------------------------------------------------------
    //          /----- ch
    //  /----- *
    //  |       \----- q1
    // -
    //  |               /----- base
    //  |       /----- /
    //  |       |       \----- p1
    //  \----- +
    //          |       /----- base
    //          \----- *
    //                  |       /----- base
    //                  \----- /
    //                          \----- p2

    // Or transform the AST into code again.
    print(expression.toDBasicCode());
    // Console output:
    // -------------------------------------------------------------------------
    // (p2 / base * base + p1 / base) - q1 * ch
  } catch (e) {
    print(e);
  }
}
