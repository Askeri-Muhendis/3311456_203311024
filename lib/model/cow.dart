import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Cow extends HiveObject{
  //açıklama dosyamız
  @HiveField(0)
  String? name;

  //tamamlanma dosyamız
  @HiveField(1)
  String? id;

  @HiveField(2)
  String? age;

  Cow({
    required this.name,
    required this.id,
    required this.age
  });
}