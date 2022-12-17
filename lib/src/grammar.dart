import 'package:petitparser/petitparser.dart';

/// [GrammarDefinition] of Dero Basic.
///
/// Corresponding to a first pass.
class DeroBasicGrammarDefinition extends GrammarDefinition {
  Parser tokenInsensitive(Object input) {
    if (input is Parser) {
      return input.token().trim();
    } else if (input is String) {
      return tokenInsensitive(input.toParser(caseInsensitive: true));
    }
    throw ArgumentError.value(input, 'Invalid token parser');
  }

  Parser tokenSensitive(Object input) {
    if (input is Parser) {
      return input.token().trim();
    } else if (input is String) {
      return tokenInsensitive(input.toParser());
    }
    throw ArgumentError.value(input, 'Invalid token parser');
  }

  // -----------------------------------------------------------------
  // Keyword definitions.
  // -----------------------------------------------------------------

  Parser dimToken() => ref1(tokenInsensitive, 'DIM');

  Parser letToken() => ref1(tokenInsensitive, 'LET');

  Parser asToken() => ref1(tokenInsensitive, 'AS');

  Parser gotoToken() => ref1(tokenInsensitive, 'GOTO');

  Parser ifToken() => ref1(tokenInsensitive, 'IF');

  Parser thenToken() => ref1(tokenInsensitive, 'THEN');

  Parser elseToken() => ref1(tokenInsensitive, 'ELSE');

  Parser returnToken() => ref1(tokenInsensitive, 'RETURN');

  Parser functionToken() => ref1(tokenInsensitive, 'FUNCTION');

  Parser endToken() => ref1(tokenInsensitive, 'END');

  Parser reservedWords() =>
      ref0(dimToken) |
      ref0(letToken) |
      ref0(asToken) |
      ref0(gotoToken) |
      ref0(ifToken) |
      ref0(thenToken) |
      ref0(elseToken) |
      ref0(returnToken) |
      ref0(functionToken) |
      ref0(endToken);

  /// Built-in Functions
  Parser versionToken() => ref1(tokenInsensitive, 'version');

  Parser loadToken() => ref1(tokenInsensitive, 'load');

  Parser existsToken() => ref1(tokenInsensitive, 'exists');

  Parser storeToken() => ref1(tokenInsensitive, 'store');

  Parser deleteToken() => ref1(tokenInsensitive, 'delete');

  Parser mapExistsToken() => ref1(tokenInsensitive, 'mapexists');

  Parser mapGetToken() => ref1(tokenInsensitive, 'mapget');

  Parser mapStoreToken() => ref1(tokenInsensitive, 'mapstore');

  Parser mapDeleteToken() => ref1(tokenInsensitive, 'mapdelete');

  Parser randomToken() => ref1(tokenInsensitive, 'random');

  Parser scidToken() => ref1(tokenInsensitive, 'scid');

  Parser blidToken() => ref1(tokenInsensitive, 'blid');

  Parser txidToken() => ref1(tokenInsensitive, 'txid');

  Parser deroToken() => ref1(tokenInsensitive, 'dero');

  Parser blockHeightToken() => ref1(tokenInsensitive, 'block_height');

  Parser blockTimestampToken() => ref1(tokenInsensitive, 'block_timestamp');

  Parser signerToken() => ref1(tokenInsensitive, 'signer');

  Parser updateScCodeToken() => ref1(tokenInsensitive, 'update_sc_code');

  Parser isAddressValidToken() => ref1(tokenInsensitive, 'is_address_valid');

  Parser addressRawToken() => ref1(tokenInsensitive, 'address_raw');

  Parser addressStringToken() => ref1(tokenInsensitive, 'address_string');

  Parser sendDeroToAddressToken() =>
      ref1(tokenInsensitive, 'send_dero_to_address');

  Parser sendAssetToAddressToken() =>
      ref1(tokenInsensitive, 'send_asset_to_address');

  Parser deroValueToken() => ref1(tokenInsensitive, 'derovalue');

