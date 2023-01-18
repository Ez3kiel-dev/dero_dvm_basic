import 'package:petitparser/petitparser.dart';

/// [GrammarDefinition] of Dero Basic.
///
/// Corresponding to a first pass.
class DeroBasicGrammarDefinition extends GrammarDefinition {
  /// @nodoc
  Parser tokenInsensitive(Object input) {
    if (input is Parser) {
      return input.token().trim();
    } else if (input is String) {
      return tokenInsensitive(input.toParser(caseInsensitive: true));
    }
    throw ArgumentError.value(input, 'Invalid token parser');
  }

  /// @nodoc
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

  /// @nodoc
  Parser dimToken() => ref1(tokenInsensitive, 'DIM');

  /// @nodoc
  Parser letToken() => ref1(tokenInsensitive, 'LET');

  /// @nodoc
  Parser asToken() => ref1(tokenInsensitive, 'AS');

  /// @nodoc
  Parser gotoToken() => ref1(tokenInsensitive, 'GOTO');

  /// @nodoc
  Parser ifToken() => ref1(tokenInsensitive, 'IF');

  /// @nodoc
  Parser thenToken() => ref1(tokenInsensitive, 'THEN');

  /// @nodoc
  Parser elseToken() => ref1(tokenInsensitive, 'ELSE');

  /// @nodoc
  Parser returnToken() => ref1(tokenInsensitive, 'RETURN');

  /// @nodoc
  Parser functionToken() => ref1(tokenInsensitive, 'FUNCTION');

  /// @nodoc
  Parser endToken() => ref1(tokenInsensitive, 'END');

  /// @nodoc
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

  // BUILT-IN FUNCTIONS

  /// @nodoc
  Parser versionToken() => ref1(tokenInsensitive, 'version');

  /// @nodoc
  Parser loadToken() => ref1(tokenInsensitive, 'load');

  /// @nodoc
  Parser existsToken() => ref1(tokenInsensitive, 'exists');

  /// @nodoc
  Parser storeToken() => ref1(tokenInsensitive, 'store');

  /// @nodoc
  Parser deleteToken() => ref1(tokenInsensitive, 'delete');

  /// @nodoc
  Parser mapExistsToken() => ref1(tokenInsensitive, 'mapexists');

  /// @nodoc
  Parser mapGetToken() => ref1(tokenInsensitive, 'mapget');

  /// @nodoc
  Parser mapStoreToken() => ref1(tokenInsensitive, 'mapstore');

  /// @nodoc
  Parser mapDeleteToken() => ref1(tokenInsensitive, 'mapdelete');

  /// @nodoc
  Parser randomToken() => ref1(tokenInsensitive, 'random');

  /// @nodoc
  Parser scidToken() => ref1(tokenInsensitive, 'scid');

  /// @nodoc
  Parser blidToken() => ref1(tokenInsensitive, 'blid');

  /// @nodoc
  Parser txidToken() => ref1(tokenInsensitive, 'txid');

  /// @nodoc
  Parser deroToken() => ref1(tokenInsensitive, 'dero');

  /// @nodoc
  Parser blockHeightToken() => ref1(tokenInsensitive, 'block_height');

  /// @nodoc
  Parser blockTimestampToken() => ref1(tokenInsensitive, 'block_timestamp');

  /// @nodoc
  Parser signerToken() => ref1(tokenInsensitive, 'signer');

  /// @nodoc
  Parser updateScCodeToken() => ref1(tokenInsensitive, 'update_sc_code');

  /// @nodoc
  Parser isAddressValidToken() => ref1(tokenInsensitive, 'is_address_valid');

  /// @nodoc
  Parser addressRawToken() => ref1(tokenInsensitive, 'address_raw');

  /// @nodoc
  Parser addressStringToken() => ref1(tokenInsensitive, 'address_string');

  /// @nodoc
  Parser sendDeroToAddressToken() =>
      ref1(tokenInsensitive, 'send_dero_to_address');

  /// @nodoc
  Parser sendAssetToAddressToken() =>
      ref1(tokenInsensitive, 'send_asset_to_address');

