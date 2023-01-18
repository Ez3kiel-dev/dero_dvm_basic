/// DVM-BASIC operator.
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

/// @nodoc
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
