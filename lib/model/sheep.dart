import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Sheep extends HiveObject{

  @HiveField(0)
  String? name;


  @HiveField(1)
  String? id;

  @HiveField(2)
  String? age;

  @HiveField(3)
  String? yun;

  Sheep({
    required this.name,
    required this.id,
    required this.age,
    required this.yun
  });
}