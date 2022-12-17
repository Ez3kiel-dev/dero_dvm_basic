import 'dart:io';

import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:dero_dvm_basic/src/exceptions/dbasic_repository_exceptions.dart';
import 'package:path/path.dart' as p;
import 'package:petitparser/context.dart';

import 'exceptions/dbasic_exceptions.dart';

/// Repository that helps to load a smart contract and to parse it.
/// (WIP ...)
class DBasicRepository {
  String? codeUnit;
  final DeroBasicLexer _lexer = DeroBasicLexer();
  DBasicSmartContract? _sc;
  Map<String, DBasicValue> storage = {};

  DBasicRepository.loadSmartContractFromString(this.codeUnit,
      [String? smartContractName]) {
    _parseSmartContract(smartContractName);
  }

  // Loads a smart contract file, given a file (of type `bas`) path.
  static Future<DBasicRepository> loadSmartContractFromFile(
      String filePath) async {
    if (p.extension(filePath).toLowerCase() != '.bas') {
      throw DBasicRepositoryException(
          'The file format is invalid, BAS file extension required (e.g. "asset.bas")');
    }

    String data;
    try {
      File file = File(filePath);
      data = await file.readAsString();
    } catch (e) {
      throw DBasicRepositoryException('Fail to load smart contract file');
    }

    var name = p.basenameWithoutExtension(filePath);

    return DBasicRepository.loadSmartContractFromString(data, name);
  }

  /// @nodoc
  DBasicSmartContract get sc {
    var sc = _sc;
    if (sc == null) {
      throw DBasicRepositoryException('No smart contract created');
    }
    return sc;
  }

  /// Get all functions defined in the SC.
  List<DBasicFunction> get functions {
    List<DBasicFunction> functions = _sc?.functions.values.toList() ?? [];
    return functions;
  }

  // -----------------------------------------------------------------
  // Utility functions.
  // -----------------------------------------------------------------

  /// Runs the parsing process.
  void _parseSmartContract(String? smartContractName) {
    Result parsedResult;
    if (codeUnit != null) {
      parsedResult = _lexer.build().parse(codeUnit!);
    } else {
      throw DBasicRepositoryException('No code has been loaded');
    }
    if (parsedResult.isFailure) {
      print(parsedResult);
      throw DBasicParsingException((parsedResult as Result<Failure>));
    }
    var functions = (parsedResult.value as List)
        .map((item) => item as DBasicFunction)
        .toList();

    _sc = DBasicSmartContract(name: smartContractName, functions: {
      for (var function in functions)
        function.functionSignature.id.name: function
    });
  }
}
