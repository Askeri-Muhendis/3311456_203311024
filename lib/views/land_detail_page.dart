import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarim_app/services/firestore_service.dart';

class LandDetailPage extends StatefulWidget {
  String docId;
  LandDetailPage({Key? key,required this.docId}) : super(key: key);


  @override
  _LandDetailPageState createState() => _LandDetailPageState();
}

class _LandDetailPageState extends State<LandDetailPage> {
  FireStoreService detailService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    CollectionReference land = FirebaseFirestore.instance.collection("Land");
    return FutureBuilder<DocumentSnapshot>(
      future: land.doc(widget.docId).get(),
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
                  title: Center(
                    child: Text('Arazi Detay ${snapshot.data!['land']}'),
                  )
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.1,
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 2.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Arazi Genişliği : ${snapshot.data!["weight"]}",
                                      style: TextStyle(
                                       fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.1,
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 2.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Arazi Yüksekliği : ${snapshot.data!["height"]}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.1,
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 2.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Arazi Lokasyonu : ${snapshot.data!["location"]}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.1,
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 2.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Arazi Büyüklüğü : ${snapshot.data!["size"]}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.1,
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 2.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Ekili Ürün : ${snapshot.data!["cultivatedCrop"]}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.1,
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 2.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      //bir diğer tabloya gidicek
                                      "Geçmiş Yıl Verileri : ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
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
