// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dim_statement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DimStatement {
  List<String> get identifiers => throw _privateConstructorUsedError;
  DBasicType get declaredType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DimStatementCopyWith<DimStatement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DimStatementCopyWith<$Res> {
  factory $DimStatementCopyWith(
          DimStatement value, $Res Function(DimStatement) then) =
      _$DimStatementCopyWithImpl<$Res, DimStatement>;
  @useResult
  $Res call({List<String> identifiers, DBasicType declaredType});
}

/// @nodoc
class _$DimStatementCopyWithImpl<$Res, $Val extends DimStatement>
    implements $DimStatementCopyWith<$Res> {
  _$DimStatementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifiers = null,
    Object? declaredType = null,
  }) {
    return _then(_value.copyWith(
      identifiers: null == identifiers
          ? _value.identifiers
          : identifiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      declaredType: null == declaredType
          ? _value.declaredType
          : declaredType // ignore: cast_nullable_to_non_nullable
              as DBasicType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DimStatementImplCopyWith<$Res>
    implements $DimStatementCopyWith<$Res> {
  factory _$$DimStatementImplCopyWith(
          _$DimStatementImpl value, $Res Function(_$DimStatementImpl) then) =
      __$$DimStatementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> identifiers, DBasicType declaredType});
}

/// @nodoc
class __$$DimStatementImplCopyWithImpl<$Res>
    extends _$DimStatementCopyWithImpl<$Res, _$DimStatementImpl>
    implements _$$DimStatementImplCopyWith<$Res> {
  __$$DimStatementImplCopyWithImpl(
      _$DimStatementImpl _value, $Res Function(_$DimStatementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifiers = null,
    Object? declaredType = null,
  }) {
    return _then(_$DimStatementImpl(
      identifiers: null == identifiers
          ? _value._identifiers
          : identifiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      declaredType: null == declaredType
          ? _value.declaredType
          : declaredType // ignore: cast_nullable_to_non_nullable
              as DBasicType,
    ));
  }
}

/// @nodoc

class _$DimStatementImpl extends _DimStatement {
  _$DimStatementImpl(
      {required final List<String> identifiers, required this.declaredType})
      : _identifiers = identifiers,
        super._();

  final List<String> _identifiers;
  @override
  List<String> get identifiers {
    if (_identifiers is EqualUnmodifiableListView) return _identifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_identifiers);
  }

  @override
  final DBasicType declaredType;

  @override
  String toString() {
    return 'DimStatement(identifiers: $identifiers, declaredType: $declaredType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DimStatementImpl &&
            const DeepCollectionEquality()
                .equals(other._identifiers, _identifiers) &&
            (identical(other.declaredType, declaredType) ||
                other.declaredType == declaredType));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_identifiers), declaredType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DimStatementImplCopyWith<_$DimStatementImpl> get copyWith =>
      __$$DimStatementImplCopyWithImpl<_$DimStatementImpl>(this, _$identity);
}

abstract class _DimStatement extends DimStatement {
  factory _DimStatement(
      {required final List<String> identifiers,
      required final DBasicType declaredType}) = _$DimStatementImpl;
  _DimStatement._() : super._();

  @override
  List<String> get identifiers;
  @override
  DBasicType get declaredType;
  @override
  @JsonKey(ignore: true)
  _$$DimStatementImplCopyWith<_$DimStatementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
