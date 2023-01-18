import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expression.freezed.dart';

/// Expression tree.
@freezed
class Expression extends DvmValue with _$Expression {
  /*final ASTNode tree;

  Expression(this.tree);*/

  Expression._();

  factory Expression(ASTNode tree) = _Expression;

  @override
  String toString() {
    return 'Expression(Tree: ${tree.toString()})';
  }

  @override
  String toDBasicCode() {
    return tree.toDBasicCode();
  }

  void prettyPrintTree() {
    tree.prettyPrint();
  }
}
