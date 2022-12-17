import 'package:dero_dvm_basic/src/dvm_objects/dbasic_function/dbasic_function.dart';
import 'package:dero_dvm_basic/src/dvm_objects/dbasic_function/dbasic_function_signature.dart';
import 'package:dero_dvm_basic/src/dvm_objects/dvm_object/dvm_object.dart';
import 'package:dero_dvm_basic/src/exceptions/dbasic_repository_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dbasic_smart_contract.freezed.dart';

/// The representation of a DVM-BASIC smart contract.
@unfreezed
class DBasicSmartContract extends DvmObject with _$DBasicSmartContract {
  DBasicSmartContract._();

  factory DBasicSmartContract({
    String? name,
    required Map<String, DBasicFunction> functions,
  }) = _DBasicSmartContract;

  @override
  String toDBasicCode() {
    return functions.values.map((e) => e.toDBasicCode()).toList().join('\n\n');
  }

  /// Given a name, returns the function [DBasicFunction] if it exists in the
  /// smart contract.
  DBasicFunction getFunction(String name) {
    var function = functions[name];
    if (function == null) {
      throw DBasicRepositoryException('This function does not exist');
    }
    return function;
  }

  /// Given a name, returns the function signature [DBasicFunctionSignature]
  /// if the function exists in the smart contract.
  DBasicFunctionSignature getFunctionSignature(String name) {
    var function = getFunction(name);
    return function.functionSignature;
  }

  /// Returns all function signatures.
  List<DBasicFunctionSignature> getAllFunctionSignatures() {
    return functions.values.map((e) => e.functionSignature).toList();
  }

  /// Returns all functions with invalid line numbers.
  List<DBasicFunction> getFunctionsWithInvalidLineNumbers() {
    List<DBasicFunction> res = [];
    functions.values.map((func) {
      if (!func.isLineNumbersValid()) {
        res.add(func);
      }
    }).toList();
    return res;
  }

  /// Returns all functions with invalid Goto.
  List<DBasicFunction> getFunctionsWithInvalidGoto() {
    List<DBasicFunction> res = [];
    functions.values.map((func) {
      if (!func.isAllGotoValid()) {
        res.add(func);
      }
    }).toList();
    return res;
  }

  /// Pretty prints all function signatures.
  void prettyPrintFunctionSignatures() {
    for (var func in functions.values) {
      var signature = func.functionSignature;
      print(
          'Function: ${signature.id.name} - params : ${signature.params} - returnType : ${signature.returnType}');
    }
  }
}
