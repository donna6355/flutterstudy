// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaryAdapter extends TypeAdapter<Diary> {
  @override
  final int typeId = 1;

  @override
  Diary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Diary(
      date: fields[0] as String,
      feel: fields[26] as double,
      dryFood: fields[1] as double,
      wetFood: fields[2] as double,
      water: fields[3] as double,
      waterySnack: fields[4] as bool,
      drySnack: fields[5] as bool,
      otherSnack: fields[24] as bool,
      snack: fields[6] as bool,
      pee: fields[7] as double,
      poo: fields[8] as double,
      hairBall: fields[9] as bool,
      diarrhea: fields[10] as bool,
      vomit: fields[11] as bool,
      destroy: fields[12] as bool,
      vet: fields[13] as bool,
      vaccine: fields[14] as bool,
      pill: fields[15] as bool,
      eyeDrop: fields[16] as bool,
      hunting: fields[17] as bool,
      brushTeeth: fields[18] as bool,
      brushFur: fields[19] as bool,
      clawCut: fields[25] as bool,
      bath: fields[20] as bool,
      toilet: fields[21] as bool,
      note: fields[22] as String,
      photos: (fields[23] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Diary obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.dryFood)
      ..writeByte(2)
      ..write(obj.wetFood)
      ..writeByte(3)
      ..write(obj.water)
      ..writeByte(4)
      ..write(obj.waterySnack)
      ..writeByte(5)
      ..write(obj.drySnack)
      ..writeByte(6)
      ..write(obj.snack)
      ..writeByte(7)
      ..write(obj.pee)
      ..writeByte(8)
      ..write(obj.poo)
      ..writeByte(9)
      ..write(obj.hairBall)
      ..writeByte(10)
      ..write(obj.diarrhea)
      ..writeByte(11)
      ..write(obj.vomit)
      ..writeByte(12)
      ..write(obj.destroy)
      ..writeByte(13)
      ..write(obj.vet)
      ..writeByte(14)
      ..write(obj.vaccine)
      ..writeByte(15)
      ..write(obj.pill)
      ..writeByte(16)
      ..write(obj.eyeDrop)
      ..writeByte(17)
      ..write(obj.hunting)
      ..writeByte(18)
      ..write(obj.brushTeeth)
      ..writeByte(19)
      ..write(obj.brushFur)
      ..writeByte(20)
      ..write(obj.bath)
      ..writeByte(21)
      ..write(obj.toilet)
      ..writeByte(22)
      ..write(obj.note)
      ..writeByte(23)
      ..write(obj.photos)
      ..writeByte(24)
      ..write(obj.otherSnack)
      ..writeByte(25)
      ..write(obj.clawCut)
      ..writeByte(26)
      ..write(obj.feel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
