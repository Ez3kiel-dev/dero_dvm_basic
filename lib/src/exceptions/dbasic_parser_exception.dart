import 'package:petitparser/context.dart';

/// @nodoc
class DBasicParserException implements Exception {
  final Failure result;

  DBasicParserException(this.result);

  @override
  String toString() {
    return 'DBasicParserException - The parsing process has failed';
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
