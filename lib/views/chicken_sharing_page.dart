import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tarim_app/model/chicken.dart';
import 'package:tarim_app/views/chicken_page.dart';

class ChickenSharingPage extends StatefulWidget {
  const ChickenSharingPage({Key? key}) : super(key: key);

  @override
  State<ChickenSharingPage> createState() => _ChickenSharingPageState();
}

class _ChickenSharingPageState extends State<ChickenSharingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final _cowBox = Hive.box(CHICKEN_BOX);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tavk Ekle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tavuk adı',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tavuk yaşı',
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Text("Ekle"),
                  onTap: () {
                    _cowBox.add(Chicken(
                        name: nameController.text.toString(),
                        age: ageController.text.toString()));
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChickenListPage())
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
