import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_statement.freezed.dart';

/// RETURN statement representation.
@freezed
class ReturnStatement extends DvmObject with _$ReturnStatement {
  ReturnStatement._();

  factory ReturnStatement({
    required Expression expression,
  }) = _ReturnStatement;

  @override
  String toDBasicCode() {
    return 'RETURN ${expression.toDBasicCode()}';
  }
}
