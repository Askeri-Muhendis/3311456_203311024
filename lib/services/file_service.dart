import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class FileService {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/gubre.txt');
  }


  Future<String> readGubre() async {
    try {
      final file = await _localFile;


      final contents = await file.readAsString();

      return contents;
    } catch (e) {

      return "";
    }
  }



  Future<File> writeName(String gubre) async {
    final file = await _localFile;


    return file.writeAsString(gubre);
  }

}