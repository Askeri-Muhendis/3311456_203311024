import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarim_app/services/firestore_service.dart';
import 'package:tarim_app/views/add_land_page.dart';
import 'package:tarim_app/views/land_detail_page.dart';

class LandListPage extends StatefulWidget {
  const LandListPage({Key? key}) : super(key: key);

  @override
  _LandListPageState createState() => _LandListPageState();
}

class _LandListPageState extends State<LandListPage> {

  FireStoreService landService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Arazi Listesi'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddLandPage()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: landService.getLands(),
        builder: (context, snapshot) {
          return !snapshot.hasData ? CircularProgressIndicator() : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
              return Padding(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandDetailPage(docId: documentSnapshot.id)),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(
                                documentSnapshot["land"],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
