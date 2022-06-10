import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarim_app/views/add_question_page.dart';

import '../services/firestore_service.dart';

class QuestionListPage extends StatefulWidget {
  const QuestionListPage({Key? key}) : super(key: key);

  @override
  _QuestionListPageState createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {

  FireStoreService questionService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Soru Duvarı ')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuestionAddPage()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: questionService.getQuestions(),
        builder: (context, snapshot) {
          return !snapshot.hasData ? CircularProgressIndicator() : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
              return Padding(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: (){

                  },
                  child: Card(
                    shadowColor: Colors.blue,
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<QuerySnapshot>(
                              builder:(context, userId) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        backgroundImage: AssetImage("assets/images/tree.jpg")
                                    ),
                                    Spacer(),
                                    Text("Kullanıcı Adı"),
                                    Spacer(),
                                    Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          documentSnapshot["date"],
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,

                                          ),
                                        )
                                    ),

                                  ],
                                );
                              }),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(documentSnapshot["question"],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${documentSnapshot["location"]}",maxLines: 10,style: TextStyle(fontSize: 15),),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.comment)),
                              Spacer(),
                            ],
                          )
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
