import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tarim_app/services/firestore_service.dart';

class AddAnnouncementPage extends StatefulWidget {
  String adminId;


  AddAnnouncementPage({Key? key, required this.adminId}) : super(key: key);

  @override
  _AddAnnouncementPageState createState() => _AddAnnouncementPageState();
}

class _AddAnnouncementPageState extends State<AddAnnouncementPage> {
  //controller
  TextEditingController commentController = TextEditingController();

  //Service
  final FireStoreService _fireStoreService = FireStoreService();

  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var profileImage;

  Widget imagePlace(){
    double height = MediaQuery.of(context).size.height;
    if(profileImage != null){
      print("profileImage : ${profileImage}");
      return CircleAvatar(
        backgroundImage: FileImage(File(profileImage.path)),
        radius: height * 0.08,
      );
    }else{
      if(_pickImage != null){
        print("profileImage _pickImage if $_pickImage");
        return CircleAvatar(
          backgroundImage: NetworkImage(_pickImage),
        );
      }else{
        print("profileImage assets");
        return CircleAvatar(
          backgroundImage: AssetImage("assets/images/tree.jpg"),
          radius: height * 0.08,
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Duyuru Ekle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.blue,width: 2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          controller: commentController,
                          decoration: InputDecoration(
                            hintText: "Duyuruyu Yazın",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Colors.white)
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color : Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color:Colors.white),
                            )
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: imagePlace(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => _onImageButtonPressed(
                                ImageSource.camera,
                                context : context
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 30,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () => _onImageButtonPressed(
                                ImageSource.gallery,
                                context:context
                              ),
                              child: Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            ),
            SizedBox(
              height: size.height * .35
            ),
            Padding(
                padding: EdgeInsets.only(left: 8.0,right: 8,bottom: 25),
                child: InkWell(
                  onTap: (){
                    //announcement service gelicek
                    _fireStoreService.addAnnouncement(
                        widget.adminId,
                        commentController.text,
                        "date",
                        profileImage ?? ""
                    ).then((value){
                      Fluttertoast.showToast(
                          msg: "Duyuru Eklendi",
                          timeInSecForIosWeb: 2,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.grey[600],
                          textColor: Colors.white,
                          fontSize: 14
                      );
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          "Ekle",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }

  void _onImageButtonPressed(ImageSource source,{required BuildContext context}) async {
    try{
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        profileImage = pickedFile;
        print("Dosyaya geldik : $profileImage");
        if(profileImage != null){
          print("profile image boş değil ");
        }
      });
    }catch(e){
      setState(() {
        _pickImage = e ;
        print("Image error : " + _pickImage);
      });
    }
  }
}
