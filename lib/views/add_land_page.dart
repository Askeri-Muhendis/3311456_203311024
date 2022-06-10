import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarim_app/services/firestore_service.dart';

class AddLandPage extends StatefulWidget {
  const AddLandPage({Key? key}) : super(key: key);

  @override
  _AddLandPageState createState() => _AddLandPageState();
}

class _AddLandPageState extends State<AddLandPage> {
  //controller
  TextEditingController landController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController cultivatedCropController = TextEditingController();
  //service
  final FireStoreService _landService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arazi Ekle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: landController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Arazi Adı',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widthController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Genişlik',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: heightController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Yükseklik',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: locationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Konum',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sizeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Büyüklük',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cultivatedCropController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ekili Ürün',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  _landService.addLand(
                    landController.text,
                    widthController.text,
                    heightController.text,
                    locationController.text,
                    sizeController.text,
                    cultivatedCropController.text
                  );
                  Navigator.pop(context);
                },
                child: Text('Ekle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
