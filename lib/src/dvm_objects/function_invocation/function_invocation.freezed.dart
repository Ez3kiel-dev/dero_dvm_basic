// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'function_invocation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FunctionInvocation {
  Identifier get id => throw _privateConstructorUsedError;
  List<Expression> get params => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FunctionInvocationCopyWith<FunctionInvocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunctionInvocationCopyWith<$Res> {
  factory $FunctionInvocationCopyWith(
          FunctionInvocation value, $Res Function(FunctionInvocation) then) =
      _$FunctionInvocationCopyWithImpl<$Res, FunctionInvocation>;
  @useResult
  $Res call({Identifier id, List<Expression> params});

  $IdentifierCopyWith<$Res> get id;
}

/// @nodoc
class _$FunctionInvocationCopyWithImpl<$Res, $Val extends FunctionInvocation>
    implements $FunctionInvocationCopyWith<$Res> {
  _$FunctionInvocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Identifier,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as List<Expression>,
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
abstract class _$$_FunctionInvocationCopyWith<$Res>
    implements $FunctionInvocationCopyWith<$Res> {
  factory _$$_FunctionInvocationCopyWith(_$_FunctionInvocation value,
          $Res Function(_$_FunctionInvocation) then) =
      __$$_FunctionInvocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Identifier id, List<Expression> params});

  @override
  $IdentifierCopyWith<$Res> get id;
}

/// @nodoc
class __$$_FunctionInvocationCopyWithImpl<$Res>
    extends _$FunctionInvocationCopyWithImpl<$Res, _$_FunctionInvocation>
    implements _$$_FunctionInvocationCopyWith<$Res> {
  __$$_FunctionInvocationCopyWithImpl(
      _$_FunctionInvocation _value, $Res Function(_$_FunctionInvocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? params = null,
  }) {
    return _then(_$_FunctionInvocation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Identifier,
      params: null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<Expression>,
    ));
  }
}

/// @nodoc

class _$_FunctionInvocation extends _FunctionInvocation {
  _$_FunctionInvocation(
      {required this.id, required final List<Expression> params})
      : _params = params,
        super._();

  @override
  final Identifier id;
  final List<Expression> _params;
  @override
  List<Expression> get params {
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_params);
  }

  @override
  String toString() {
    return 'FunctionInvocation(id: $id, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FunctionInvocation &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FunctionInvocationCopyWith<_$_FunctionInvocation> get copyWith =>
      __$$_FunctionInvocationCopyWithImpl<_$_FunctionInvocation>(
          this, _$identity);
}

abstract class _FunctionInvocation extends FunctionInvocation {
  factory _FunctionInvocation(
      {required final Identifier id,
      required final List<Expression> params}) = _$_FunctionInvocation;
  _FunctionInvocation._() : super._();

  @override
  Identifier get id;
  @override
  List<Expression> get params;
  @override
  @JsonKey(ignore: true)
  _$$_FunctionInvocationCopyWith<_$_FunctionInvocation> get copyWith =>
      throw _privateConstructorUsedError;
}
