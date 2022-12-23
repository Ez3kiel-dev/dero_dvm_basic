import 'package:petitparser/context.dart';

/// @nodoc
class DBasicParsingException implements Exception {
  final Failure result;

  DBasicParsingException(this.result);

  @override
  String toString() {
    return 'DBasicParsingException - The parsing process has failed';
  }

  Failure get value => result.value;

  String get message => result.message;

  String get buffer => result.buffer;

  int get position => result.position;

  List<int> get lineAndColumn => result
      .toPositionString()
      .split(':')
      .map((e) => int.parse(e))
      .toList(growable: false);
}
