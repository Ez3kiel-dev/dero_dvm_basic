import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dbasic_value.freezed.dart';

/// A DVM-BASIC value.
@freezed
class DBasicValue extends DvmValue with _$DBasicValue {
  DBasicValue._();

  factory DBasicValue.uint64({
    @Default(DvmType.uint64) DvmType type,
    required int valueUint64,
  }) = DvmUint64;

  factory DBasicValue.string({
    @Default(DvmType.string) DvmType type,
    required String valueString,
  }) = DvmString;

  @override
  String toDBasicCode() {
    return when(
        uint64: (_, valueUint64) => valueUint64.toString(),
        string: (_, valueString) => valueString);
  }
}
