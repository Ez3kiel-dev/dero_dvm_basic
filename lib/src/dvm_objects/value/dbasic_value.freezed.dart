// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dbasic_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DBasicValue {
  DBasicType get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DBasicType type, int valueUint64) uint64,
    required TResult Function(DBasicType type, String valueString) string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DBasicType type, int valueUint64)? uint64,
    TResult? Function(DBasicType type, String valueString)? string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DBasicType type, int valueUint64)? uint64,
    TResult Function(DBasicType type, String valueString)? string,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DBasicUint64 value) uint64,
    required TResult Function(DBasicString value) string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DBasicUint64 value)? uint64,
    TResult? Function(DBasicString value)? string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DBasicUint64 value)? uint64,
    TResult Function(DBasicString value)? string,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DBasicValueCopyWith<DBasicValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBasicValueCopyWith<$Res> {
  factory $DBasicValueCopyWith(
          DBasicValue value, $Res Function(DBasicValue) then) =
      _$DBasicValueCopyWithImpl<$Res, DBasicValue>;
  @useResult
  $Res call({DBasicType type});
}

/// @nodoc
class _$DBasicValueCopyWithImpl<$Res, $Val extends DBasicValue>
    implements $DBasicValueCopyWith<$Res> {
  _$DBasicValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DBasicType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DBasicUint64ImplCopyWith<$Res>
    implements $DBasicValueCopyWith<$Res> {
  factory _$$DBasicUint64ImplCopyWith(
          _$DBasicUint64Impl value, $Res Function(_$DBasicUint64Impl) then) =
      __$$DBasicUint64ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DBasicType type, int valueUint64});
}

/// @nodoc
class __$$DBasicUint64ImplCopyWithImpl<$Res>
    extends _$DBasicValueCopyWithImpl<$Res, _$DBasicUint64Impl>
    implements _$$DBasicUint64ImplCopyWith<$Res> {
  __$$DBasicUint64ImplCopyWithImpl(
      _$DBasicUint64Impl _value, $Res Function(_$DBasicUint64Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? valueUint64 = null,
  }) {
    return _then(_$DBasicUint64Impl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DBasicType,
      valueUint64: null == valueUint64
          ? _value.valueUint64
          : valueUint64 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DBasicUint64Impl extends DBasicUint64 {
  _$DBasicUint64Impl({this.type = DBasicType.uint64, required this.valueUint64})
      : super._();

  @override
  @JsonKey()
  final DBasicType type;
  @override
  final int valueUint64;

  @override
  String toString() {
    return 'DBasicValue.uint64(type: $type, valueUint64: $valueUint64)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DBasicUint64Impl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.valueUint64, valueUint64) ||
                other.valueUint64 == valueUint64));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, valueUint64);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DBasicUint64ImplCopyWith<_$DBasicUint64Impl> get copyWith =>
      __$$DBasicUint64ImplCopyWithImpl<_$DBasicUint64Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DBasicType type, int valueUint64) uint64,
    required TResult Function(DBasicType type, String valueString) string,
  }) {
    return uint64(type, valueUint64);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DBasicType type, int valueUint64)? uint64,
    TResult? Function(DBasicType type, String valueString)? string,
  }) {
    return uint64?.call(type, valueUint64);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DBasicType type, int valueUint64)? uint64,
    TResult Function(DBasicType type, String valueString)? string,
    required TResult orElse(),
  }) {
    if (uint64 != null) {
      return uint64(type, valueUint64);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DBasicUint64 value) uint64,
    required TResult Function(DBasicString value) string,
  }) {
    return uint64(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DBasicUint64 value)? uint64,
    TResult? Function(DBasicString value)? string,
  }) {
    return uint64?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DBasicUint64 value)? uint64,
    TResult Function(DBasicString value)? string,
    required TResult orElse(),
  }) {
    if (uint64 != null) {
      return uint64(this);
    }
    return orElse();
  }
}

abstract class DBasicUint64 extends DBasicValue {
  factory DBasicUint64(
      {final DBasicType type,
      required final int valueUint64}) = _$DBasicUint64Impl;
  DBasicUint64._() : super._();

  @override
  DBasicType get type;
  int get valueUint64;
  @override
  @JsonKey(ignore: true)
  _$$DBasicUint64ImplCopyWith<_$DBasicUint64Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DBasicStringImplCopyWith<$Res>
    implements $DBasicValueCopyWith<$Res> {
  factory _$$DBasicStringImplCopyWith(
          _$DBasicStringImpl value, $Res Function(_$DBasicStringImpl) then) =
      __$$DBasicStringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DBasicType type, String valueString});
}

/// @nodoc
class __$$DBasicStringImplCopyWithImpl<$Res>
    extends _$DBasicValueCopyWithImpl<$Res, _$DBasicStringImpl>
    implements _$$DBasicStringImplCopyWith<$Res> {
  __$$DBasicStringImplCopyWithImpl(
      _$DBasicStringImpl _value, $Res Function(_$DBasicStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? valueString = null,
  }) {
    return _then(_$DBasicStringImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DBasicType,
      valueString: null == valueString
          ? _value.valueString
          : valueString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DBasicStringImpl extends DBasicString {
  _$DBasicStringImpl({this.type = DBasicType.string, required this.valueString})
      : super._();

  @override
  @JsonKey()
  final DBasicType type;
  @override
  final String valueString;

  @override
  String toString() {
    return 'DBasicValue.string(type: $type, valueString: $valueString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DBasicStringImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.valueString, valueString) ||
                other.valueString == valueString));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, valueString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DBasicStringImplCopyWith<_$DBasicStringImpl> get copyWith =>
      __$$DBasicStringImplCopyWithImpl<_$DBasicStringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DBasicType type, int valueUint64) uint64,
    required TResult Function(DBasicType type, String valueString) string,
  }) {
    return string(type, valueString);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DBasicType type, int valueUint64)? uint64,
    TResult? Function(DBasicType type, String valueString)? string,
  }) {
    return string?.call(type, valueString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DBasicType type, int valueUint64)? uint64,
    TResult Function(DBasicType type, String valueString)? string,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(type, valueString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DBasicUint64 value) uint64,
    required TResult Function(DBasicString value) string,
  }) {
    return string(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DBasicUint64 value)? uint64,
    TResult? Function(DBasicString value)? string,
  }) {
    return string?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DBasicUint64 value)? uint64,
    TResult Function(DBasicString value)? string,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(this);
    }
    return orElse();
  }
}

abstract class DBasicString extends DBasicValue {
  factory DBasicString(
      {final DBasicType type,
      required final String valueString}) = _$DBasicStringImpl;
  DBasicString._() : super._();

  @override
  DBasicType get type;
  String get valueString;
  @override
  @JsonKey(ignore: true)
  _$$DBasicStringImplCopyWith<_$DBasicStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