  Parser assetValueToken() => ref1(tokenInsensitive, 'assetvalue');

  Parser atoiToken() => ref1(tokenInsensitive, 'atoi');

  Parser itoaToken() => ref1(tokenInsensitive, 'itoa');

  Parser sha256Token() => ref1(tokenInsensitive, 'sha256');

  Parser sha3256Token() => ref1(tokenInsensitive, 'sha3256');

  Parser keccak256Token() => ref1(tokenInsensitive, 'keccak256');

  Parser hexToken() => ref1(tokenInsensitive, 'hex');

  Parser hexDecodeToken() => ref1(tokenInsensitive, 'hexdecode');

  Parser minToken() => ref1(tokenInsensitive, 'min');

  Parser maxToken() => ref1(tokenInsensitive, 'max');

  Parser strlenToken() => ref1(tokenInsensitive, 'strlen');

  Parser substrToken() => ref1(tokenInsensitive, 'substr');

  Parser panicToken() => ref1(tokenInsensitive, 'panic');

  Parser builtInFunctions() =>
      ref0(versionToken) |
      ref0(loadToken) |
      ref0(existsToken) |
      ref0(storeToken) |
      ref0(deleteToken) |
      ref0(mapExistsToken) |
      ref0(mapGetToken) |
      ref0(mapStoreToken) |
      ref0(mapDeleteToken) |
      ref0(randomToken) |
      ref0(scidToken) |
      ref0(blidToken) |
      ref0(txidToken) |
      ref0(blockHeightToken) |
      ref0(blockTimestampToken) |
      ref0(signerToken) |
      ref0(updateScCodeToken) |
      ref0(isAddressValidToken) |
      ref0(addressRawToken) |
      ref0(addressStringToken) |
      ref0(sendDeroToAddressToken) |
      ref0(sendAssetToAddressToken) |
      ref0(deroValueToken) |
      ref0(deroToken) |
      ref0(assetValueToken) |
      ref0(atoiToken) |
      ref0(itoaToken) |
      ref0(sha256Token) |
      ref0(sha3256Token) |
      ref0(keccak256Token) |
      ref0(hexToken) |
      ref0(hexDecodeToken) |
      ref0(minToken) |
      ref0(maxToken) |
      ref0(strlenToken) |
      ref0(substrToken) |
      ref0(panicToken);

  // -----------------------------------------------------------------
  // Grammar productions.
  // -----------------------------------------------------------------

  @override
  Parser start() => ref0(smartContract).end();

  Parser smartContract() =>
      ref0(functionExpression).trim(ref0(hiddenStuffWhitespace)).plus();

  Parser assignmentOperator() => ref1(tokenSensitive, '=');

  Parser additiveOperator() =>
      ref1(tokenSensitive, '+') | ref1(tokenSensitive, '-');

  Parser multiplicativeOperator() =>
      ref1(tokenSensitive, '*') |
      ref1(tokenSensitive, '/') |
      ref1(tokenSensitive, '%');

  Parser equalityOperator() =>
      ref1(tokenSensitive, '==') | ref1(tokenSensitive, '!=');

  Parser shiftOperator() =>
      ref1(tokenSensitive, '<<') | ref1(tokenSensitive, '>>');

  // Parser bitwiseOperator() =>
  //     ref1(tokenSensitive, '&') |
  //     ref1(tokenSensitive, '^') |
  //     ref1(tokenSensitive, '|');

  Parser relationalOperator() =>
      ref1(tokenSensitive, '>=') |
      ref1(tokenSensitive, '>') |
      ref1(tokenSensitive, '<=') |
      ref1(tokenSensitive, '<');

  Parser negateOperator() => ref1(tokenSensitive, '!');

  Parser arithmeticExpression() =>
      ref0(shiftExpression) | ref0(arithmeticExpressionInParentheses);

  Parser arithmeticExpressionInParentheses() =>
      ref1(tokenSensitive, '(') &
      ref0(arithmeticExpression) &
      ref1(tokenSensitive, ')');

