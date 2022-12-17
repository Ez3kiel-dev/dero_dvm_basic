// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_statement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnStatement {
  Expression get expression => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnStatementCopyWith<ReturnStatement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnStatementCopyWith<$Res> {
  factory $ReturnStatementCopyWith(
          ReturnStatement value, $Res Function(ReturnStatement) then) =
      _$ReturnStatementCopyWithImpl<$Res, ReturnStatement>;
  @useResult
  $Res call({Expression expression});
}

/// @nodoc
class _$ReturnStatementCopyWithImpl<$Res, $Val extends ReturnStatement>
    implements $ReturnStatementCopyWith<$Res> {
  _$ReturnStatementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expression = null,
  }) {
    return _then(_value.copyWith(
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as Expression,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnStatementCopyWith<$Res>
    implements $ReturnStatementCopyWith<$Res> {
  factory _$$_ReturnStatementCopyWith(
          _$_ReturnStatement value, $Res Function(_$_ReturnStatement) then) =
      __$$_ReturnStatementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Expression expression});
}

/// @nodoc
class __$$_ReturnStatementCopyWithImpl<$Res>
    extends _$ReturnStatementCopyWithImpl<$Res, _$_ReturnStatement>
    implements _$$_ReturnStatementCopyWith<$Res> {
  __$$_ReturnStatementCopyWithImpl(
      _$_ReturnStatement _value, $Res Function(_$_ReturnStatement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expression = null,
  }) {
    return _then(_$_ReturnStatement(
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as Expression,
    ));
  }
}

/// @nodoc

class _$_ReturnStatement extends _ReturnStatement {
  _$_ReturnStatement({required this.expression}) : super._();

  @override
  final Expression expression;

  @override
  String toString() {
    return 'ReturnStatement(expression: $expression)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnStatement &&
            (identical(other.expression, expression) ||
                other.expression == expression));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expression);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnStatementCopyWith<_$_ReturnStatement> get copyWith =>
      __$$_ReturnStatementCopyWithImpl<_$_ReturnStatement>(this, _$identity);
}

abstract class _ReturnStatement extends ReturnStatement {
  factory _ReturnStatement({required final Expression expression}) =
      _$_ReturnStatement;
  _ReturnStatement._() : super._();

  @override
  Expression get expression;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnStatementCopyWith<_$_ReturnStatement> get copyWith =>
      throw _privateConstructorUsedError;
}
