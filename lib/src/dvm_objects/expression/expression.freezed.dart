// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expression.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Expression {
  ASTNode get tree => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpressionCopyWith<Expression> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpressionCopyWith<$Res> {
  factory $ExpressionCopyWith(
          Expression value, $Res Function(Expression) then) =
      _$ExpressionCopyWithImpl<$Res, Expression>;
  @useResult
  $Res call({ASTNode tree});

  $ASTNodeCopyWith<$Res> get tree;
}

/// @nodoc
class _$ExpressionCopyWithImpl<$Res, $Val extends Expression>
    implements $ExpressionCopyWith<$Res> {
  _$ExpressionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tree = null,
  }) {
    return _then(_value.copyWith(
      tree: null == tree
          ? _value.tree
          : tree // ignore: cast_nullable_to_non_nullable
              as ASTNode,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ASTNodeCopyWith<$Res> get tree {
    return $ASTNodeCopyWith<$Res>(_value.tree, (value) {
      return _then(_value.copyWith(tree: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpressionImplCopyWith<$Res>
    implements $ExpressionCopyWith<$Res> {
  factory _$$ExpressionImplCopyWith(
          _$ExpressionImpl value, $Res Function(_$ExpressionImpl) then) =
      __$$ExpressionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ASTNode tree});

  @override
  $ASTNodeCopyWith<$Res> get tree;
}

/// @nodoc
class __$$ExpressionImplCopyWithImpl<$Res>
    extends _$ExpressionCopyWithImpl<$Res, _$ExpressionImpl>
    implements _$$ExpressionImplCopyWith<$Res> {
  __$$ExpressionImplCopyWithImpl(
      _$ExpressionImpl _value, $Res Function(_$ExpressionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tree = null,
  }) {
    return _then(_$ExpressionImpl(
      null == tree
          ? _value.tree
          : tree // ignore: cast_nullable_to_non_nullable
              as ASTNode,
    ));
  }
}

/// @nodoc

class _$ExpressionImpl extends _Expression {
  _$ExpressionImpl(this.tree) : super._();

  @override
  final ASTNode tree;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpressionImpl &&
            (identical(other.tree, tree) || other.tree == tree));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tree);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpressionImplCopyWith<_$ExpressionImpl> get copyWith =>
      __$$ExpressionImplCopyWithImpl<_$ExpressionImpl>(this, _$identity);
}

abstract class _Expression extends Expression {
  factory _Expression(final ASTNode tree) = _$ExpressionImpl;
  _Expression._() : super._();

  @override
  ASTNode get tree;
  @override
  @JsonKey(ignore: true)
  _$$ExpressionImplCopyWith<_$ExpressionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
