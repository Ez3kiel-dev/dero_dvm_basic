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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DBasicFunctionSignature {
  Identifier get id => throw _privateConstructorUsedError;
  Map<Identifier, DBasicType>? get params => throw _privateConstructorUsedError;
  DBasicType get returnType => throw _privateConstructorUsedError;

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
      {Identifier id,
      Map<Identifier, DBasicType>? params,
      DBasicType returnType});

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
              as Map<Identifier, DBasicType>?,
      returnType: null == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as DBasicType,
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
abstract class _$$DBasicFunctionSignatureImplCopyWith<$Res>
    implements $DBasicFunctionSignatureCopyWith<$Res> {
  factory _$$DBasicFunctionSignatureImplCopyWith(
          _$DBasicFunctionSignatureImpl value,
          $Res Function(_$DBasicFunctionSignatureImpl) then) =
      __$$DBasicFunctionSignatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Identifier id,
      Map<Identifier, DBasicType>? params,
      DBasicType returnType});

  @override
  $IdentifierCopyWith<$Res> get id;
}

/// @nodoc
class __$$DBasicFunctionSignatureImplCopyWithImpl<$Res>
    extends _$DBasicFunctionSignatureCopyWithImpl<$Res,
        _$DBasicFunctionSignatureImpl>
    implements _$$DBasicFunctionSignatureImplCopyWith<$Res> {
  __$$DBasicFunctionSignatureImplCopyWithImpl(
      _$DBasicFunctionSignatureImpl _value,
      $Res Function(_$DBasicFunctionSignatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? params = freezed,
    Object? returnType = null,
  }) {
    return _then(_$DBasicFunctionSignatureImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Identifier,
      params: freezed == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<Identifier, DBasicType>?,
      returnType: null == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as DBasicType,
    ));
  }
}

/// @nodoc

class _$DBasicFunctionSignatureImpl extends _DBasicFunctionSignature {
  _$DBasicFunctionSignatureImpl(
      {required this.id,
      final Map<Identifier, DBasicType>? params,
      required this.returnType})
      : _params = params,
        super._();

  @override
  final Identifier id;
  final Map<Identifier, DBasicType>? _params;
  @override
  Map<Identifier, DBasicType>? get params {
    final value = _params;
    if (value == null) return null;
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DBasicType returnType;

  @override
  String toString() {
    return 'DBasicFunctionSignature(id: $id, params: $params, returnType: $returnType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DBasicFunctionSignatureImpl &&
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
  _$$DBasicFunctionSignatureImplCopyWith<_$DBasicFunctionSignatureImpl>
      get copyWith => __$$DBasicFunctionSignatureImplCopyWithImpl<
          _$DBasicFunctionSignatureImpl>(this, _$identity);
}

abstract class _DBasicFunctionSignature extends DBasicFunctionSignature {
  factory _DBasicFunctionSignature(
      {required final Identifier id,
      final Map<Identifier, DBasicType>? params,
      required final DBasicType returnType}) = _$DBasicFunctionSignatureImpl;
  _DBasicFunctionSignature._() : super._();

  @override
  Identifier get id;
  @override
  Map<Identifier, DBasicType>? get params;
  @override
  DBasicType get returnType;
  @override
  @JsonKey(ignore: true)
  _$$DBasicFunctionSignatureImplCopyWith<_$DBasicFunctionSignatureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
