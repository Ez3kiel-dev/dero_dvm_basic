// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ast_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ASTNode {
  DvmValue? get value => throw _privateConstructorUsedError;
  bool get parentheses => throw _privateConstructorUsedError;
  Operator? get operator => throw _privateConstructorUsedError;
  ASTNode? get left => throw _privateConstructorUsedError;
  ASTNode? get right => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ASTNodeCopyWith<ASTNode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ASTNodeCopyWith<$Res> {
  factory $ASTNodeCopyWith(ASTNode value, $Res Function(ASTNode) then) =
      _$ASTNodeCopyWithImpl<$Res, ASTNode>;
  @useResult
  $Res call(
      {DvmValue? value,
      bool parentheses,
      Operator? operator,
      ASTNode? left,
      ASTNode? right});

  $ASTNodeCopyWith<$Res>? get left;
  $ASTNodeCopyWith<$Res>? get right;
}

/// @nodoc
class _$ASTNodeCopyWithImpl<$Res, $Val extends ASTNode>
    implements $ASTNodeCopyWith<$Res> {
  _$ASTNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? parentheses = null,
    Object? operator = freezed,
    Object? left = freezed,
    Object? right = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DvmValue?,
      parentheses: null == parentheses
          ? _value.parentheses
          : parentheses // ignore: cast_nullable_to_non_nullable
              as bool,
      operator: freezed == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as Operator?,
      left: freezed == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as ASTNode?,
      right: freezed == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as ASTNode?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ASTNodeCopyWith<$Res>? get left {
    if (_value.left == null) {
      return null;
    }

    return $ASTNodeCopyWith<$Res>(_value.left!, (value) {
      return _then(_value.copyWith(left: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ASTNodeCopyWith<$Res>? get right {
    if (_value.right == null) {
      return null;
    }

    return $ASTNodeCopyWith<$Res>(_value.right!, (value) {
      return _then(_value.copyWith(right: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ASTNodeImplCopyWith<$Res> implements $ASTNodeCopyWith<$Res> {
  factory _$$ASTNodeImplCopyWith(
          _$ASTNodeImpl value, $Res Function(_$ASTNodeImpl) then) =
      __$$ASTNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DvmValue? value,
      bool parentheses,
      Operator? operator,
      ASTNode? left,
      ASTNode? right});

  @override
  $ASTNodeCopyWith<$Res>? get left;
  @override
  $ASTNodeCopyWith<$Res>? get right;
}

/// @nodoc
class __$$ASTNodeImplCopyWithImpl<$Res>
    extends _$ASTNodeCopyWithImpl<$Res, _$ASTNodeImpl>
    implements _$$ASTNodeImplCopyWith<$Res> {
  __$$ASTNodeImplCopyWithImpl(
      _$ASTNodeImpl _value, $Res Function(_$ASTNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? parentheses = null,
    Object? operator = freezed,
    Object? left = freezed,
    Object? right = freezed,
  }) {
    return _then(_$ASTNodeImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DvmValue?,
      parentheses: null == parentheses
          ? _value.parentheses
          : parentheses // ignore: cast_nullable_to_non_nullable
              as bool,
      operator: freezed == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as Operator?,
      left: freezed == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as ASTNode?,
      right: freezed == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as ASTNode?,
    ));
  }
}

/// @nodoc

class _$ASTNodeImpl extends _ASTNode {
  _$ASTNodeImpl(
      {this.value,
      this.parentheses = false,
      this.operator,
      this.left,
      this.right})
      : super._();

  @override
  final DvmValue? value;
  @override
  @JsonKey()
  final bool parentheses;
  @override
  final Operator? operator;
  @override
  final ASTNode? left;
  @override
  final ASTNode? right;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ASTNodeImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.parentheses, parentheses) ||
                other.parentheses == parentheses) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.right, right) || other.right == right));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, value, parentheses, operator, left, right);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ASTNodeImplCopyWith<_$ASTNodeImpl> get copyWith =>
      __$$ASTNodeImplCopyWithImpl<_$ASTNodeImpl>(this, _$identity);
}

abstract class _ASTNode extends ASTNode {
  factory _ASTNode(
      {final DvmValue? value,
      final bool parentheses,
      final Operator? operator,
      final ASTNode? left,
      final ASTNode? right}) = _$ASTNodeImpl;
  _ASTNode._() : super._();

  @override
  DvmValue? get value;
  @override
  bool get parentheses;
  @override
  Operator? get operator;
  @override
  ASTNode? get left;
  @override
  ASTNode? get right;
  @override
  @JsonKey(ignore: true)
  _$$ASTNodeImplCopyWith<_$ASTNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
