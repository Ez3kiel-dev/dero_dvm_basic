/// Data types supported by DVM-BASIC.
enum DBasicType {
  string('String'),
  uint64('Uint64'),
  unknown('Unknown');

  const DBasicType(this.code);

  final String code;

  bool isTypeValid(dynamic value) {
    switch (this) {
      case DBasicType.string:
        if (value is String) {
          return true;
        } else {
          return false;
        }
      case DBasicType.uint64:
        if (value is int && value >= 0) {
          return true;
        } else {
          return false;
        }
      case DBasicType.unknown:
        return false;
    }
  }
}

/// @nodoc
DBasicType toDBasicType(String type) {
  switch (type) {
    case 'String':
      return DBasicType.string;
    case 'Uint64':
      return DBasicType.uint64;
    default:
      return DBasicType.unknown;
  }
}
