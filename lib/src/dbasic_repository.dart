import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:dero_dvm_basic/src/exceptions/dbasic_repository_exception.dart';
import 'package:petitparser/petitparser.dart';

import 'exceptions/dbasic_parser_exception.dart';

/// Repository that helps to load a smart contract and to parse it.
/// (WIP ...)
class DBasicRepository {
  String? codeUnit;
  final DeroBasicLexer _lexer = DeroBasicLexer();
  DBasicSmartContract? _sc;

  // Map<String, DBasicValue> storage = {};

  DBasicRepository.loadSmartContract(this.codeUnit,
      [String? smartContractName]) {
    _parseSmartContract(smartContractName);
  }

  static Expression createArithmeticExpression(String rawExp) {
    var lexer = DeroBasicLexer();
    var res =
        lexer.build(start: lexer.arithmeticExpression).end().parse(rawExp);
    if (res.isSuccess) {
      return Expression(res.value);
    } else {
      throw DBasicRepositoryException(
          'Unable to parse this arithmetic expression');
    }
  }

  static Expression createBooleanExpression(String rawExp) {
    var lexer = DeroBasicLexer();
    var res = lexer.build(start: lexer.booleanExpression).end().parse(rawExp);
    if (res.isSuccess) {
      return Expression(res.value);
    } else {
      throw DBasicRepositoryException(
          'Unable to parse this boolean expression');
    }
  }

  /// Returns the smart contract.
  DBasicSmartContract get sc {
    var sc = _sc;
    if (sc == null) {
      throw DBasicRepositoryException('No smart contract created');
    }
    return sc;
  }

  /// Returns all functions defined in the SC.
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
      throw DBasicParserException((parsedResult as Failure));
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
