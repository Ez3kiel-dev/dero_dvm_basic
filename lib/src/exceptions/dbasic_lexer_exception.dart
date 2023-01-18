/// @nodoc
class DBasicLexerException implements Exception {
  final String message;

  DBasicLexerException(this.message);

  @override
  String toString() {
    return 'DBasicLexerException: $message';
  }
}
