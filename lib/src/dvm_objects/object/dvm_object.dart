/// Generic DVM-BASIC object.
abstract class DvmObject {
  /// Converts [DvmObject] into DVM-BASIC code.
  String toDBasicCode();
}

/// @nodoc
abstract class DvmValue extends DvmObject {}
