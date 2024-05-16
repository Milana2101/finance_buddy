import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'spending.freezed.dart';

part 'spending.g.dart';

@freezed
@HiveType(typeId: 1)
class Spending with _$Spending {
  const factory Spending({
    // ignore: invalid_annotation_target
    @JsonKey(required: true) @HiveField(0) required String description,
    // ignore: invalid_annotation_target
    @JsonKey(required: true) @HiveField(1) required int amount,
    // ignore: invalid_annotation_target
    @JsonKey(required: true) @HiveField(2) required DateTime date,
  }) = _Spending;

  factory Spending.fromJson(Map<String, dynamic> json) =>
      _$SpendingFromJson(json);
}
