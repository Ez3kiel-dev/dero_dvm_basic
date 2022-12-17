import 'package:dero_dvm_basic/src/dvm_objects/dvm_object/dvm_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goto.freezed.dart';

/// @nodoc
@freezed
class Goto extends DvmObject with _$Goto {
  Goto._();

  factory Goto(int line) = _Goto;

  @override
  String toDBasicCode() {
    return 'GOTO $line';
  }
}