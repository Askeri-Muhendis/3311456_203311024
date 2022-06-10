import 'package:hive/hive.dart';
import 'package:tarim_app/model/sheep.dart';

import '../model/cow.dart';

class SheepAdapter extends TypeAdapter<Sheep>{
  @override
  final int typeId = 1;

  @override
  Sheep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int,dynamic>{
      for(int i = 0;i<numOfFields;i++) reader.readByte():reader.read(),
    };
    return Sheep(
        name: fields[0] as String?,
        id: fields[1] as String?,
        age: fields[2] as String?,
        yun: fields[3] as String?
    );
  }

  @override
  void write(BinaryWriter writer, Sheep obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.yun);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is SheepAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}