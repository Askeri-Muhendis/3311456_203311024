import 'package:hive/hive.dart';

import '../model/cow.dart';

class CowAdapter extends TypeAdapter<Cow>{
  @override
  final int typeId = 0;

  @override
  Cow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int,dynamic>{
      for(int i = 0;i<numOfFields;i++) reader.readByte():reader.read(),
    };
    return Cow(
        name: fields[0] as String?,
        id: fields[1] as String?,
        age: fields[2] as String?
    );
  }

  @override
  void write(BinaryWriter writer, Cow obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is CowAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}