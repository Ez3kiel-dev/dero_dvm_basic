import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'if_statement.freezed.dart';

/// IF statement representation.
@freezed
class IfStatement extends DvmObject with _$IfStatement {
  IfStatement._();

  factory IfStatement({
    required Expression booleanExpression,
    required Goto thenGoto,
    Goto? elseGoto,
  }) = _IfStatement;

  @override
  String toDBasicCode() {
    var mainCode =
        'IF ${booleanExpression.toDBasicCode()} THEN ${thenGoto.toDBasicCode()}';
    if (elseGoto == null) {
      return mainCode;
    } else {
      return '$mainCode ELSE ${elseGoto!.toDBasicCode()}';
    }
  }
}