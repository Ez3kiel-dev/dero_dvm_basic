import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dbasic_function_signature.freezed.dart';

/// The function signature of a DVM-BASIC function.
@freezed
class DBasicFunctionSignature extends DvmObject with _$DBasicFunctionSignature {
  DBasicFunctionSignature._();

  factory DBasicFunctionSignature({
    required Identifier id,
    Map<Identifier, DvmType>? params,
    required DvmType returnType,
  }) = _DBasicFunctionSignature;

  @override
  String toDBasicCode() {
    String params = this
            .params
            ?.entries
            .map((e) => '${e.key.toDBasicCode()} ${e.value.code}')
            .toList()
            .join(', ') ??
        '';
    return 'Function ${id.toDBasicCode()}($params) ${returnType.code}';
  }
}