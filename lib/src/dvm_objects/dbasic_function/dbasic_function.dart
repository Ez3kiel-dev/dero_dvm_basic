import 'package:dero_dvm_basic/dero_dvm_basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dbasic_function.freezed.dart';

/// The representation of a DVM-BASIC function.
@freezed
class DBasicFunction extends DvmObject with _$DBasicFunction {
  DBasicFunction._();

  factory DBasicFunction({
    required DBasicFunctionSignature functionSignature,
    Map<int, DvmObject>? lines,
    Map<int, int>? lineNumbersIndex,
    List<int>? lineNumbers,
  }) = _DBasicFunction;

  @override
  String toDBasicCode() {
    List<String> res = lineNumbers
            ?.map((lineNumber) =>
                '$lineNumber ${lines![lineNumber]?.toDBasicCode()}')
            .toList() ??
        [];
    // print(res);
    return '${functionSignature.toDBasicCode()}\n${res.join('\n')}\nEnd Function';
  }

  /// Returns all the instructions.
  List<DvmObject>? get dvmObjects => lines?.values.toList();

  /// Returns the instruction, given its number.
  DvmObject? getInstruction(int number) {
    if (lines != null && lineNumbers != null) {
      bool numberExist = lineNumbers?.contains(number) ?? false;
      if (numberExist) {
        return lines![number];
      }
    }
    return null;
  }

  /// Checks whether all line numbers are consistent.
  bool isLineNumbersValid() {
    if (lineNumbersIndex?.length != null) {
      int? current = lineNumbersIndex![0];
      for (var index = 1; index < lineNumbersIndex!.length; index += 1) {
        if (lineNumbersIndex![index]! <= current!) {
          return false;
        }
        current = lineNumbersIndex![index];
      }
    }
    return true;
  }

  /// Checks whether all Goto are consistent.
  bool isAllGotoValid() {
    if (lines != null) {
      var statements = lines!.values;
      for (var statement in statements) {
        if (statement is IfStatement) {
          int thenGoto = statement.thenGoto.line;
          int? elseGoto = statement.elseGoto?.line;
          List<int> numbers = lineNumbers ?? [];
          if (!numbers.contains(thenGoto)) {
            return false;
          }
          if (elseGoto != null) {
            if (!numbers.contains(elseGoto)) {
              return false;
            }
          }
        }
      }
    }
    return true;
  }
}
