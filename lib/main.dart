import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tarim_app/common/chicken_g.dart';
import 'package:tarim_app/common/sheep_g.dart';
import 'package:tarim_app/views/chicken_page.dart';
import 'package:tarim_app/views/cow_page.dart';
import 'package:tarim_app/views/login_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tarim_app/views/sheep_page.dart';
import 'common/cow_g.dart';

void main() async {
  //firebase kullanabilmemiz için işlemler yapıcaz
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //veritabanı ile ilgili herhangi bir işlem yapmadan önce hive db başlatmalıyız
  await Hive.initFlutter();

  //adapter'in kaydedilmesi
  Hive.registerAdapter(CowAdapter());
  Hive.registerAdapter(SheepAdapter());
  Hive.registerAdapter(ChickenAdapter());
  //Hive_generator paketi çoğunlukla her sınıf için TypeAdapter'ı otomatik olarak luşturur
  //bir model sınıfının

  //box-kutu oluşturma
  await Hive.openBox(COW_BOX);
  await Hive.openBox(SHEEP_BOX);
  await Hive.openBox(CHICKEN_BOX);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

