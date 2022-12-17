import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:petitparser/petitparser.dart';
import 'package:petitparser/reflection.dart';
import 'package:test/test.dart';

Function accept(Parser parser) => (input) => parser.parse(input).isSuccess;

void main() {
  final lexer = DeroBasicLexer();

  test('Grammar linter', () {
    expect(linter(lexer.build()), isEmpty);
  });

  group('...', () {});
}
