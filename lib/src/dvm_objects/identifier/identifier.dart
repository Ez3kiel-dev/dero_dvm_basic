import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'identifier.freezed.dart';

/// DVM-BASIC identifier.
@freezed
class Identifier extends DvmValue with _$Identifier {
  Identifier._();

  factory Identifier(String name) = _Identifier;

  @override
  String toDBasicCode() {
    return name;
  }
}
