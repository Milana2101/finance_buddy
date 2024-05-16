// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpendingAdapter extends TypeAdapter<Spending> {
  @override
  final int typeId = 1;

  @override
  Spending read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Spending(
      description: fields[0] as String,
      amount: fields[1] as int,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Spending obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpendingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpendingImpl _$$SpendingImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['description', 'amount', 'date'],
  );
  return _$SpendingImpl(
    description: json['description'] as String,
    amount: (json['amount'] as num).toInt(),
    date: DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$$SpendingImplToJson(_$SpendingImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };
