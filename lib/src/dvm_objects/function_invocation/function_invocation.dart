import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'function_invocation.freezed.dart';

/// The representation of a DVM-BASIC function invocation.
@freezed
class FunctionInvocation extends DvmValue with _$FunctionInvocation {
  FunctionInvocation._();

  factory FunctionInvocation(
      {required Identifier id,
      required List<Expression> params}) = _FunctionInvocation;

  @override
  String toDBasicCode() {
    String args = params.map((exp) => exp.toDBasicCode()).join(', ');
    return '${id.toDBasicCode()}($args)';
  }
}
