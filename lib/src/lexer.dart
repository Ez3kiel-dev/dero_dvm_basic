import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:dero_dvm_basic/src/exceptions/dbasic_lexer_exception.dart';
import 'package:petitparser/petitparser.dart';

/// Transform the first analysis pass into a useful data structure.
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
        Map<Identifier, DBasicType> params = {};
        for (var value in values) {
          if (value is Map<Identifier, DBasicType>) params.addAll(value);
        }
        return params;
      });

  @override
  Parser functionDeclarationParameter() =>
      super.functionDeclarationParameter().map((values) {
        Map<Identifier, DBasicType> param = {values[0]: values[1]};
        return param;
      });

  @override
  Parser functionDeclarationParameterTail() =>
      super.functionDeclarationParameterTail().map((values) {
        Map<Identifier, DBasicType> params = {};
        for (var value in values) {
          if (value is Map<Identifier, DBasicType>) {
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
        return FunctionInvocation(
            id: values[0] is Identifier ? values[0] : Identifier(values[0]),
            params: values[1]);
      });

  @override
  Parser functionInvocationParameterList() =>
      super.functionInvocationParameterList().map((values) {
        List<Expression> params = [];

        for (var value in values) {
          if (value is List<Expression>) {
            params = params + value;
          } else if (value is ASTNode) {
            params.add(Expression(value));
          }
        }
        return params;
      });

  @override
  Parser functionInvocationParameterTail() =>
      super.functionInvocationParameterTail().map((values) {
        List<Expression> params = [];

        for (var value in values) {
          if (value is List<Expression>) {
            params = params + value;
          } else if (value is ASTNode) {
            params.add(Expression(value));
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
      .map((values) => ReturnStatement(expression: Expression(values[1])));

  @override
  Parser letStatement() => super.letStatement().map((values) {
        return LetStatement(
            identifier: (values[1] as Identifier).name,
            expression: Expression(values[3]));
      });

  @override
  Parser ifStatement() => super.ifStatement().map((values) {
        return IfStatement(
            booleanExpression: Expression(values[1]),
            thenGoto: values[2][1],
            elseGoto: (values[3] != null) ? values[3][1] : null);
      });

  @override
  Parser gotoStatement() =>
      super.gotoStatement().map((values) => Goto(values[1]));

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
  Parser uint64Type() => super.uint64Type().map((_) => DBasicType.uint64);

  @override
  Parser stringType() => super.stringType().map((_) => DBasicType.string);

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
      super.multiplicativeExpression().map((value) => _buildAST(value));

  @override
  Parser additiveExpression() =>
      super.additiveExpression().map((value) => _buildAST(value));

  @override
  Parser shiftExpression() =>
      super.shiftExpression().map((value) => _buildAST(value));

  @override
  Parser relationalExpression() =>
      super.relationalExpression().map((value) => _buildAST(value));

  @override
  Parser equalityExpression() =>
      super.equalityExpression().map((value) => _buildAST(value));

  @override
  Parser bitwiseExpression() =>
      super.bitwiseExpression().map((value) => _buildAST(value));

  @override
  Parser logicalAndExpression() =>
      super.logicalAndExpression().map((value) => _buildAST(value));

  @override
  Parser logicalOrExpression() =>
      super.logicalOrExpression().map((value) => _buildAST(value));

  // -----------------------------------------------------------------
  // Utility functions.
  // -----------------------------------------------------------------

  dynamic _buildAST(List rawExpr) {
    var node = ASTNode();

    if (rawExpr[0] is ASTNode &&
        rawExpr[1] is List &&
        (rawExpr[1] as List).isEmpty) {
      node = rawExpr[0];
    } else if (rawExpr[0] is Token &&
        rawExpr[1] is List &&
        (rawExpr[1] as List).isEmpty) {
      if (rawExpr[0].value is List) {
        node = (rawExpr[0].value[1] as ASTNode).copyWith(parentheses: true);
      } else {
        node = node.copyWith(value: rawExpr[0].value);
      }
    } else if (rawExpr[0] is List &&
        rawExpr[1] is List &&
        (rawExpr[1] as List).isEmpty) {
      node = (rawExpr[0][1] as ASTNode).copyWith(parentheses: true);
    } else if (rawExpr[0] is ASTNode &&
        rawExpr[1] is List &&
        (rawExpr[1] as List).isNotEmpty) {
      node = _buildSubTree(rawExpr[0], rawExpr[1]);
    } else if (rawExpr[0] is Token &&
        rawExpr[1] is List &&
        (rawExpr[1] as List).isNotEmpty) {
      if (rawExpr[0].value is List) {
        node = _buildSubTree(
            (rawExpr[0].value[1] as ASTNode).copyWith(parentheses: true),
            rawExpr[1]);
      } else {
        node = _buildSubTree(
            ASTNode(value: rawExpr[0].value as DvmValue), rawExpr[1]);
      }
    } else {
      DBasicLexerException('Unable to build ASTNode with this data: $rawExpr');
    }

    return node;
  }

  dynamic _buildSubTree(ASTNode node, List list) {
    var rightNode = ASTNode();

    if (list[0][1] is Token) {
      if (list[0][1].value is List) {
        rightNode =
            (list[0][1].value[1] as ASTNode).copyWith(parentheses: true);
      } else {
        rightNode = rightNode.copyWith(value: list[0][1].value);
      }
    } else if (list[0][1] is List) {
      rightNode = (list[0][1][1] as ASTNode).copyWith(parentheses: true);
    } else {
      rightNode = list[0][1];
    }

    ASTNode tree = ASTNode(
        operator: getOperator((list[0][0] as Token).value),
        left: node,
        right: rightNode);

    list.removeAt(0);

    for (var elem in list) {
      rightNode = ASTNode();

      if (elem[1] is Token) {
        if (elem[1].value is List) {
          rightNode = (elem[1].value[1] as ASTNode).copyWith(parentheses: true);
        } else {
          rightNode = rightNode.copyWith(value: elem[1].value);
        }
      } else if (elem[1] is List) {
        rightNode = (elem[1][1] as ASTNode).copyWith(parentheses: true);
      } else {
        rightNode = elem[1];
      }

      var currentTree = ASTNode(
          operator: getOperator((elem[0] as Token).value),
          left: tree,
          right: rightNode);
      tree = currentTree;
    }
    return tree;
  }
}
