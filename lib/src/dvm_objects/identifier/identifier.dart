import 'package:dero_dvm_basic/src/dvm_objects/dvm_object/dvm_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'identifier.freezed.dart';

/// @nodoc
@freezed
class Identifier extends DvmValue with _$Identifier {
  Identifier._();

  factory Identifier(String name) = _Identifier;

  @override
  String toDBasicCode() {
    return name;
  }
}