// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Goto {
  int get line => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GotoCopyWith<Goto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GotoCopyWith<$Res> {
  factory $GotoCopyWith(Goto value, $Res Function(Goto) then) =
      _$GotoCopyWithImpl<$Res, Goto>;
  @useResult
  $Res call({int line});
}

/// @nodoc
class _$GotoCopyWithImpl<$Res, $Val extends Goto>
    implements $GotoCopyWith<$Res> {
  _$GotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
  }) {
    return _then(_value.copyWith(
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GotoImplCopyWith<$Res> implements $GotoCopyWith<$Res> {
  factory _$$GotoImplCopyWith(
          _$GotoImpl value, $Res Function(_$GotoImpl) then) =
      __$$GotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int line});
}

/// @nodoc
class __$$GotoImplCopyWithImpl<$Res>
    extends _$GotoCopyWithImpl<$Res, _$GotoImpl>
    implements _$$GotoImplCopyWith<$Res> {
  __$$GotoImplCopyWithImpl(_$GotoImpl _value, $Res Function(_$GotoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
  }) {
    return _then(_$GotoImpl(
      null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GotoImpl extends _Goto {
  _$GotoImpl(this.line) : super._();

  @override
  final int line;

  @override
  String toString() {
    return 'Goto(line: $line)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GotoImpl &&
            (identical(other.line, line) || other.line == line));
  }

  @override
  int get hashCode => Object.hash(runtimeType, line);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GotoImplCopyWith<_$GotoImpl> get copyWith =>
      __$$GotoImplCopyWithImpl<_$GotoImpl>(this, _$identity);
}

abstract class _Goto extends Goto {
  factory _Goto(final int line) = _$GotoImpl;
  _Goto._() : super._();

  @override
  int get line;
  @override
  @JsonKey(ignore: true)
  _$$GotoImplCopyWith<_$GotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
