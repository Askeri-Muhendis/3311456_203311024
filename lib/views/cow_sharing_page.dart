import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tarim_app/model/cow.dart';

import 'cow_page.dart';

class CowSharingPage extends StatefulWidget {
  const CowSharingPage({Key? key}) : super(key: key);

  @override
  State<CowSharingPage> createState() => _CowSharingPageState();
}

class _CowSharingPageState extends State<CowSharingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final _cowBox = Hive.box(COW_BOX);

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
                child: InkWell(
                  child: Text("Ekle"),
                  onTap: () {
                    _cowBox.add(Cow(
                        name: nameController.text.toString(),
                        id: idController.text.toString(),
                        age: ageController.text.toString()));
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CowListPage())
                          );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
