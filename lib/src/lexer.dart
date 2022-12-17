import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:petitparser/petitparser.dart';

// Transform the first analysis pass into a useful data structure.
class DeroBasicLexer extends DeroBasicGrammarDefinition {
  @override
  Parser functionExpression() => super.functionExpression().map((values) {
        Map<int, DvmObject> lines = {};
        Map<int, int> lineNumbersIndex = {};
        DBasicFunction func = values[0];
        (values[1] as List).asMap().forEach((key, value) {
          lineNumbersIndex[key] = value[0];
          lines[value[0]] = value[1];
        });
        return func.copyWith(
            lines: lines,
            lineNumbersIndex: lineNumbersIndex,
            lineNumbers: lineNumbersIndex.values.toList()..sort());
      });

  // -----------------------------------------------------------------
  // Function declaration.
  // -----------------------------------------------------------------
  @override
  Parser functionDeclaration() => super.functionDeclaration().map((values) {
        DBasicFunction func = DBasicFunction(
            functionSignature: DBasicFunctionSignature(
                id: values[1], params: values[2], returnType: values[3]));
        return func;
      });

  @override
  Parser functionDeclarationParameterList() =>
      super.functionDeclarationParameterList().map((values) {
        Map<Identifier, DvmType> params = {};
        for (var value in values) {
          if (value is Map<Identifier, DvmType>) params.addAll(value);
        }
        return params;
      });

  @override
  Parser functionDeclarationParameter() =>
      super.functionDeclarationParameter().map((values) {
        Map<Identifier, DvmType> param = {values[0]: values[1]};
        return param;
      });

  @override
  Parser functionDeclarationParameterTail() =>
      super.functionDeclarationParameterTail().map((values) {
        Map<Identifier, DvmType> params = {};
        for (var value in values) {
          if (value is Map<Identifier, DvmType>) {
            params.addAll(value);
          }
        }
        return params;
      });

  // -----------------------------------------------------------------
  // Function Invocation.
  // -----------------------------------------------------------------
  @override
  Parser functionInvocation() => super.functionInvocation().map((values) {
        return FunctionInvocation(id: Identifier(values[0]), params: values[1]);
      });

  @override
  Parser functionInvocationParameterList() =>
      super.functionInvocationParameterList().map((values) {
        List<Expression> params = [];

        for (var value in values) {
          if (value is List<Expression>) {
            params = params + value;
          } else if (value is Expression) {
            params.add((value));
          }
        }
        return params;
      });

  @override
  Parser functionInvocationParameterTail() =>
      super.functionInvocationParameterTail().map((values) {
        // print(values);
        List<Expression> params = [];

        for (var value in values) {
          if (value is List<Expression>) {
            params = params + value;
          } else if (value is Expression) {
            params.add((value));
          }
        }
        return params;
      });

  // -----------------------------------------------------------------
  // Statements.
  // -----------------------------------------------------------------
  @override
  Parser returnStatement() => super
      .returnStatement()
      .map((values) => ReturnStatement(expression: values[1]));

  @override
  Parser letStatement() => super.letStatement().map((values) {
        return LetStatement(
            identifier: (values[1] as Identifier).name, expression: values[3]);
      });

  @override
  Parser ifStatement() => super.ifStatement().map((values) {
        Expression exp;

        if (values[1] is List) {
          if (values[1][0] != null) {
            exp = Expression(
                values[1][1][1], getOperator((values[1][0] as Token).value));
          } else {
            exp = values[1][1][1];
          }
        } else {
          exp = values[1];
        }

        return IfStatement(
            booleanExpression: exp,
            thenGoto: Goto(values[2][1]),
            elseGoto: (values[3] != null) ? Goto(values[3][1]) : null);
      });

  @override
  Parser gotoStatement() => super.gotoStatement().map((values) => values[1]);

  @override
  Parser dimStatement() => super.dimStatement().map((values) {
        List<String> identifiers = ([values[1]] + (values[2] ?? []))
            .map((item) => (item as Identifier).name)
            .toList();
        return DimStatement(identifiers: identifiers, declaredType: values[4]);
      });

  @override
  Parser dimStatementTail() => super.dimStatementTail().map((values) {
        List identifiers = [];
        for (var value in values) {
          if (value != null && value is! Token) {
            if (value is List) {
              identifiers = identifiers + value;
            } else {
              identifiers.add(value);
            }
          }
        }
        return identifiers;
      });

