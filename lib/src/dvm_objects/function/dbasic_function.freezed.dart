// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dbasic_function.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DBasicFunction {
  DBasicFunctionSignature get functionSignature =>
      throw _privateConstructorUsedError;
  Map<int, DvmObject>? get lines => throw _privateConstructorUsedError;
  Map<int, int>? get lineNumbersIndex => throw _privateConstructorUsedError;
  List<int>? get lineNumbers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DBasicFunctionCopyWith<DBasicFunction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBasicFunctionCopyWith<$Res> {
  factory $DBasicFunctionCopyWith(
          DBasicFunction value, $Res Function(DBasicFunction) then) =
      _$DBasicFunctionCopyWithImpl<$Res, DBasicFunction>;
  @useResult
  $Res call(
      {DBasicFunctionSignature functionSignature,
      Map<int, DvmObject>? lines,
      Map<int, int>? lineNumbersIndex,
      List<int>? lineNumbers});

  $DBasicFunctionSignatureCopyWith<$Res> get functionSignature;
}

/// @nodoc
class _$DBasicFunctionCopyWithImpl<$Res, $Val extends DBasicFunction>
    implements $DBasicFunctionCopyWith<$Res> {
  _$DBasicFunctionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? functionSignature = null,
    Object? lines = freezed,
    Object? lineNumbersIndex = freezed,
    Object? lineNumbers = freezed,
  }) {
    return _then(_value.copyWith(
      functionSignature: null == functionSignature
          ? _value.functionSignature
          : functionSignature // ignore: cast_nullable_to_non_nullable
              as DBasicFunctionSignature,
      lines: freezed == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as Map<int, DvmObject>?,
      lineNumbersIndex: freezed == lineNumbersIndex
          ? _value.lineNumbersIndex
          : lineNumbersIndex // ignore: cast_nullable_to_non_nullable
              as Map<int, int>?,
      lineNumbers: freezed == lineNumbers
          ? _value.lineNumbers
          : lineNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DBasicFunctionSignatureCopyWith<$Res> get functionSignature {
    return $DBasicFunctionSignatureCopyWith<$Res>(_value.functionSignature,
        (value) {
      return _then(_value.copyWith(functionSignature: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DBasicFunctionImplCopyWith<$Res>
    implements $DBasicFunctionCopyWith<$Res> {
  factory _$$DBasicFunctionImplCopyWith(_$DBasicFunctionImpl value,
          $Res Function(_$DBasicFunctionImpl) then) =
      __$$DBasicFunctionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DBasicFunctionSignature functionSignature,
      Map<int, DvmObject>? lines,
      Map<int, int>? lineNumbersIndex,
      List<int>? lineNumbers});

  @override
  $DBasicFunctionSignatureCopyWith<$Res> get functionSignature;
}

/// @nodoc
class __$$DBasicFunctionImplCopyWithImpl<$Res>
    extends _$DBasicFunctionCopyWithImpl<$Res, _$DBasicFunctionImpl>
    implements _$$DBasicFunctionImplCopyWith<$Res> {
  __$$DBasicFunctionImplCopyWithImpl(
      _$DBasicFunctionImpl _value, $Res Function(_$DBasicFunctionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? functionSignature = null,
    Object? lines = freezed,
    Object? lineNumbersIndex = freezed,
    Object? lineNumbers = freezed,
  }) {
    return _then(_$DBasicFunctionImpl(
      functionSignature: null == functionSignature
          ? _value.functionSignature
          : functionSignature // ignore: cast_nullable_to_non_nullable
              as DBasicFunctionSignature,
      lines: freezed == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as Map<int, DvmObject>?,
      lineNumbersIndex: freezed == lineNumbersIndex
          ? _value._lineNumbersIndex
          : lineNumbersIndex // ignore: cast_nullable_to_non_nullable
              as Map<int, int>?,
      lineNumbers: freezed == lineNumbers
          ? _value._lineNumbers
          : lineNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$DBasicFunctionImpl extends _DBasicFunction {
  _$DBasicFunctionImpl(
      {required this.functionSignature,
      final Map<int, DvmObject>? lines,
      final Map<int, int>? lineNumbersIndex,
      final List<int>? lineNumbers})
      : _lines = lines,
        _lineNumbersIndex = lineNumbersIndex,
        _lineNumbers = lineNumbers,
        super._();

  @override
  final DBasicFunctionSignature functionSignature;
  final Map<int, DvmObject>? _lines;
  @override
  Map<int, DvmObject>? get lines {
    final value = _lines;
    if (value == null) return null;
    if (_lines is EqualUnmodifiableMapView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<int, int>? _lineNumbersIndex;
  @override
  Map<int, int>? get lineNumbersIndex {
    final value = _lineNumbersIndex;
    if (value == null) return null;
    if (_lineNumbersIndex is EqualUnmodifiableMapView) return _lineNumbersIndex;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<int>? _lineNumbers;
  @override
  List<int>? get lineNumbers {
    final value = _lineNumbers;
    if (value == null) return null;
    if (_lineNumbers is EqualUnmodifiableListView) return _lineNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DBasicFunction(functionSignature: $functionSignature, lines: $lines, lineNumbersIndex: $lineNumbersIndex, lineNumbers: $lineNumbers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DBasicFunctionImpl &&
            (identical(other.functionSignature, functionSignature) ||
                other.functionSignature == functionSignature) &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            const DeepCollectionEquality()
                .equals(other._lineNumbersIndex, _lineNumbersIndex) &&
            const DeepCollectionEquality()
                .equals(other._lineNumbers, _lineNumbers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      functionSignature,
      const DeepCollectionEquality().hash(_lines),
      const DeepCollectionEquality().hash(_lineNumbersIndex),
      const DeepCollectionEquality().hash(_lineNumbers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DBasicFunctionImplCopyWith<_$DBasicFunctionImpl> get copyWith =>
      __$$DBasicFunctionImplCopyWithImpl<_$DBasicFunctionImpl>(
          this, _$identity);
}

abstract class _DBasicFunction extends DBasicFunction {
  factory _DBasicFunction(
      {required final DBasicFunctionSignature functionSignature,
      final Map<int, DvmObject>? lines,
      final Map<int, int>? lineNumbersIndex,
      final List<int>? lineNumbers}) = _$DBasicFunctionImpl;
  _DBasicFunction._() : super._();

  @override
  DBasicFunctionSignature get functionSignature;
  @override
  Map<int, DvmObject>? get lines;
  @override
  Map<int, int>? get lineNumbersIndex;
  @override
  List<int>? get lineNumbers;
  @override
  @JsonKey(ignore: true)
  _$$DBasicFunctionImplCopyWith<_$DBasicFunctionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
