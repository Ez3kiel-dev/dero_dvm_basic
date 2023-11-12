import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:dero_dvm_basic/src/exceptions/dbasic_repository_exception.dart';
import 'package:petitparser/petitparser.dart';

import 'exceptions/dbasic_parser_exception.dart';

/// Repository that helps to load a smart contract and to parse it.
///
/// (WIP ...)
class DBasicRepository {
  String? codeUnit;
  final DeroBasicLexer _lexer = DeroBasicLexer();
  DBasicSmartContract? _smartContract;

  // Map<String, DBasicValue> storage = {};

  DBasicRepository.loadSmartContract(this.codeUnit,
      [String? smartContractName]) {
    _parseSmartContract(smartContractName);
  }

  static Expression createArithmeticExpression(String rawExp) {
    var lexer = DeroBasicLexer();
    var res = lexer.buildFrom(lexer.arithmeticExpression()).end().parse(rawExp);
    if (res is Success) {
      return Expression(res.value);
    } else {
      throw DBasicRepositoryException(
          'Unable to parse this arithmetic expression');
    }
  }

  static Expression createBooleanExpression(String rawExp) {
    var lexer = DeroBasicLexer();
    var res = lexer.buildFrom(lexer.booleanExpression()).end().parse(rawExp);
    if (res is Success) {
      return Expression(res.value);
    } else {
      throw DBasicRepositoryException(
          'Unable to parse this boolean expression');
    }
  }

  /// Returns the smart contract.
  DBasicSmartContract get smartContract {
    if (_smartContract == null) {
      throw DBasicRepositoryException('No smart contract created');
    }
    return _smartContract!;
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
    if (parsedResult is Failure) {
      throw DBasicParserException(parsedResult);
    }
    var functions = (parsedResult.value as List)
        .map((item) => item as DBasicFunction)
        .toList();

    _smartContract = DBasicSmartContract(name: smartContractName, functions: {
      for (var function in functions)
        function.functionSignature.id.name: function
    });
  }
}