  Parser booleanExpression() =>
      ref0(logicalOrExpression) |
      ref0(negateOperator) & ref0(booleanExpression) |
      ref0(negateOperator).optional() & ref0(booleanExpressionInParentheses);

  Parser booleanExpressionInParentheses() =>
      ref1(tokenSensitive, '(') &
      ref0(booleanExpression) &
      ref1(tokenSensitive, ')');

  Parser logicalOrExpression() =>
      ref0(logicalAndExpression) &
      (ref1(tokenSensitive, '||') & ref0(logicalAndExpression)).star();

  Parser logicalAndExpression() =>
      ref0(bitwiseOrExpression) &
      (ref1(tokenSensitive, '&&') & ref0(bitwiseOrExpression)).star();

  Parser bitwiseOrExpression() =>
      ref0(bitwiseXorExpression) &
      (ref1(tokenSensitive, '|') & ref0(bitwiseXorExpression)).star();

  Parser bitwiseXorExpression() =>
      ref0(bitwiseAndExpression) &
      (ref1(tokenSensitive, '^') & ref0(bitwiseAndExpression)).star();

  Parser bitwiseAndExpression() =>
      ref0(equalityExpression) &
      (ref1(tokenSensitive, '&') & ref0(equalityExpression)).star();

  Parser equalityExpression() =>
      ref0(relationalExpression) &
      (ref0(equalityOperator) & ref0(relationalExpression)).optional();

  Parser relationalExpression() =>
      ref0(arithmeticExpression) &
      (ref0(relationalOperator) & ref0(arithmeticExpression)).optional();

  Parser shiftExpression() =>
      ref0(additiveExpression) &
      (ref0(shiftOperator) & ref0(additiveExpression)).star();

  Parser additiveExpression() =>
      ref0(multiplicativeExpression) &
      (ref0(additiveOperator) & ref0(multiplicativeExpression)).star();

  Parser multiplicativeExpression() =>
      ref0(primary) & (ref0(multiplicativeOperator) & ref0(primary)).star();

  Parser primary() =>
      ref1(tokenSensitive, ref0(functionInvocation)) |
      ref1(tokenSensitive, ref0(literal)) |
      ref1(tokenSensitive, ref0(identifier)) |
      ref1(tokenSensitive, ref0(arithmeticExpressionInParentheses));

  Parser literal() =>
      ref0(stringLexicalToken).flatten() | ref0(numberLexicalToken);

  Parser identifier() =>
      ref1(tokenSensitive, ref0(identifierLexicalToken))
          .skip(before: ref0(reservedWords).end().not());

  Parser uint64Type() => ref1(tokenSensitive, 'Uint64');

  Parser stringType() => ref1(tokenSensitive, 'String');

  Parser dvmType() => ref0(uint64Type) | ref0(stringType);

  /// Function Invocation
  Parser functionInvocation() =>
      ref0(builtInFunctions).flatten() & ref0(functionInvocationParameterList) |
      ref0(identifier) & ref0(functionInvocationParameterList);

  Parser functionInvocationParameterList() =>
      ref1(tokenSensitive, '(') &
          ref0(arithmeticExpression).optional() &
          ref1(tokenSensitive, ')') |
      ref1(tokenSensitive, '(') &
          ref0(arithmeticExpression) &
          ref0(functionInvocationParameterTail).optional() &
          ref1(tokenSensitive, ')');

  Parser functionInvocationParameterTail() =>
      ref1(tokenSensitive, ',') &
      ref0(arithmeticExpression) &
      ref0(functionInvocationParameterTail).optional();

  /// Function Declaration
  Parser functionDeclaration() =>
      ref0(functionToken) &
      ref0(identifier) &
      ref0(functionDeclarationParameterList) &
      ref0(dvmType);

  Parser functionDeclarationParameterList() =>
      ref1(tokenSensitive, '(') &
          ref0(functionDeclarationParameter).optional() &
          ref1(tokenSensitive, ')') |
      ref1(tokenSensitive, '(') &
          ref0(functionDeclarationParameter) &
          ref0(functionDeclarationParameterTail).optional() &
          ref1(tokenSensitive, ')');

