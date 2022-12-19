import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dbasic_value.freezed.dart';

/// DVM-BASIC value.
@freezed
class DBasicValue extends DvmValue with _$DBasicValue {
  DBasicValue._();

  /// DVM-BASIC Uint64 value.
  factory DBasicValue.uint64({
    @Default(DvmType.uint64) DvmType type,
    required int valueUint64,
  }) = DBasicUint64;

  /// DVM-BASIC String value.
  factory DBasicValue.string({
    @Default(DvmType.string) DvmType type,
    required String valueString,
  }) = DBasicString;

  @override
  String toDBasicCode() {
    return when(
        uint64: (_, valueUint64) => valueUint64.toString(),
        string: (_, valueString) => valueString);
  }
}
