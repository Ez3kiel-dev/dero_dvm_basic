/// @nodoc
class DBasicRepositoryException implements Exception {
  final String message;

  DBasicRepositoryException(this.message);

  @override
  String toString() {
    return 'DBasicRepositoryException: $message';
  }
}