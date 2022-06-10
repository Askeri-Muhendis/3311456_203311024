import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarim_app/model/announcement.dart';
import 'package:tarim_app/services/firestore_service.dart';
import 'package:tarim_app/views/add_announcement_page.dart';
import 'package:tarim_app/views/announcement_detail.dart';

class AnnouncementListPage extends StatefulWidget {
  String userType;
  String adminId;

  AnnouncementListPage({required this.userType, required this.adminId});

  @override
  _AnnouncementListPageState createState() => _AnnouncementListPageState();
}

class _AnnouncementListPageState extends State<AnnouncementListPage> {
  //firestore service
  FireStoreService _fireStoreService = FireStoreService();

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    if (widget.userType == "admin") {
      visible = true;
      print("Admin giriş yaptı");
    } else {
      visible = false;
      print("Kullanıcı giriş yaptı");
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Duyurular"), Icon(Icons.announcement)
                    ])
        ),
      ),
      floatingActionButton: Visibility(
        visible: visible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddAnnouncementPage(adminId: widget.adminId)));
          },
          child: Icon(Icons.add),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          //stream: //status service gelicek
          stream: _fireStoreService.getAnnouncements(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length, //listenin eleman sayısı
                    itemBuilder: (context, index) {
                      DocumentSnapshot myAnnouncement = snapshot.data!.docs[index];
                      //silmek için acılacak pencere
                      Future<void> _showChoiseDialog(BuildContext context) {
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Silmek istediğinize emin misiniz ? ",
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                content: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          //status service remove
                                          _fireStoreService.removeAnnouncement(myAnnouncement.id);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Evet",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          //dialogu kapatıyor
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Vazgeç",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }

                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              //detay sayfasına gitmesi gerekli
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AnnouncementDetail(docId:myAnnouncement.id,)));
                              },
                            //item görünümümüzün olduğu yer burası
                            child: Card(
                              shadowColor: Colors.blue,
                              elevation: 3.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StreamBuilder<QuerySnapshot>(
                                        stream: _fireStoreService.getPerson(),
                                        builder:(context, userId) {
                                          return Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  getData(widget.adminId);
                                                },
                                                child: Text(""),
                                              ),
                                              CircleAvatar(
                                                backgroundImage: AssetImage("assets/images/tree.jpg")
                                              ),
                                              Spacer(),
                                              Text("${myAnnouncement["userId"]}"),
                                              Spacer(),
                                              Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(
                                                    myAnnouncement["date"],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey,

                                                    ),
                                                  )
                                              ),

                                            ],
                                          );
                                        }),
                                    SizedBox(height: 10,),
                                    Center(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12.0),
                                          child: Image.network(myAnnouncement["image"],fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        myAnnouncement["comment"],
                                        maxLines: 10,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Spacer(),
                                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                                        Spacer(),
                                        IconButton(onPressed: (){}, icon: Icon(Icons.comment)),
                                        Spacer(),
                                        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                                        Spacer(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                      )
                      );
                    });
          }),
    );
  }

  /*Widget itemRow(Announcement  list){
    return Card(
      shadowColor: Colors.blue,
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<QuerySnapshot>(
              //stream:_fireStoreService.getPerson(),
              builder:(context, userId) {
                if(!userId.hasData){
                  return Text("Hata oluştu");
                }else{
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0,bottom: 10.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/tree.jpg"),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          getData(widget.adminId);
                        },
                        child: Text("Tıkla"),
                      ),
                      Spacer(),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Tarih",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey
                            ),
                          )
                      ),
                    ],
                  );
                }
              }),
            Text(
                //"${snapshot["comment"]}",
            ),
          ],
        ),
      ),
    );
  }*/

  void getData(String userId) {
    late var user;
    user = _fireStoreService.getUserData(userId);
    print("user verileri -> ${user}");
    return user;
  }
}
