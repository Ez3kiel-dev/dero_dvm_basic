/// Data types supported by DVM-BASIC.
enum DvmType {
  string('String'),
  uint64('Uint64'),
  unknown('Unknown');

  const DvmType(this.code);

  final String code;

  bool isTypeValid(dynamic value) {
    switch (this) {
      case DvmType.string:
        if (value is String) {
          return true;
        } else {
          return false;
        }
      case DvmType.uint64:
        if (value is int && value >= 0) {
          return true;
        } else {
          return false;
        }
      case DvmType.unknown:
        return false;
    }
  }
}

DvmType toDvmType(String type) {
  switch (type) {
    case 'String':
      return DvmType.string;
    case 'Uint64':
      return DvmType.uint64;
    default:
      return DvmType.unknown;
  }
}
