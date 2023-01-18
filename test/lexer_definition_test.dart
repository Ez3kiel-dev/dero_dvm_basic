import 'dart:io';
import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:petitparser/reflection.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

const String assetContract = 'asset.bas';
const String assetExchangeContract = 'asset_exchange.bas';
const String holdDeroPokerContract = 'holdero_poker.bas';
const String lotteryContract = 'lottery.bas';
const String nameServiceContract = 'nameservice.bas';
const String tokenContract = 'token.bas';
const String registryContract = 'registry_contract.bas';
const String swapContract = 'swap_contract.bas';
const String tokenPieswapContract = 'token_contract.bas';
const String gnomonContract = 'gnomon_contract.bas';
const String keystoreContract = 'keystore_contract.bas';
const String privateIslandContract = 'private_island_contract.bas';

void main() {
  final lexer = DeroBasicLexer();

  test('Grammar linter', () {
    expect(linter(lexer.build()), isEmpty);
  });

  group('Lexer', () {
    test('asset contract', () async {
      var filePath = p.join(
          Directory.current.path, 'playground/smart_contracts', assetContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    test('asset exchange contract', () async {
      var filePath = p.join(Directory.current.path,
          'playground/smart_contracts', assetExchangeContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    test('hold Dero poker contract', () async {
      var filePath = p.join(Directory.current.path,
          'playground/smart_contracts', holdDeroPokerContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    test('lottery contract', () async {
      var filePath = p.join(Directory.current.path,
          'playground/smart_contracts', lotteryContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(dBasicRepository1.sc.toDBasicCode(),
          dBasicRepository2.sc.toDBasicCode());
    });

    test('name service contract', () async {
      var filePath = p.join(Directory.current.path,
          'playground/smart_contracts', nameServiceContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    test('registry contract', () async {
      var filePath = p.join(Directory.current.path,
          'playground/smart_contracts', registryContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    test('swap contract', () async {
      var filePath = p.join(
          Directory.current.path, 'playground/smart_contracts', swapContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    test('token contract', () async {
      var filePath = p.join(
          Directory.current.path, 'playground/smart_contracts', tokenContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    test('token pieswap contract', () async {
      var filePath = p.join(Directory.current.path,
          'playground/smart_contracts', tokenPieswapContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    test('gnomon contract', () async {
      var filePath = p.join(
          Directory.current.path, 'playground/smart_contracts', gnomonContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    test('keystore contract', () async {
      var filePath = p.join(
          Directory.current.path, 'playground/smart_contracts', gnomonContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });

    /*test('private island contract', () async {
      var filePath = p.join(Directory.current.path,
          'playground/smart_contracts', privateIslandContract);
      File file = File(filePath);
      String data = await file.readAsString();
      var dBasicRepository1 = DBasicRepository.loadSmartContract(data);

      var code = dBasicRepository1.sc.toDBasicCode();

      var dBasicRepository2 = DBasicRepository.loadSmartContract(code);

      expect(true, dBasicRepository1.sc == dBasicRepository2.sc);
    });*/
  });
}
