import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:petitparser/petitparser.dart';
import 'package:petitparser/reflection.dart';
import 'package:test/test.dart';

Function accept(Parser parser) => (input) => parser.parse(input).isSuccess;

void main() {
  final grammarDefinition = DeroBasicGrammarDefinition();

  test('Grammar linter', () {
    expect(linter(grammarDefinition.build()), isEmpty);
  });

  group('Lexical tokens', () {
    test('stringLexicalToken', () {
      var stringParser = grammarDefinition
          .build(start: grammarDefinition.stringLexicalToken)
          .end();
      expect('"string"', accept(stringParser));
      expect('"String"', accept(stringParser));
      expect('"string_34b"', accept(stringParser));
      expect('"stRIng_34b"', accept(stringParser));
      expect('"_stRIng_34b @é\$"', accept(stringParser));
      expect("'hi'", accept(stringParser));
      expect('"hi"', accept(stringParser));
      expect('no quotes', isNot(accept(stringParser)));
      expect('"missing quote', isNot(accept(stringParser)));
      expect("'missing quote", isNot(accept(stringParser)));
    });
    test('numberLexicalToken', () {
      var numberParser = grammarDefinition
          .build(start: grammarDefinition.numberLexicalToken)
          .end();
      expect('0', accept(numberParser));
      expect('5', accept(numberParser));
      expect('54', accept(numberParser));
      expect('35353535353', accept(numberParser));
      expect('35.54', isNot(accept(numberParser)));
      expect('-35', isNot(accept(numberParser)));
      expect('', isNot(accept(numberParser)));
      expect('-', isNot(accept(numberParser)));
    });
    test('identifierLexicalToken', () {
      var identifierParser = grammarDefinition
          .build(start: grammarDefinition.identifierLexicalToken)
          .end();
      expect('test', accept(identifierParser));
      expect('Test', accept(identifierParser));
      expect('test_', accept(identifierParser));
      expect('test_35', accept(identifierParser));
      expect('test35', accept(identifierParser));
      expect('_test', isNot(accept(identifierParser)));
      expect('3test', isNot(accept(identifierParser)));
    });
    test('newlineLexicalToken', () {
      var parser = grammarDefinition
          .build(start: grammarDefinition.newlineLexicalToken)
          .end();
      expect('\n', accept(parser));
      expect('\r', accept(parser));
    });
  });
  group('Whitespace and comments', () {
    var whitespaces = grammarDefinition
        .build(start: grammarDefinition.hiddenWhitespace)
        .end();
    test('whitespace', () {
      expect(' ', accept(whitespaces));
      expect('\t', accept(whitespaces));
      expect('\n', accept(whitespaces));
      expect('\r', accept(whitespaces));
      expect('a', isNot(accept(whitespaces)));
    });
    test('singleLineComment1', () {
      expect('//test', accept(whitespaces));
      expect('//test\n', accept(whitespaces));
      expect(' //test\n', accept(whitespaces));
    });
    test('singleLineComment2', () {
      expect('`test', accept(whitespaces));
      expect('`test\n', accept(whitespaces));
      expect('  `test\n', accept(whitespaces));
    });
    test('multiLineComment', () {
      expect('/*test*/', accept(whitespaces));
      expect('/*test\n*/', accept(whitespaces));
      expect('/*test\ntest*/', accept(whitespaces));
      expect(
          '/* outer /* nested /* deeply nested */ */ */', accept(whitespaces));
    });
    test('combined', () {
      expect('/**/', accept(whitespaces));
      expect(' /**/', accept(whitespaces));
      expect('/**/ ', accept(whitespaces));
      expect(' /**/ ', accept(whitespaces));
      expect('/**///', accept(whitespaces));
      expect('/**/ //', accept(whitespaces));
      expect(' /**/ //', accept(whitespaces));
    });
  });

  group('Grammar productions', () {
    test('identifier', () {
      var parser =
          grammarDefinition.build(start: grammarDefinition.identifier).end();
      expect('test', accept(parser));
      expect('Test', accept(parser));
      expect('test_', accept(parser));
      expect('functional', accept(parser));
      expect('if_', accept(parser));
      expect('test_35', accept(parser));
      expect('test35', accept(parser));
      expect('_test', isNot(accept(parser)));
      expect('end', isNot(accept(parser)));
      expect('dim', isNot(accept(parser)));
      expect('FUNCTION', isNot(accept(parser)));
      expect('3test', isNot(accept(parser)));
    });
    test('dvmType', () {
      var dvmTypeParser =
          grammarDefinition.build(start: grammarDefinition.dvmType).end();
      expect('Uint64', accept(dvmTypeParser));
      expect('String', accept(dvmTypeParser));
    });
    test('builtInFunctions', () {
      var parser = grammarDefinition
          .build(start: grammarDefinition.builtInFunctions)
          .end();
      expect('STORE', accept(parser));
      expect('SIGNER', accept(parser));
      expect('keccak256', accept(parser));
      expect('send_dero_to_address', accept(parser));
      expect('LOAD', accept(parser));
      expect('DERO', accept(parser));
      expect('DEROVALUE', accept(parser));
      expect('mapexists', accept(parser));
      expect('mapGET', accept(parser));
      expect('mapstore', accept(parser));
      expect('mapdelete', accept(parser));
      expect('block_height', accept(parser));
      expect('block_timestamp', accept(parser));
      expect('3TORE', isNot(accept(parser)));
    });
    test('functionCall', () {
      var parser = grammarDefinition
          .build(start: grammarDefinition.functionInvocation)
          .end();
      expect('STORE( "owner", SIGNER())', accept(parser));
      expect('STORE(SIGNER(), SIGNER())', accept(parser));
      expect('STORE("owner", "owner")', accept(parser));
      expect('STORE("owner", "owner"  , "owner")', accept(parser));
      expect('STORE( 123 , "owner")', accept(parser));
      expect('STORE( 123 , 123,123)', accept(parser));
      expect('keccak256("test")', accept(parser));
      expect('send_dero_to_address("test")', accept(parser));
      expect('STORE("depositor_address" + (deposit_count-1), SIGNER())',
          accept(parser));
      expect('LOAD(test)', accept(parser));
      expect('3TORE( 123)', isNot(accept(parser)));
      expect('STORE( 123', isNot(accept(parser)));
    });
    test('line', () {
      var parser = grammarDefinition.build(start: grammarDefinition.line).end();
      expect('10 STORE( "owner", SIGNER())', accept(parser));
      expect(
          '10  IF DEROVALUE() == 0 THEN GOTO 110 // if deposit amount is 0, simply return',
          accept(parser));
      expect(
          '30 STORE("depositor_address" + (deposit_count-1), SIGNER()) // store address for later on payment',
          accept(parser));
      expect('70 RETURN 0', accept(parser));
      expect('70 RETURN "test"', accept(parser));
    });
    test('functionDeclaration', () {
      var parser = grammarDefinition
          .build(start: grammarDefinition.functionDeclaration)
          .end();
      expect('Function Initialize() Uint64', accept(parser));
      expect('Function Initialize() String', accept(parser));
      expect('Function initialize() String', accept(parser));
      expect(
          'Function TuneLotteryParameters(input Uint64, lotteryeveryXdeposit Uint64, lotterygiveback Uint64) Uint64',
          accept(parser));
      // expect('', isNot(accept(parser)));
    });
    test('functionClosure', () {
      var parser = grammarDefinition
          .build(start: grammarDefinition.functionClosure)
          .end();
      expect('End Function', accept(parser));
      expect('END FuncTion', accept(parser));
    });
    test('functionBody', () {
      var parser =
          grammarDefinition.build(start: grammarDefinition.functionBody).end();
      expect('10 STORE("owner", SIGNER())\n40 RETURN 0', accept(parser));
      expect('10 STORE("owner", SIGNER()) // blabla comment\n40 RETURN 0',
          accept(parser));
    });
    test('functionExpression', () {
      var parser = grammarDefinition
          .build(start: grammarDefinition.functionExpression)
          .end();
      expect(
          'Function Initialize() Uint64\n10 STORE("owner", SIGNER())\n40  RETURN 0\nEnd Function',
          accept(parser));
      expect(
          'Function Initialize() Uint64\n 10 STORE("owner", SIGNER())\n40  RETURN 0\nEnd Function',
          accept(parser));
      expect(
          'Function Initialize() Uint64 \n 10 STORE("owner", SIGNER()) \n40  RETURN 0\n   End Function',
          accept(parser));
      expect('Function Initialize() Uint64\n40 RETURN 0\nEnd Function',
          accept(parser));
      expect(
          'Function Initialize() Uint64 \n 10 STORE("owner", SIGNER()) \n50 func() \nEnd Function',
          accept(parser));
      // expect('', isNot(accept(parser)));
    });
    test('dimStatement', () {
      var parser =
          grammarDefinition.build(start: grammarDefinition.dimStatement).end();
      expect('DIM count as Uint64', accept(parser));
      expect('DIM key,owner as String', accept(parser));
      expect('DIM key,owner, client as String', accept(parser));
      expect('DIM key,owner, client String', isNot(accept(parser)));
    });
    test('letStatement', () {
      var parser =
          grammarDefinition.build(start: grammarDefinition.letStatement).end();
      expect('LET test = 6', accept(parser));
      expect('LET test = "foo"', accept(parser));
      expect('LET test = test()', accept(parser));
      expect('LET test = test() + 1', accept(parser));
      expect('LET test = (6 + 2)', accept(parser));
      expect('LET test = 6 + 2', accept(parser));
      expect('LET test = test + 2', accept(parser));
    });
    test('ifStatement', () {
      var parser =
          grammarDefinition.build(start: grammarDefinition.ifStatement).end();
      expect('IF test > 1 THEN GOTO 10', accept(parser));
      expect('IF 1 == 1 THEN GOTO 10', accept(parser));
      expect('IF !("string" == "string") THEN GOTO 10', accept(parser));
      expect('IF !(2 < 3) THEN GOTO 10', accept(parser));
      expect('IF (2 < 3) THEN GOTO 10', accept(parser));
      expect('IF !LOAD() THEN GOTO 10', accept(parser));
      expect('IF !foo THEN GOTO 10', accept(parser));
      expect('IF DEROVALUE() == 0 THEN GOTO 110', accept(parser));
      expect('IF 1 == 1 THEN GOTO 10 ELSE GOTO 20', accept(parser));
      expect('IF test > 1 GOTO 10', isNot(accept(parser)));
    });
    test('returnStatement', () {
      var parser = grammarDefinition
          .build(start: grammarDefinition.returnStatement)
          .end();
      expect('RETURN 1', accept(parser));
      expect('return 0', accept(parser));
      expect('return func()', accept(parser));
      expect('RETURN id', accept(parser));
      expect('RETURN "id"', accept(parser));
      expect('RETURN ', isNot(accept(parser)));
    });
  });
  group('Expressions', () {
    test('arithmeticExpression', () {
      var parser = grammarDefinition
          .build(start: grammarDefinition.arithmeticExpression)
          .end();
      expect('3*3', accept(parser));
      expect('3 * 3', accept(parser));
      expect('3+3', accept(parser));
      expect('3 + 3', accept(parser));
      expect('3-3', accept(parser));
      expect('3 - 3', accept(parser));
      expect('3 - 3 + 2', accept(parser));
      expect('3 - (3 + 2)', accept(parser));
      expect('3 - 3 * 2 * 5', accept(parser));
      expect('LOAD("lotterygiveback")*LOAD("deposit_total")/10000',
          accept(parser));
      expect('test() + 1', accept(parser));
      expect('(1<<i)', accept(parser));
      expect('tally & (1<<i)', accept(parser));
      expect('"depositor_address" + (deposit_count-1)', accept(parser));
      expect('3 - 3 2 4', isNot(accept(parser)));
      expect('3 == 3', isNot(accept(parser)));
      expect('3 ++ 3', isNot(accept(parser)));
    });
    test('booleanExpression', () {
      var parser = grammarDefinition
          .build(start: grammarDefinition.booleanExpression)
          .end();
      expect('3>2', accept(parser));
      expect('2 < 3', accept(parser));
      expect('"string" == "string"', accept(parser));
      expect('!("string" == "string")', accept(parser));
      expect('!(2 < 3)', accept(parser));
      expect('"string" != "str"', accept(parser));
      expect('3>=3', accept(parser));
      expect('3<=3', accept(parser));
      expect('test()>"string"', accept(parser));
      expect('3 < (3 + 2)', accept(parser));
      expect('3 < 3 + 2', accept(parser));
      expect('(tally & (1<<i)) < 1', accept(parser));
      expect('var < (3 + 2)', accept(parser));
      expect('var < (3 + 2) && test()>"string"', accept(parser));
      expect('(t > 4) || (x > 1)', accept(parser));
      expect('((rhat >= base) || q1*cl <= rhat*base+p1)', accept(parser));
      expect(
          '(test>1 && rhat >= base || q1*cl <= rhat*base+p1)', accept(parser));
      expect('(q1 < base && (rhat >= base || q1*cl <= rhat*base+p1))',
          accept(parser));
      // expect('tally & (1<<i)', isNot(accept(parser)));
    });
  });
}
