
class ApiModel{

  String? name;
  String? fiyat;

  ApiModel({
    this.name,
    this.fiyat
  });


  ApiModel.fromJson(Map<String,dynamic> json){
    name = json["name"]?.toString();
    fiyat = json["fiyat"]?.toString();
  }

  Map<String,dynamic> toJson(){
    final data = <String,dynamic>{};
    data["name"] = name;
    data["fiyat"] = fiyat;
    return data;
  }

}