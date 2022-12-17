import 'package:dero_dvm_basic/src/dvm_objects/dbasic_value/dbasic_value.dart';
import 'package:dero_dvm_basic/src/dvm_objects/dvm_object/dvm_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dbasic_variable.freezed.dart';

/// A DVM-BASIC variable.
@freezed
class DBasicVariable extends DvmValue with _$DBasicVariable {
  DBasicVariable._();

  factory DBasicVariable({
    required final String name,
    required final DBasicValue value,
  }) = _DBasicVariable;

  @override
  String toDBasicCode() {
    return name;
  }
}
