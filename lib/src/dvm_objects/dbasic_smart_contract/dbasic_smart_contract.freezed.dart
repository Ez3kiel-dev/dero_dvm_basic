// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dbasic_smart_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DBasicSmartContract {
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  Map<String, DBasicFunction> get functions =>
      throw _privateConstructorUsedError;
  set functions(Map<String, DBasicFunction> value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DBasicSmartContractCopyWith<DBasicSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBasicSmartContractCopyWith<$Res> {
  factory $DBasicSmartContractCopyWith(
          DBasicSmartContract value, $Res Function(DBasicSmartContract) then) =
      _$DBasicSmartContractCopyWithImpl<$Res, DBasicSmartContract>;
  @useResult
  $Res call({String? name, Map<String, DBasicFunction> functions});
}

/// @nodoc
class _$DBasicSmartContractCopyWithImpl<$Res, $Val extends DBasicSmartContract>
    implements $DBasicSmartContractCopyWith<$Res> {
  _$DBasicSmartContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? functions = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      functions: null == functions
          ? _value.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as Map<String, DBasicFunction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DBasicSmartContractCopyWith<$Res>
    implements $DBasicSmartContractCopyWith<$Res> {
  factory _$$_DBasicSmartContractCopyWith(_$_DBasicSmartContract value,
          $Res Function(_$_DBasicSmartContract) then) =
      __$$_DBasicSmartContractCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, Map<String, DBasicFunction> functions});
}

/// @nodoc
class __$$_DBasicSmartContractCopyWithImpl<$Res>
    extends _$DBasicSmartContractCopyWithImpl<$Res, _$_DBasicSmartContract>
    implements _$$_DBasicSmartContractCopyWith<$Res> {
  __$$_DBasicSmartContractCopyWithImpl(_$_DBasicSmartContract _value,
      $Res Function(_$_DBasicSmartContract) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? functions = null,
  }) {
    return _then(_$_DBasicSmartContract(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      functions: null == functions
          ? _value.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as Map<String, DBasicFunction>,
    ));
  }
}

/// @nodoc

class _$_DBasicSmartContract extends _DBasicSmartContract {
  _$_DBasicSmartContract({this.name, required this.functions}) : super._();

  @override
  String? name;
  @override
  Map<String, DBasicFunction> functions;

  @override
  String toString() {
    return 'DBasicSmartContract(name: $name, functions: $functions)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DBasicSmartContractCopyWith<_$_DBasicSmartContract> get copyWith =>
      __$$_DBasicSmartContractCopyWithImpl<_$_DBasicSmartContract>(
          this, _$identity);
}

abstract class _DBasicSmartContract extends DBasicSmartContract {
  factory _DBasicSmartContract(
      {String? name,
      required Map<String, DBasicFunction> functions}) = _$_DBasicSmartContract;
  _DBasicSmartContract._() : super._();

  @override
  String? get name;
  set name(String? value);
  @override
  Map<String, DBasicFunction> get functions;
  set functions(Map<String, DBasicFunction> value);
  @override
  @JsonKey(ignore: true)
  _$$_DBasicSmartContractCopyWith<_$_DBasicSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
