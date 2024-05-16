// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Spending _$SpendingFromJson(Map<String, dynamic> json) {
  return _Spending.fromJson(json);
}

/// @nodoc
mixin _$Spending {
// ignore: invalid_annotation_target
  @JsonKey(required: true)
  @HiveField(0)
  String get description =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(required: true)
  @HiveField(1)
  int get amount =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(required: true)
  @HiveField(2)
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpendingCopyWith<Spending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingCopyWith<$Res> {
  factory $SpendingCopyWith(Spending value, $Res Function(Spending) then) =
      _$SpendingCopyWithImpl<$Res, Spending>;
  @useResult
  $Res call(
      {@JsonKey(required: true) @HiveField(0) String description,
      @JsonKey(required: true) @HiveField(1) int amount,
      @JsonKey(required: true) @HiveField(2) DateTime date});
}

/// @nodoc
class _$SpendingCopyWithImpl<$Res, $Val extends Spending>
    implements $SpendingCopyWith<$Res> {
  _$SpendingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendingImplCopyWith<$Res>
    implements $SpendingCopyWith<$Res> {
  factory _$$SpendingImplCopyWith(
          _$SpendingImpl value, $Res Function(_$SpendingImpl) then) =
      __$$SpendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(required: true) @HiveField(0) String description,
      @JsonKey(required: true) @HiveField(1) int amount,
      @JsonKey(required: true) @HiveField(2) DateTime date});
}

/// @nodoc
class __$$SpendingImplCopyWithImpl<$Res>
    extends _$SpendingCopyWithImpl<$Res, _$SpendingImpl>
    implements _$$SpendingImplCopyWith<$Res> {
  __$$SpendingImplCopyWithImpl(
      _$SpendingImpl _value, $Res Function(_$SpendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$SpendingImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingImpl implements _Spending {
  const _$SpendingImpl(
      {@JsonKey(required: true) @HiveField(0) required this.description,
      @JsonKey(required: true) @HiveField(1) required this.amount,
      @JsonKey(required: true) @HiveField(2) required this.date});

  factory _$SpendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(required: true)
  @HiveField(0)
  final String description;
// ignore: invalid_annotation_target
  @override
  @JsonKey(required: true)
  @HiveField(1)
  final int amount;
// ignore: invalid_annotation_target
  @override
  @JsonKey(required: true)
  @HiveField(2)
  final DateTime date;

  @override
  String toString() {
    return 'Spending(description: $description, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, amount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingImplCopyWith<_$SpendingImpl> get copyWith =>
      __$$SpendingImplCopyWithImpl<_$SpendingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingImplToJson(
      this,
    );
  }
}

abstract class _Spending implements Spending {
  const factory _Spending(
      {@JsonKey(required: true) @HiveField(0) required final String description,
      @JsonKey(required: true) @HiveField(1) required final int amount,
      @JsonKey(required: true)
      @HiveField(2)
      required final DateTime date}) = _$SpendingImpl;

  factory _Spending.fromJson(Map<String, dynamic> json) =
      _$SpendingImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(required: true)
  @HiveField(0)
  String get description;
  @override // ignore: invalid_annotation_target
  @JsonKey(required: true)
  @HiveField(1)
  int get amount;
  @override // ignore: invalid_annotation_target
  @JsonKey(required: true)
  @HiveField(2)
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$SpendingImplCopyWith<_$SpendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
