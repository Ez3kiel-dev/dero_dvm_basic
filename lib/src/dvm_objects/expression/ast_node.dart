import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ast_node.freezed.dart';

/// AST node for Expression tree.
@freezed
class ASTNode with DvmObject, _$ASTNode {
  /*DvmValue? value;
  Operator? operator;
  ASTNode? left;
  ASTNode? right;
  bool parentheses;

  ASTNode(
      {this.value,
      this.operator,
      this.left,
      this.right,
      this.parentheses = false});*/

  ASTNode._();

  factory ASTNode({
    DvmValue? value,
    @Default(false) bool parentheses,
    Operator? operator,
    ASTNode? left,
    ASTNode? right,
  }) = _ASTNode;

  @override
  String toString() {
    var res = '';
    if (value != null) {
      res = 'ASTNode(parentheses: $parentheses, value: ${value.toString()})';
    } else {
      res =
          'ASTNode(parentheses: $parentheses, operator: ${operator?.code}, left: ${left.toString()}, right: ${right.toString()})';
    }
    return res;
  }

  @override
  String toDBasicCode() {
    if (value != null) {
      if (parentheses) {
        return '(${value!.toDBasicCode()})';
      } else {
        return value!.toDBasicCode();
      }
    } else {
      if (parentheses) {
        return '(${left?.toDBasicCode()} ${operator?.code} ${right?.toDBasicCode()})';
      } else {
        return '${left?.toDBasicCode()} ${operator?.code} ${right?.toDBasicCode()}';
      }
    }
  }

  void prettyPrint() {
    var out = StringBuffer();

    if (right != null) {
      right!._printTree(out, true, '');
    }

    _printNodeValue(out);

    if (left != null) {
      left!._printTree(out, false, '');
    }

    print(out.toString());
  }

  void _printTree(StringBuffer out, bool isRight, String indent) {
    if (right != null) {
      right!
          ._printTree(out, true, '$indent${isRight ? '        ' : ' |      '}');
    }
    out.write(indent);

    if (isRight) {
      out.write(' /');
    } else {
      out.write(' \\');
    }

    out.write('----- ');

    _printNodeValue(out);

    if (left != null) {
      left!._printTree(
          out, false, '$indent${isRight ? ' |      ' : '        '}');
    }
  }

  void _printNodeValue(StringBuffer out) {
    if (value != null) {
      out.write(value!.toDBasicCode());
    } else if (operator != null) {
      out.write(operator!.code);
    }
    out.write('\n');
  }
}