  Parser functionDeclarationParameter() => ref0(identifier) & ref0(dvmType);

  Parser functionDeclarationParameterTail() =>
      ref1(tokenSensitive, ',') &
      ref0(functionDeclarationParameter) &
      ref0(functionDeclarationParameterTail).optional();

  Parser functionExpression() =>
      ref0(functionDeclaration) & ref0(functionBody) & ref0(functionClosure);

  Parser functionClosure() => ref0(endToken) & ref0(functionToken);

  Parser functionBody() => ref0(line).plus();

  Parser line() =>
      ref0(numberLexicalToken) &
      ref0(statement).trim(ref0(hiddenStuffWhitespace));

  Parser statement() =>
      ref0(returnStatement) |
      ref0(dimStatement) |
      ref0(letStatement) |
      ref0(ifStatement) |
      ref0(functionInvocation);

  Parser returnStatement() => ref0(returnToken) & ref0(arithmeticExpression);

  Parser dimStatement() =>
      ref0(dimToken) &
      ref0(identifier) &
      ref0(dimStatementTail).optional() &
      ref0(asToken) &
      ref0(dvmType);

  Parser dimStatementTail() =>
      ref1(tokenSensitive, ',') &
      ref0(identifier) &
      ref0(dimStatementTail).optional();

  Parser letStatement() =>
      ref0(letToken) &
      ref0(identifier) &
      ref0(assignmentOperator) &
      ref0(arithmeticExpression);

  Parser ifStatement() =>
      ref0(ifToken) &
      ref0(booleanExpression) &
      ref0(thenStatement) &
      ref0(elseStatement).optional();

  Parser gotoStatement() => ref0(gotoToken) & ref0(numberLexicalToken);

  Parser thenStatement() => ref0(thenToken) & ref0(gotoStatement);

  Parser elseStatement() => ref0(elseToken) & ref0(gotoStatement);

  // -----------------------------------------------------------------
  // Lexical tokens.
  // -----------------------------------------------------------------

  Parser identifierLexicalToken() => ref0(letterLexicalToken) & word().star();

  Parser stringLexicalToken() =>
      char('"') &
          ref0(stringContentDoubleQuotedLexicalToken).star() &
          char('"') |
      char("'") &
          ref0(stringContentSingleQuotedLexicalToken).star() &
          char("'") |
      string('@"') & pattern('^"\n\r').star() & char('"') |
      string("@'") & pattern("^'\n\r").star() & char("'");

  Parser stringContentDoubleQuotedLexicalToken() =>
      pattern('^\\"\n\r') | char('\\') & pattern('\n\r');

  Parser stringContentSingleQuotedLexicalToken() =>
      pattern("^\\'\n\r") | char('\\') & pattern('\n\r');

  Parser numberLexicalToken() => ref0(digitLexicalToken).plus().flatten();

  Parser letterLexicalToken() => letter();

  Parser digitLexicalToken() => digit();

  Parser newlineLexicalToken() => pattern('\n\r');

  // -----------------------------------------------------------------
  // Whitespace and comments.
  // -----------------------------------------------------------------

  Parser hiddenWhitespace() => ref0(hiddenStuffWhitespace).plus();

  Parser hiddenStuffWhitespace() =>
      ref0(visibleWhitespace) |
      ref0(singleLineComment1) |
      ref0(singleLineComment2) |
      ref0(multiLineComment);

  Parser visibleWhitespace() => whitespace();

  Parser singleLineComment1() =>
      string('//') &
      ref0(newlineLexicalToken).neg().star() &
      ref0(newlineLexicalToken).optional();

  Parser singleLineComment2() =>
      string('`') &
      ref0(newlineLexicalToken).neg().star() &
      ref0(newlineLexicalToken).optional();

  Parser multiLineComment() =>
      string('/*') &
      (ref0(multiLineComment) | string('*/').neg()).star() &
      string('*/');
}