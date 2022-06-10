import 'package:hive/hive.dart';
import 'package:tarim_app/model/chicken.dart';



class ChickenAdapter extends TypeAdapter<Chicken>{
  @override
  final int typeId = 2;

  @override
  Chicken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int,dynamic>{
      for(int i = 0;i<numOfFields;i++) reader.readByte():reader.read(),
    };
    return Chicken(
        name: fields[0] as String?,
        age: fields[1] as String?
    );
  }

  @override
  void write(BinaryWriter writer, Chicken obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is ChickenAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}