  /// @nodoc
  Parser deroValueToken() => ref1(tokenInsensitive, 'derovalue');

  /// @nodoc
  Parser assetValueToken() => ref1(tokenInsensitive, 'assetvalue');

  /// @nodoc
  Parser atoiToken() => ref1(tokenInsensitive, 'atoi');

  /// @nodoc
  Parser itoaToken() => ref1(tokenInsensitive, 'itoa');

  /// @nodoc
  Parser sha256Token() => ref1(tokenInsensitive, 'sha256');

  /// @nodoc
  Parser sha3256Token() => ref1(tokenInsensitive, 'sha3256');

  /// @nodoc
  Parser keccak256Token() => ref1(tokenInsensitive, 'keccak256');

  /// @nodoc
  Parser hexToken() => ref1(tokenInsensitive, 'hex');

  /// @nodoc
  Parser hexDecodeToken() => ref1(tokenInsensitive, 'hexdecode');

  /// @nodoc
  Parser minToken() => ref1(tokenInsensitive, 'min');

  /// @nodoc
  Parser maxToken() => ref1(tokenInsensitive, 'max');

  /// @nodoc
  Parser strlenToken() => ref1(tokenInsensitive, 'strlen');

  /// @nodoc
  Parser substrToken() => ref1(tokenInsensitive, 'substr');

  /// @nodoc
  Parser panicToken() => ref1(tokenInsensitive, 'panic');

  /// @nodoc
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

  /// @nodoc
  Parser smartContract() =>
      ref0(functionExpression).trim(ref0(hiddenStuffWhitespace)).plus();

  /// @nodoc
  Parser assignmentOperator() => ref1(tokenSensitive, '=');

  /// @nodoc
  Parser additiveOperator() =>
      ref1(tokenSensitive, '+') | ref1(tokenSensitive, '-');

  /// @nodoc
  Parser multiplicativeOperator() =>
      ref1(tokenSensitive, '*') |
      ref1(tokenSensitive, '/') |
      ref1(tokenSensitive, '%');

  /// @nodoc
  Parser equalityOperator() =>
      ref1(tokenSensitive, '==') | ref1(tokenSensitive, '!=');

  /// @nodoc
  Parser shiftOperator() =>
      ref1(tokenSensitive, '<<') | ref1(tokenSensitive, '>>');

  Parser bitwiseOperator() =>
      ref1(tokenSensitive, '&') |
      ref1(tokenSensitive, '^') |
      ref1(tokenSensitive, '|');

  /// @nodoc
  Parser relationalOperator() =>
      ref1(tokenSensitive, '>=') |
      ref1(tokenSensitive, '>') |
      ref1(tokenSensitive, '<=') |
      ref1(tokenSensitive, '<');

  /// @nodoc
  Parser negateOperator() => ref1(tokenSensitive, '!');

  /// @nodoc
  Parser arithmeticExpression() =>
      ref0(bitwiseExpression) | ref0(arithmeticExpressionInParentheses);

  /// @nodoc
  Parser arithmeticExpressionInParentheses() =>
      ref1(tokenSensitive, '(') &
      ref0(arithmeticExpression) &
      ref1(tokenSensitive, ')');

  /// @nodoc
  Parser booleanExpression() =>
      ref0(logicalOrExpression) |
      ref0(negateOperator) & ref0(booleanExpression) |
      ref0(negateOperator).optional() & ref0(booleanExpressionInParentheses);

  /// @nodoc
  Parser booleanExpressionInParentheses() =>
      ref1(tokenSensitive, '(') &
      ref0(booleanExpression) &
      ref1(tokenSensitive, ')');

  /// @nodoc
  Parser logicalOrExpression() =>
      (ref0(logicalAndExpression) | ref0(booleanExpressionInParentheses)) &
      (ref1(tokenSensitive, '||') &
              (ref0(logicalAndExpression) |
                  ref0(booleanExpressionInParentheses)))
          .star();

