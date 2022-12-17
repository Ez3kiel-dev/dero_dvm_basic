import 'package:dero_dvm_basic/src/dvm_objects/dvm_object/dvm_object.dart';
import 'package:dero_dvm_basic/src/dvm_objects/dvm_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dim_statement.freezed.dart';

/// DIM statement representation.
@freezed
class DimStatement extends DvmObject with _$DimStatement {
  DimStatement._();

  factory DimStatement({
    required List<String> identifiers,
    required DvmType declaredType,
  }) = _DimStatement;

  @override
  String toDBasicCode() {
    return 'DIM ${identifiers.join(', ')} as ${declaredType.code}';
  }
}