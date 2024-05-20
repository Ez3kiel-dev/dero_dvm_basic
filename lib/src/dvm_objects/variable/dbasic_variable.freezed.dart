// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dbasic_variable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DBasicVariable {
  String get name => throw _privateConstructorUsedError;
  DBasicValue get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DBasicVariableCopyWith<DBasicVariable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBasicVariableCopyWith<$Res> {
  factory $DBasicVariableCopyWith(
          DBasicVariable value, $Res Function(DBasicVariable) then) =
      _$DBasicVariableCopyWithImpl<$Res, DBasicVariable>;
  @useResult
  $Res call({String name, DBasicValue value});

  $DBasicValueCopyWith<$Res> get value;
}

/// @nodoc
class _$DBasicVariableCopyWithImpl<$Res, $Val extends DBasicVariable>
    implements $DBasicVariableCopyWith<$Res> {
  _$DBasicVariableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DBasicValue,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DBasicValueCopyWith<$Res> get value {
    return $DBasicValueCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DBasicVariableImplCopyWith<$Res>
    implements $DBasicVariableCopyWith<$Res> {
  factory _$$DBasicVariableImplCopyWith(_$DBasicVariableImpl value,
          $Res Function(_$DBasicVariableImpl) then) =
      __$$DBasicVariableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, DBasicValue value});

  @override
  $DBasicValueCopyWith<$Res> get value;
}

/// @nodoc
class __$$DBasicVariableImplCopyWithImpl<$Res>
    extends _$DBasicVariableCopyWithImpl<$Res, _$DBasicVariableImpl>
    implements _$$DBasicVariableImplCopyWith<$Res> {
  __$$DBasicVariableImplCopyWithImpl(
      _$DBasicVariableImpl _value, $Res Function(_$DBasicVariableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$DBasicVariableImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DBasicValue,
    ));
  }
}

/// @nodoc

class _$DBasicVariableImpl extends _DBasicVariable {
  _$DBasicVariableImpl({required this.name, required this.value}) : super._();

  @override
  final String name;
  @override
  final DBasicValue value;

  @override
  String toString() {
    return 'DBasicVariable(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DBasicVariableImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DBasicVariableImplCopyWith<_$DBasicVariableImpl> get copyWith =>
      __$$DBasicVariableImplCopyWithImpl<_$DBasicVariableImpl>(
          this, _$identity);
}

abstract class _DBasicVariable extends DBasicVariable {
  factory _DBasicVariable(
      {required final String name,
      required final DBasicValue value}) = _$DBasicVariableImpl;
  _DBasicVariable._() : super._();

  @override
  String get name;
  @override
  DBasicValue get value;
  @override
  @JsonKey(ignore: true)
  _$$DBasicVariableImplCopyWith<_$DBasicVariableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
