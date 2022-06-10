import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tarim_app/views/cow_sharing_page.dart';
import '../model/cow.dart';
import '../services/cow_services.dart';


const COW_BOX = 'cowdb';
class CowListPage extends StatefulWidget {
  const CowListPage({Key? key}) : super(key: key);



  @override
  State<CowListPage> createState() => _CowListPageState();
}

class _CowListPageState extends State<CowListPage> {

  final _cowBox = Hive.box(COW_BOX);
  final nameAlertControler = TextEditingController();
  final idAlertControler = TextEditingController();
  final ageAlertControler = TextEditingController();
  @override
  void initState() {
    super.initState();
    _cowBox.values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Büyükbaş Hayvan"),
      ),
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CowSharingPage()
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
                valueListenable: _cowBox.listenable(),
                builder: (context,box,widget){
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CowSatiri(
                          name: _cowBox.values.elementAt(index).name,
                          id : _cowBox.values.elementAt(index).id,
                          age: _cowBox.values.elementAt(index).age,
                          onSilinme: (){
                            _cowBox.deleteAt(index);
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
                                              _cowBox.values.elementAt(index).name = value;
                                            });
                                          },
                                          controller: nameAlertControler,
                                          decoration: InputDecoration(hintText: _cowBox.values.elementAt(index).name.toString()),
                                        ),
                                        TextField(
                                          onChanged: (value){
                                            setState(() {
                                              _cowBox.values.elementAt(index).id = value;
                                            });
                                          },
                                          controller: idAlertControler,
                                          decoration: InputDecoration(hintText: _cowBox.values.elementAt(index).id.toString()),
                                        ),
                                        TextField(
                                          onChanged: (value){
                                            setState(() {
                                              _cowBox.values.elementAt(index).age = value;
                                            });
                                          },
                                          controller: ageAlertControler,
                                          decoration: InputDecoration(hintText: _cowBox.values.elementAt(index).age.toString()),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      InkWell(
                                          onTap: (){
                                            _cowBox.putAt(
                                                index,
                                                Cow(
                                                    name: _cowBox.values.elementAt(index).name,
                                                    id: _cowBox.values.elementAt(index).id,
                                                    age: _cowBox.values.elementAt(index).age,
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
