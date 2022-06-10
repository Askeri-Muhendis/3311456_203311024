import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tarim_app/model/chicken.dart';
import 'package:tarim_app/services/chicken_services.dart';
import 'package:tarim_app/views/chicken_sharing_page.dart';
const CHICKEN_BOX = 'chickendb';
class ChickenListPage extends StatefulWidget {
  const ChickenListPage({Key? key}) : super(key: key);

  @override
  State<ChickenListPage> createState() => _ChickenListPageState();
}

class _ChickenListPageState extends State<ChickenListPage> {

  final _chickenBox = Hive.box(CHICKEN_BOX);
  final nameAlertControler = TextEditingController();
  final ageAlertControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chickenBox.values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tavuk"),
      ),
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChickenSharingPage()
                )
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<Box>(
                valueListenable: _chickenBox.listenable(),
                builder: (context,box,widget){
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChickenService(
                          name: _chickenBox.values.elementAt(index).name,
                          age: _chickenBox.values.elementAt(index).age,
                          onSilinme: (){
                            _chickenBox.deleteAt(index);
                          },
                          onEdit: (){
                            //düzenleme
                            //_gorevBox.putAt(index, Gorev(aciklama: "aciklama edit",tamamlanma: true));
                            showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Text("Düzenleme"),
                                    content: Column(
                                      children: [
                                        TextField(
                                          onChanged: (value){
                                            setState(() {
                                              _chickenBox.values.elementAt(index).name = value;
                                            });
                                          },
                                          controller: nameAlertControler,
                                          decoration: InputDecoration(hintText: _chickenBox.values.elementAt(index).name.toString()),
                                        ),

                                        TextField(
                                          onChanged: (value){
                                            setState(() {
                                              _chickenBox.values.elementAt(index).age = value;
                                            });
                                          },
                                          controller: ageAlertControler,
                                          decoration: InputDecoration(hintText: _chickenBox.values.elementAt(index).age.toString()),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      InkWell(
                                          onTap: (){
                                            _chickenBox.putAt(
                                                index,
                                                Chicken(
                                                  name: _chickenBox.values.elementAt(index).name,
                                                  age: _chickenBox.values.elementAt(index).age,
                                                )
                                            );
                                            Navigator.pop(context);
                                          },
                                          child:Text("Düzenle")
                                      )
                                    ],
                                  );
                                }
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
