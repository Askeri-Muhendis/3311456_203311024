import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tarim_app/model/sheep.dart';
import 'package:tarim_app/services/sheep_service.dart';
import 'package:tarim_app/views/sheep_sharing_page.dart';

const SHEEP_BOX ="sheepdb";
class SheepListPage extends StatefulWidget {
  const SheepListPage({Key? key}) : super(key: key);

  @override
  State<SheepListPage> createState() => _SheepListPageState();
}

class _SheepListPageState extends State<SheepListPage> {
  final _sheepBox = Hive.box(SHEEP_BOX);
  final nameAlertControler = TextEditingController();
  final idAlertControler = TextEditingController();
  final ageAlertControler = TextEditingController();
  final yunAlertControler = TextEditingController();
  @override
  void initState() {
    super.initState();
    _sheepBox.values;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Küçükbaş Hayvan"),
      ),
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SheepSharingPage()
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
                valueListenable: _sheepBox.listenable(),
                builder: (context,box,widget){
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SheepService(
                          name: _sheepBox.values.elementAt(index).name,
                          id : _sheepBox.values.elementAt(index).id,
                          age: _sheepBox.values.elementAt(index).age,
                          yun: _sheepBox.values.elementAt(index).yun,
                          onSilinme: (){
                            _sheepBox.deleteAt(index);
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
                                              _sheepBox.values.elementAt(index).name = value;
                                            });
                                          },
                                          controller: nameAlertControler,
                                          decoration: InputDecoration(hintText: _sheepBox.values.elementAt(index).name.toString()),
                                        ),
                                        TextField(
                                          onChanged: (value){
                                            setState(() {
                                              _sheepBox.values.elementAt(index).id = value;
                                            });
                                          },
                                          controller: idAlertControler,
                                          decoration: InputDecoration(hintText: _sheepBox.values.elementAt(index).id.toString()),
                                        ),
                                        TextField(
                                          onChanged: (value){
                                            setState(() {
                                              _sheepBox.values.elementAt(index).age = value;
                                            });
                                          },
                                          controller: ageAlertControler,
                                          decoration: InputDecoration(hintText: _sheepBox.values.elementAt(index).age.toString()),
                                        ),
                                        TextField(
                                          onChanged: (value){
                                            setState(() {
                                              _sheepBox.values.elementAt(index).yun = value;
                                            });
                                          },
                                          controller: ageAlertControler,
                                          decoration: InputDecoration(hintText: _sheepBox.values.elementAt(index).yun.toString()),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      InkWell(
                                          onTap: (){
                                            _sheepBox.putAt(
                                                index,
                                                Sheep(
                                                  name: _sheepBox.values.elementAt(index).name,
                                                  id: _sheepBox.values.elementAt(index).id,
                                                  age: _sheepBox.values.elementAt(index).age,
                                                  yun: _sheepBox.values.elementAt(index).yun
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
