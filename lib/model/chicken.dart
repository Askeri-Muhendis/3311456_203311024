import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Chicken extends HiveObject{

  @HiveField(0)
  String? name;



  @HiveField(2)
  String? age;

  Chicken({
    required this.name,
    required this.age,
  });
}