  /// @nodoc
  Parser logicalAndExpression() =>
      (ref0(equalityExpression) | ref0(booleanExpressionInParentheses)) &
      (ref1(tokenSensitive, '&&') &
              (ref0(equalityExpression) | ref0(booleanExpressionInParentheses)))
          .star();

  /// @nodoc
  Parser equalityExpression() =>
      ref0(relationalExpression) &
      (ref0(equalityOperator) & ref0(relationalExpression)).star();

  /// @nodoc
  Parser relationalExpression() =>
      ref0(arithmeticExpression) &
      (ref0(relationalOperator) & ref0(arithmeticExpression)).star();

  /// @nodoc
  Parser bitwiseExpression() =>
      ref0(shiftExpression) &
      (ref0(bitwiseOperator) & ref0(shiftExpression)).star();

  /// @nodoc
  Parser shiftExpression() =>
      ref0(additiveExpression) &
      (ref0(shiftOperator) & ref0(additiveExpression)).star();

  /// @nodoc
  Parser additiveExpression() =>
      ref0(multiplicativeExpression) &
      (ref0(additiveOperator) & ref0(multiplicativeExpression)).star();

  /// @nodoc
  Parser multiplicativeExpression() =>
      ref0(primary) & (ref0(multiplicativeOperator) & ref0(primary)).star();

  /// @nodoc
  Parser primary() =>
      ref1(tokenSensitive, ref0(functionInvocation)) |
      ref1(tokenSensitive, ref0(literal)) |
      ref1(tokenSensitive, ref0(identifier)) |
      ref1(tokenSensitive, ref0(arithmeticExpressionInParentheses));

  /// @nodoc
  Parser literal() =>
      ref0(stringLexicalToken).flatten() | ref0(numberLexicalToken);

  /// @nodoc
  Parser identifier() => ref1(tokenSensitive, ref0(identifierLexicalToken))
      .skip(before: ref0(reservedWords).end().not());

  /// @nodoc
  Parser uint64Type() => ref1(tokenSensitive, 'Uint64');

  /// @nodoc
  Parser stringType() => ref1(tokenSensitive, 'String');

  /// @nodoc
  Parser dvmType() => ref0(uint64Type) | ref0(stringType);

  // FUNCTION INVOCATION

  /// @nodoc
  Parser functionInvocation() =>
      ref0(builtInFunctions).flatten() & ref0(functionInvocationParameterList) |
      ref0(identifier) & ref0(functionInvocationParameterList);

  /// @nodoc
  Parser functionInvocationParameterList() =>
      ref1(tokenSensitive, '(') &
          ref0(arithmeticExpression).optional() &
          ref1(tokenSensitive, ')') |
      ref1(tokenSensitive, '(') &
          ref0(arithmeticExpression) &
          ref0(functionInvocationParameterTail).optional() &
          ref1(tokenSensitive, ')');

  /// @nodoc
  Parser functionInvocationParameterTail() =>
      ref1(tokenSensitive, ',') &
      ref0(arithmeticExpression) &
      ref0(functionInvocationParameterTail).optional();

  // FUNCTION DECLARATION

  /// @nodoc
  Parser functionDeclaration() =>
      ref0(functionToken) &
      ref0(identifier) &
      ref0(functionDeclarationParameterList) &
      ref0(dvmType);

  /// @nodoc
  Parser functionDeclarationParameterList() =>
      ref1(tokenSensitive, '(') &
          ref0(functionDeclarationParameter).optional() &
          ref1(tokenSensitive, ')') |
      ref1(tokenSensitive, '(') &
          ref0(functionDeclarationParameter) &
          ref0(functionDeclarationParameterTail).optional() &
          ref1(tokenSensitive, ')');

  /// @nodoc
  Parser functionDeclarationParameter() => ref0(identifier) & ref0(dvmType);

  /// @nodoc
  Parser functionDeclarationParameterTail() =>
      ref1(tokenSensitive, ',') &
      ref0(functionDeclarationParameter) &
      ref0(functionDeclarationParameterTail).optional();

  /// @nodoc
  Parser functionExpression() =>
      ref0(functionDeclaration) & ref0(functionBody) & ref0(functionClosure);

