import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'let_statement.freezed.dart';

/// DVM-BASIC LET statement.
@freezed
class LetStatement extends DvmObject with _$LetStatement {
  LetStatement._();

  factory LetStatement({
    required String identifier,
    required Expression expression,
  }) = _LetStatement;

  @override
  String toDBasicCode() {
    return 'LET $identifier = ${expression.toDBasicCode()}';
  }
}
