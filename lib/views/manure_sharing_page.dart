import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tarim_app/services/file_service.dart';
import 'package:tarim_app/views/manure_page.dart';

class ManureSharingPage extends StatefulWidget {
  const ManureSharingPage({Key? key}) : super(key: key);

  @override
  State<ManureSharingPage> createState() => _ManureSharingPageState();
}

class _ManureSharingPageState extends State<ManureSharingPage> {
  TextEditingController gubreNameController = TextEditingController();


  final FileService fileService = FileService();

  Future<File> _writeFileName(String name){
    return fileService.writeName(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gübre Ekle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: gubreNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gübre adını giriniz',
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Text("Ekle"),
                  onTap: () {
                        _writeFileName(gubreNameController.text.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ManureListPage()
                            )
                        );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