  /// @nodoc
  Parser functionClosure() => ref0(endToken) & ref0(functionToken);

  /// @nodoc
  Parser functionBody() => ref0(line).plus();

  /// @nodoc
  Parser line() =>
      ref0(numberLexicalToken) &
      ref0(statement).trim(ref0(hiddenStuffWhitespace));

  /// @nodoc
  Parser statement() =>
      ref0(returnStatement) |
      ref0(dimStatement) |
      ref0(letStatement) |
      ref0(ifStatement) |
      ref0(gotoStatement) |
      ref0(functionInvocation);

  /// @nodoc
  Parser returnStatement() => ref0(returnToken) & ref0(arithmeticExpression);

  /// @nodoc
  Parser dimStatement() =>
      ref0(dimToken) &
      ref0(identifier) &
      ref0(dimStatementTail).optional() &
      ref0(asToken) &
      ref0(dvmType);

  /// @nodoc
  Parser dimStatementTail() =>
      ref1(tokenSensitive, ',') &
      ref0(identifier) &
      ref0(dimStatementTail).optional();

  /// @nodoc
  Parser letStatement() =>
      ref0(letToken) &
      ref0(identifier) &
      ref0(assignmentOperator) &
      ref0(arithmeticExpression);

  /// @nodoc
  Parser ifStatement() =>
      ref0(ifToken) &
      ref0(booleanExpression) &
      ref0(thenStatement) &
      ref0(elseStatement).optional();

  /// @nodoc
  Parser gotoStatement() => ref0(gotoToken) & ref0(numberLexicalToken);

  /// @nodoc
  Parser thenStatement() => ref0(thenToken) & ref0(gotoStatement);

  /// @nodoc
  Parser elseStatement() => ref0(elseToken) & ref0(gotoStatement);

  // -----------------------------------------------------------------
  // Lexical tokens.
  // -----------------------------------------------------------------

  /// @nodoc
  Parser identifierLexicalToken() => ref0(letterLexicalToken) & word().star();

  /// @nodoc
  Parser stringLexicalToken() =>
      char('"') &
          ref0(stringContentDoubleQuotedLexicalToken).star() &
          char('"') |
      char("'") &
          ref0(stringContentSingleQuotedLexicalToken).star() &
          char("'") |
      string('@"') & pattern('^"\n\r').star() & char('"') |
      string("@'") & pattern("^'\n\r").star() & char("'");

  /// @nodoc
  Parser stringContentDoubleQuotedLexicalToken() =>
      pattern('^\\"\n\r') | char('\\') & pattern('\n\r');

  /// @nodoc
  Parser stringContentSingleQuotedLexicalToken() =>
      pattern("^\\'\n\r") | char('\\') & pattern('\n\r');

  /// @nodoc
  Parser numberLexicalToken() => ref0(digitLexicalToken).plus().flatten();

  /// @nodoc
  Parser letterLexicalToken() => letter();

  /// @nodoc
  Parser digitLexicalToken() => digit();

  /// @nodoc
  Parser newlineLexicalToken() => pattern('\n\r');

  // -----------------------------------------------------------------
  // Whitespace and comments.
  // -----------------------------------------------------------------

  /// @nodoc
  Parser hiddenWhitespace() => ref0(hiddenStuffWhitespace).plus();

  /// @nodoc
  Parser hiddenStuffWhitespace() =>
      ref0(visibleWhitespace) |
      ref0(singleLineComment1) |
      ref0(singleLineComment2) |
      ref0(multiLineComment);

  /// @nodoc
  Parser visibleWhitespace() => whitespace();

  /// @nodoc
  Parser singleLineComment1() =>
      string('//') &
      ref0(newlineLexicalToken).neg().star() &
      ref0(newlineLexicalToken).optional();

  /// @nodoc
  Parser singleLineComment2() =>
      string('`') &
      ref0(newlineLexicalToken).neg().star() &
      ref0(newlineLexicalToken).optional();

  /// @nodoc
  Parser multiLineComment() =>
      string('/*') &
      (ref0(multiLineComment) | string('*/').neg()).star() &
      string('*/');
}
