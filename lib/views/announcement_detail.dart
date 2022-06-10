import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarim_app/services/firestore_service.dart';

class AnnouncementDetail extends StatefulWidget {
  //firebase için id gelicek veriler burada çekilecek static için bir kaç veriyi pass ediyoruz
  String docId;

  AnnouncementDetail({
    Key? key,
    required this.docId,
  }) : super(key: key);

  @override
  _AnnouncementDetailState createState() => _AnnouncementDetailState();
}

class _AnnouncementDetailState extends State<AnnouncementDetail> {
  FireStoreService detailService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    CollectionReference announcement = FirebaseFirestore.instance.collection(
        'Announcement');
    return FutureBuilder<DocumentSnapshot>(
      future: announcement.doc(widget.docId).get(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: Container(
                      width: size.height,
                      height: size.width,
                      color: Colors.white,
                      //progress bar gelicek
                      child: Text('Loading...')
                  )
              );
            default:
              return Scaffold(
                appBar: AppBar(
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: Image.asset("assets/images/tree.jpg")
                            .image,
                        radius: 20,
                      ),
                      Spacer(),
                      Text(
                          "${snapshot.data!["userId"]}",
                          style: TextStyle(fontSize: 12),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                          width: size.width,
                          height: size.height / 3,
                          child: Image.network(
                              "${snapshot.data!['image']}",
                              fit: BoxFit.fill,
                          ),
                      ),
                      Container(
                        color: Colors.grey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${snapshot.data!["comment"]}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat"),
                                  textDirection: TextDirection.rtl,
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
          }
        }
      },
    );
  }
}

/**Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.grey,
    title: Row(
    children: [
    Text("TARİM"),
    Spacer(),
    Text(
    "",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    Spacer(),
    Text(
    "",
    style: TextStyle(
    color: Colors.white,
    fontSize: 14
    ),
    ),
    ],
    ),
    ),
    body: Column(
    children: [

    ],
    ));
 * */
