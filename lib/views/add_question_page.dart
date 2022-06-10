import 'package:flutter/material.dart';
import 'package:tarim_app/services/firestore_service.dart';

class QuestionAddPage extends StatefulWidget {
  const QuestionAddPage({Key? key}) : super(key: key);

  @override
  _QuestionAddPageState createState() => _QuestionAddPageState();
}

class _QuestionAddPageState extends State<QuestionAddPage> {
  TextEditingController questionController = TextEditingController();
  TextEditingController scopeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController yieldController = TextEditingController();

  FireStoreService _questionService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soru Sor"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: questionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Soruyu yazınız ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: scopeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sorunuzun Alanı',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: locationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lokasyon Yeri',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: yieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ekili Ürün',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap : () {
                  _questionService.addQuestion(
                      "userId",
                      questionController.text,
                      "Tarih",
                      scopeController.text,
                      locationController.text,
                      yieldController.text
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
