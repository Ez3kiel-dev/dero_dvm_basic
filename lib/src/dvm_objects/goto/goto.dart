import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goto.freezed.dart';

/// DVM-BASIC goto.
@freezed
class Goto extends DvmObject with _$Goto {
  Goto._();

  factory Goto(int line) = _Goto;

  @override
  String toDBasicCode() {
    return 'GOTO $line';
  }
}
