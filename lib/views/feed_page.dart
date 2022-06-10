import 'package:flutter/material.dart';
import 'package:tarim_app/services/firestore_service.dart';
import 'package:tarim_app/views/add_announcement_page.dart';
import 'package:tarim_app/views/announcement_list_page.dart';
import 'package:tarim_app/views/land_list_page.dart';
import 'package:tarim_app/views/question_list_page.dart';
import 'package:tarim_app/views/register_page.dart';
import 'package:tarim_app/views/social_list_page.dart';

import 'available_page.dart';

class FeedPage extends StatefulWidget {
  String userId;
  String userType;

  FeedPage({required this.userId,required this.userType});

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  FireStoreService _fireStoreService = FireStoreService();
  int index = 0;
  //var boolean = false ;
  @override
  Widget build(BuildContext context) {
    /*var userType = _fireStoreService.getUserIdType(widget.userId);
    print("userType build ${userType}");
    userType.then((value){
      print("userType then ${userType}");
      print("usertype ->fs $value");
      print("usertype -> parametre ${value}");*/
      var bottomNavigationList = [
        AnnouncementListPage(userType: widget.userType,adminId: widget.userId,),
        QuestionListPage(),
        LandListPage(),
        AvailablePage(),
      ];
      /*
      if(widget.userType == "admin"){
        boolean = true;
        print("usertype if admine eşit  ${widget.userType}");
      }else{
        boolean = false ;
        print("usertype if admine eşit değil ${widget.userType}");
      };*/
      /*
      floatingActionButton: Visibility(
        visible: boolean,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddAnnouncementPage(adminId: widget.userId)));
          },
          child: Icon(Icons.add),
        ),
      ),
       */

    return Scaffold(
      body:bottomNavigationList[index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon:Icon(Icons.announcement),
              label: "Duyurular",
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark),
              label: "Soru-Cevap"
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.landscape),
              label:"Arazi"
          ),
          BottomNavigationBarItem(
              icon:   Icon(Icons.add_outlined),
              label:  "Mevcut"
          ),
        ],
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.indigo,
        selectedItemColor: Colors.blue,
        currentIndex: index,
        onTap: (indeks){
          setState(() {
            index = indeks;
          });
        },

      ),
    );
  }
}

/*
class FeedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationList[index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon:Icon(Icons.announcement),
              label: "Duyurular"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.social_distance),
              label:"Sosyal Ağ"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label:"Soru-Cevap"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.landscape),
              label: "Araziler",
          ),
        ],
        currentIndex: index,
        onTap: (indeks){
          setState((){
            index = indeks;
          });
        },
      ),
    );
  }
}*/
