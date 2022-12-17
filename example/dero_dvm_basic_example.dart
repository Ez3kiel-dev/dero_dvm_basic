import 'dart:io';

import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:dero_dvm_basic/src/exceptions/dbasic_exceptions.dart';
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
    dBasicRepository =
        DBasicRepository.loadSmartContractFromString(nameServiceSC);
  } on DBasicParsingException catch (exception) {
    // Print the position in the buffer where parsing failed
    print(exception.position);
    // Get the row and column where the parsing failed
    int line = exception.lineAndColumn[0];
    int column = exception.lineAndColumn[1];
  } catch (e) {
    print(e);
  }

  // It's It is also possible to load a contract from a BAS file
  var filePath = p.join(
      Directory.current.path, 'playground/smart_contracts', 'lottery.bas');

  try {
    dBasicRepository =
        await DBasicRepository.loadSmartContractFromFile(filePath);

    // Get all functions defined in the SC
    List<DBasicFunction> functions = dBasicRepository.functions;

    // Get all function signatures ...
    List<DBasicFunctionSignature> functionSignatures =
        dBasicRepository.sc.getAllFunctionSignatures();

    // ... or "pretty" print it
    dBasicRepository.sc.prettyPrintFunctionSignatures();

    // Convert SC data structure back into code unit
    String code = dBasicRepository.sc.toDBasicCode();
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
  } catch (e) {
    print(e);
  }
}