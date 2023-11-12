// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'if_statement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IfStatement {
  Expression get booleanExpression => throw _privateConstructorUsedError;
  Goto get thenGoto => throw _privateConstructorUsedError;
  Goto? get elseGoto => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IfStatementCopyWith<IfStatement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IfStatementCopyWith<$Res> {
  factory $IfStatementCopyWith(
          IfStatement value, $Res Function(IfStatement) then) =
      _$IfStatementCopyWithImpl<$Res, IfStatement>;
  @useResult
  $Res call({Expression booleanExpression, Goto thenGoto, Goto? elseGoto});

  $ExpressionCopyWith<$Res> get booleanExpression;
  $GotoCopyWith<$Res> get thenGoto;
  $GotoCopyWith<$Res>? get elseGoto;
}

/// @nodoc
class _$IfStatementCopyWithImpl<$Res, $Val extends IfStatement>
    implements $IfStatementCopyWith<$Res> {
  _$IfStatementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? booleanExpression = null,
    Object? thenGoto = null,
    Object? elseGoto = freezed,
  }) {
    return _then(_value.copyWith(
      booleanExpression: null == booleanExpression
          ? _value.booleanExpression
          : booleanExpression // ignore: cast_nullable_to_non_nullable
              as Expression,
      thenGoto: null == thenGoto
          ? _value.thenGoto
          : thenGoto // ignore: cast_nullable_to_non_nullable
              as Goto,
      elseGoto: freezed == elseGoto
          ? _value.elseGoto
          : elseGoto // ignore: cast_nullable_to_non_nullable
              as Goto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpressionCopyWith<$Res> get booleanExpression {
    return $ExpressionCopyWith<$Res>(_value.booleanExpression, (value) {
      return _then(_value.copyWith(booleanExpression: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GotoCopyWith<$Res> get thenGoto {
    return $GotoCopyWith<$Res>(_value.thenGoto, (value) {
      return _then(_value.copyWith(thenGoto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GotoCopyWith<$Res>? get elseGoto {
    if (_value.elseGoto == null) {
      return null;
    }

    return $GotoCopyWith<$Res>(_value.elseGoto!, (value) {
      return _then(_value.copyWith(elseGoto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IfStatementImplCopyWith<$Res>
    implements $IfStatementCopyWith<$Res> {
  factory _$$IfStatementImplCopyWith(
          _$IfStatementImpl value, $Res Function(_$IfStatementImpl) then) =
      __$$IfStatementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Expression booleanExpression, Goto thenGoto, Goto? elseGoto});

  @override
  $ExpressionCopyWith<$Res> get booleanExpression;
  @override
  $GotoCopyWith<$Res> get thenGoto;
  @override
  $GotoCopyWith<$Res>? get elseGoto;
}

/// @nodoc
class __$$IfStatementImplCopyWithImpl<$Res>
    extends _$IfStatementCopyWithImpl<$Res, _$IfStatementImpl>
    implements _$$IfStatementImplCopyWith<$Res> {
  __$$IfStatementImplCopyWithImpl(
      _$IfStatementImpl _value, $Res Function(_$IfStatementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? booleanExpression = null,
    Object? thenGoto = null,
    Object? elseGoto = freezed,
  }) {
    return _then(_$IfStatementImpl(
      booleanExpression: null == booleanExpression
          ? _value.booleanExpression
          : booleanExpression // ignore: cast_nullable_to_non_nullable
              as Expression,
      thenGoto: null == thenGoto
          ? _value.thenGoto
          : thenGoto // ignore: cast_nullable_to_non_nullable
              as Goto,
      elseGoto: freezed == elseGoto
          ? _value.elseGoto
          : elseGoto // ignore: cast_nullable_to_non_nullable
              as Goto?,
    ));
  }
}

/// @nodoc

class _$IfStatementImpl extends _IfStatement {
  _$IfStatementImpl(
      {required this.booleanExpression, required this.thenGoto, this.elseGoto})
      : super._();

  @override
  final Expression booleanExpression;
  @override
  final Goto thenGoto;
  @override
  final Goto? elseGoto;

  @override
  String toString() {
    return 'IfStatement(booleanExpression: $booleanExpression, thenGoto: $thenGoto, elseGoto: $elseGoto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IfStatementImpl &&
            (identical(other.booleanExpression, booleanExpression) ||
                other.booleanExpression == booleanExpression) &&
            (identical(other.thenGoto, thenGoto) ||
                other.thenGoto == thenGoto) &&
            (identical(other.elseGoto, elseGoto) ||
                other.elseGoto == elseGoto));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, booleanExpression, thenGoto, elseGoto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IfStatementImplCopyWith<_$IfStatementImpl> get copyWith =>
      __$$IfStatementImplCopyWithImpl<_$IfStatementImpl>(this, _$identity);
}

abstract class _IfStatement extends IfStatement {
  factory _IfStatement(
      {required final Expression booleanExpression,
      required final Goto thenGoto,
      final Goto? elseGoto}) = _$IfStatementImpl;
  _IfStatement._() : super._();

  @override
  Expression get booleanExpression;
  @override
  Goto get thenGoto;
  @override
  Goto? get elseGoto;
  @override
  @JsonKey(ignore: true)
  _$$IfStatementImplCopyWith<_$IfStatementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