  @override
  Parser identifier() => super.identifier().map((value) {
        return Identifier((value as Token).input);
      });

  @override
  Parser uint64Type() => super.uint64Type().map((_) => DvmType.uint64);

  @override
  Parser stringType() => super.stringType().map((_) => DvmType.string);

  @override
  Parser numberLexicalToken() =>
      // super.numberLexicalToken().map((value) => BigInt.parse(value));
      super.numberLexicalToken().map((value) => int.parse(value));

  @override
  Parser literal() => super.literal().map((value) {
        if (value is int) {
          return DBasicValue.uint64(valueUint64: value);
        } else if (value is String) {
          return DBasicValue.string(valueString: value);
        }
      });

  // -----------------------------------------------------------------
  // Expressions.
  // -----------------------------------------------------------------

  @override
  Parser multiplicativeExpression() =>
      super.multiplicativeExpression().map((value) => _buildExpression(value));

  @override
  Parser additiveExpression() =>
      super.additiveExpression().map((value) => _buildExpression(value));

  @override
  Parser shiftExpression() =>
      super.shiftExpression().map((value) => _buildExpression(value));

  @override
  Parser relationalExpression() =>
      super.relationalExpression().map((value) => _buildExpression(value));

  @override
  Parser equalityExpression() =>
      super.equalityExpression().map((value) => _buildExpression(value));

  @override
  Parser bitwiseAndExpression() =>
      super.bitwiseAndExpression().map((value) => _buildExpression(value));

  @override
  Parser bitwiseXorExpression() =>
      super.bitwiseXorExpression().map((value) => _buildExpression(value));

  @override
  Parser bitwiseOrExpression() =>
      super.bitwiseOrExpression().map((value) => _buildExpression(value));

  @override
  Parser logicalAndExpression() =>
      super.logicalAndExpression().map((value) => _buildExpression(value));

  @override
  Parser logicalOrExpression() =>
      super.logicalOrExpression().map((value) => _buildExpression(value));

  // -----------------------------------------------------------------
  // Utility functions.
  // -----------------------------------------------------------------

  dynamic _buildExpression(List rawExp) {
    Expression finalExp;
    Expression? tempExp;

    if (rawExp[0] is Expression) {
      tempExp = rawExp[0];
    } else if (rawExp[0] is Token && (rawExp[0] as Token).value is List) {
      for (var elem in (rawExp[0] as Token).value) {
        if (elem is Expression) {
          tempExp = elem;
        }
      }
    }
    finalExp = tempExp ?? Expression((rawExp[0] as Token).value);

    if (rawExp[1] != null && (rawExp[1] as List).isNotEmpty) {
      var traverseExp = finalExp;

      if ((rawExp[1] as List).length == 2 &&
          rawExp[1][0] is! List &&
          rawExp[1][1] is! List) {
        traverseExp = traverseExp.traverse();
        traverseExp.operator = getOperator((rawExp[1][0] as Token).value);

        if (rawExp[1][1] is Expression) {
          traverseExp.exp2 = rawExp[1][1];
        } else {
          traverseExp.exp2 = Expression((rawExp[1][1] as Token).value);
        }
      } else {
        for (var elem in rawExp[1]) {
          traverseExp = traverseExp.traverse();
          traverseExp.operator = getOperator((elem[0] as Token).value);

          if (elem[1] is Expression) {
            traverseExp.exp2 = elem[1];
          } else {
            traverseExp.exp2 = Expression((elem[1] as Token).value);
          }
        }
      }

      var currentOp = finalExp.operator?.code;
      if (currentOp == '*' || currentOp == '/' || currentOp == '%') {
        finalExp = Expression(finalExp);
      }
    }

    return finalExp;
  }

/*dynamic _cleanUpExpression(dynamic value) {
    // print('values : $value');
    if (value != null) {
      if (value[0] is Token) {
        if (value[1] == null || (value[1] as List).isEmpty) {
          // print('TOKEN1');
          // print(value[0]);
          return value[0];
        } else {
          // print('TOKEN2');
          // print(value);
          return value;
        }
      } else if (value[0] is List) {
        if ((value[0] as List).isNotEmpty) {
          // print('LIST');
          if (value[1] == null || (value[1] as List).isEmpty) {
            // print(value[0]);
            return value[0];
          } else {
            // print(value);
            return value;
          }
        }
      }
    }
  }*/
}
