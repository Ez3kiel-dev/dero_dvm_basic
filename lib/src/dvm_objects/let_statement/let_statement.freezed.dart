// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'let_statement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LetStatement {
  String get identifier => throw _privateConstructorUsedError;
  Expression get expression => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LetStatementCopyWith<LetStatement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetStatementCopyWith<$Res> {
  factory $LetStatementCopyWith(
          LetStatement value, $Res Function(LetStatement) then) =
      _$LetStatementCopyWithImpl<$Res, LetStatement>;
  @useResult
  $Res call({String identifier, Expression expression});

  $ExpressionCopyWith<$Res> get expression;
}

/// @nodoc
class _$LetStatementCopyWithImpl<$Res, $Val extends LetStatement>
    implements $LetStatementCopyWith<$Res> {
  _$LetStatementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? expression = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as Expression,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpressionCopyWith<$Res> get expression {
    return $ExpressionCopyWith<$Res>(_value.expression, (value) {
      return _then(_value.copyWith(expression: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LetStatementImplCopyWith<$Res>
    implements $LetStatementCopyWith<$Res> {
  factory _$$LetStatementImplCopyWith(
          _$LetStatementImpl value, $Res Function(_$LetStatementImpl) then) =
      __$$LetStatementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identifier, Expression expression});

  @override
  $ExpressionCopyWith<$Res> get expression;
}

/// @nodoc
class __$$LetStatementImplCopyWithImpl<$Res>
    extends _$LetStatementCopyWithImpl<$Res, _$LetStatementImpl>
    implements _$$LetStatementImplCopyWith<$Res> {
  __$$LetStatementImplCopyWithImpl(
      _$LetStatementImpl _value, $Res Function(_$LetStatementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? expression = null,
  }) {
    return _then(_$LetStatementImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as Expression,
    ));
  }
}

/// @nodoc

class _$LetStatementImpl extends _LetStatement {
  _$LetStatementImpl({required this.identifier, required this.expression})
      : super._();

  @override
  final String identifier;
  @override
  final Expression expression;

  @override
  String toString() {
    return 'LetStatement(identifier: $identifier, expression: $expression)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LetStatementImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.expression, expression) ||
                other.expression == expression));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, expression);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LetStatementImplCopyWith<_$LetStatementImpl> get copyWith =>
      __$$LetStatementImplCopyWithImpl<_$LetStatementImpl>(this, _$identity);
}

abstract class _LetStatement extends LetStatement {
  factory _LetStatement(
      {required final String identifier,
      required final Expression expression}) = _$LetStatementImpl;
  _LetStatement._() : super._();

  @override
  String get identifier;
  @override
  Expression get expression;
  @override
  @JsonKey(ignore: true)
  _$$LetStatementImplCopyWith<_$LetStatementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
