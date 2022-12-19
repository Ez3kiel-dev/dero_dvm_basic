import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dim_statement.freezed.dart';

/// DVM-BASIC DIM statement.
@freezed
class DimStatement extends DvmObject with _$DimStatement {
  DimStatement._();

  factory DimStatement({
    required List<String> identifiers,
    required DBasicType declaredType,
  }) = _DimStatement;

  @override
  String toDBasicCode() {
    return 'DIM ${identifiers.join(', ')} as ${declaredType.code}';
  }
}
