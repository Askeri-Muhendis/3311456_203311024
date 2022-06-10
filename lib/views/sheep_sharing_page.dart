import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tarim_app/model/sheep.dart';
import 'package:tarim_app/views/sheep_page.dart';

import 'cow_page.dart';

class SheepSharingPage extends StatefulWidget {
  const SheepSharingPage({Key? key}) : super(key: key);

  @override
  State<SheepSharingPage> createState() => _SheepSharingPageState();
}

class _SheepSharingPageState extends State<SheepSharingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController yunController = TextEditingController();
  final _sheepBox = Hive.box(SHEEP_BOX);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Büyükbaş Ekle"),
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
                  labelText: 'Hayvanınızın adı',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: idController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Hayvanınızın küpe numarası',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Hayvanınızın yaşı',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: yunController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Hayvanınızın yün durumu',
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Text("Ekle"),
                  onTap: () {
                    _sheepBox.add(Sheep(
                        name: nameController.text.toString(),
                        id: idController.text.toString(),
                        age: ageController.text.toString(),
                        yun: yunController.text.toString()
                    )
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SheepListPage())
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
