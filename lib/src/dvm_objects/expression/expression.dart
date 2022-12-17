import 'package:dero_dvm_basic/dero_dvm_basic.dart';

// TODO: doc
class Expression extends ExpressionNode {
  Operator? operator;
  Expression? exp2;

  Expression(super.value, [this.operator, this.exp2]);

  @override
  String toString() {
    return 'Expression('
        'exp1:$value, '
        'op:$operator, '
        'exp2:$exp2)';
  }

  @override
  String toDBasicCode() {
    if (exp2 == null) {
      if (operator == null) {
        return super.toDBasicCode();
      } else {
        // Unary expression
        return '${operator!.code}(${super.toDBasicCode()})';
      }
    } else {
      if (operator != null) {
        return '${super.toDBasicCode()} ${operator!.code} ${exp2!.toDBasicCode()}';
      } else {
        throw Exception('Binary expression must have an operator');
      }
    }
  }

  Expression traverse() {
    Expression res;
    if (exp2 == null) {
      return this;
    } else {
      res = exp2!.traverse();
    }
    return res;
  }
}

class ExpressionNode extends DvmValue {
  final DvmValue value;

  ExpressionNode(this.value);

  @override
  String toDBasicCode() {
    return value.toDBasicCode();
  }
}

enum Operator {
  assign('='),
  add('+'),
  subtract('-'),
  multiply('*'),
  divide('/'),
  modulo('%'),
  equals('=='),
  notEquals('!='),
  greater('>'),
  lower('<'),
  greaterOrEq('>='),
  lowerOrEq('<='),
  shiftLeft('<<'),
  shiftRight('>>'),
  not('!'),
  bitwiseXOR('^'),
  bitwiseAND('&'),
  bitwiseOR('|'),
  logicalAND('&&'),
  logicalOR('||');

  const Operator(this.code);

  final String code;
}

Operator getOperator(String op) {
  op = op.trim();
  switch (op) {
    case '=':
      return Operator.assign;
    case '+':
      return Operator.add;
    case '-':
      return Operator.subtract;
    case '*':
      return Operator.multiply;
    case '/':
      return Operator.divide;
    case '%':
      return Operator.modulo;
    case '==':
      return Operator.equals;
    case '!=':
      return Operator.notEquals;
    case '>':
      return Operator.greater;
    case '<':
      return Operator.lower;
    case '>=':
      return Operator.greaterOrEq;
    case '<=':
      return Operator.lowerOrEq;
    case '<<':
      return Operator.shiftLeft;
    case '>>':
      return Operator.shiftRight;
    case '!':
      return Operator.not;
    case '^':
      return Operator.bitwiseXOR;
    case '&':
      return Operator.bitwiseAND;
    case '|':
      return Operator.bitwiseOR;
    case '&&':
      return Operator.logicalAND;
    case '||':
      return Operator.logicalOR;
    default:
      throw Exception('Unsupported operator: $op');
  }
}