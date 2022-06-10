import 'dart:convert';


import 'package:http/http.dart' as http;

import '../model/apimodel.dart';
class ApiService{
  final String url = "https://raw.githubusercontent.com/Askeri-Muhendis/repojson/main/rep.json";
  Future<ApiModel?> fetchModel() async {
    var res = await http.get(Uri.parse(url));
    if(res.statusCode == 200){
      var jsonBody = ApiModel.fromJson(jsonDecode(res.body));
      print("başarlı $jsonBody");
      return jsonBody;
    }else{
      print("başarısız");
    }
  }
}