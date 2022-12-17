// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dbasic_function_signature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DBasicFunctionSignature {
  Identifier get id => throw _privateConstructorUsedError;
  Map<Identifier, DvmType>? get params => throw _privateConstructorUsedError;
  DvmType get returnType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DBasicFunctionSignatureCopyWith<DBasicFunctionSignature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBasicFunctionSignatureCopyWith<$Res> {
  factory $DBasicFunctionSignatureCopyWith(DBasicFunctionSignature value,
          $Res Function(DBasicFunctionSignature) then) =
      _$DBasicFunctionSignatureCopyWithImpl<$Res, DBasicFunctionSignature>;
  @useResult
  $Res call(
      {Identifier id, Map<Identifier, DvmType>? params, DvmType returnType});

  $IdentifierCopyWith<$Res> get id;
}

/// @nodoc
class _$DBasicFunctionSignatureCopyWithImpl<$Res,
        $Val extends DBasicFunctionSignature>
    implements $DBasicFunctionSignatureCopyWith<$Res> {
  _$DBasicFunctionSignatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? params = freezed,
    Object? returnType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Identifier,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<Identifier, DvmType>?,
      returnType: null == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as DvmType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentifierCopyWith<$Res> get id {
    return $IdentifierCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DBasicFunctionSignatureCopyWith<$Res>
    implements $DBasicFunctionSignatureCopyWith<$Res> {
  factory _$$_DBasicFunctionSignatureCopyWith(_$_DBasicFunctionSignature value,
          $Res Function(_$_DBasicFunctionSignature) then) =
      __$$_DBasicFunctionSignatureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Identifier id, Map<Identifier, DvmType>? params, DvmType returnType});

  @override
  $IdentifierCopyWith<$Res> get id;
}

/// @nodoc
class __$$_DBasicFunctionSignatureCopyWithImpl<$Res>
    extends _$DBasicFunctionSignatureCopyWithImpl<$Res,
        _$_DBasicFunctionSignature>
    implements _$$_DBasicFunctionSignatureCopyWith<$Res> {
  __$$_DBasicFunctionSignatureCopyWithImpl(_$_DBasicFunctionSignature _value,
      $Res Function(_$_DBasicFunctionSignature) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? params = freezed,
    Object? returnType = null,
  }) {
    return _then(_$_DBasicFunctionSignature(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Identifier,
      params: freezed == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<Identifier, DvmType>?,
      returnType: null == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as DvmType,
    ));
  }
}

/// @nodoc

class _$_DBasicFunctionSignature extends _DBasicFunctionSignature {
  _$_DBasicFunctionSignature(
      {required this.id,
      final Map<Identifier, DvmType>? params,
      required this.returnType})
      : _params = params,
        super._();

  @override
  final Identifier id;
  final Map<Identifier, DvmType>? _params;
  @override
  Map<Identifier, DvmType>? get params {
    final value = _params;
    if (value == null) return null;
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DvmType returnType;

  @override
  String toString() {
    return 'DBasicFunctionSignature(id: $id, params: $params, returnType: $returnType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DBasicFunctionSignature &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._params, _params) &&
            (identical(other.returnType, returnType) ||
                other.returnType == returnType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_params), returnType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DBasicFunctionSignatureCopyWith<_$_DBasicFunctionSignature>
      get copyWith =>
          __$$_DBasicFunctionSignatureCopyWithImpl<_$_DBasicFunctionSignature>(
              this, _$identity);
}

abstract class _DBasicFunctionSignature extends DBasicFunctionSignature {
  factory _DBasicFunctionSignature(
      {required final Identifier id,
      final Map<Identifier, DvmType>? params,
      required final DvmType returnType}) = _$_DBasicFunctionSignature;
  _DBasicFunctionSignature._() : super._();

  @override
  Identifier get id;
  @override
  Map<Identifier, DvmType>? get params;
  @override
  DvmType get returnType;
  @override
  @JsonKey(ignore: true)
  _$$_DBasicFunctionSignatureCopyWith<_$_DBasicFunctionSignature>
      get copyWith => throw _privateConstructorUsedError;
}
