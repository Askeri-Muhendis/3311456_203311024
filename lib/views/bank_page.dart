import 'package:flutter/material.dart';
import 'package:tarim_app/services/file_service.dart';

class BankListPage extends StatefulWidget {
  const BankListPage({Key? key}) : super(key: key);

  @override
  State<BankListPage> createState() => _BankListPageState();
}

class _BankListPageState extends State<BankListPage> {

  Color color = Colors.white;
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kart Durumları'),
          centerTitle: true,
        ),
        body: Center(
            child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  //onaylandı
                  color = Colors.green;
                });
              },
              onDoubleTap: () {
                setState(() {
                  //beklemede
                  color = Colors.yellow;
                });
              },
              onHorizontalDragStart: (DragStartDetails details) {
                setState(() {
                  //red
                  color = Colors.red;
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                setState(() {
                  //tamamlandı
                  color = Colors.greenAccent;
                });
              },
              onVerticalDragStart: (DragStartDetails details) {
                setState(() {
                  //tarih yaklaşıyor
                  color = Colors.orange;
                });
              },
              onVerticalDragEnd: (DragEndDetails details) {
                print(details.primaryVelocity);
                setState(() {
                  //düzeltme
                  color = Colors.deepPurpleAccent;
                });
              },
              onLongPress: () {
                setState(() {
                  //cezası var
                  color = Colors.black12;
                });
              },
              child: Container(
                color: color,
                height: 100,
                width: 100,
                child: Image.asset("assets/images/kuveyt.jpeg"),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  //onaylandı
                  color1 = Colors.green;
                });
              },
              onDoubleTap: () {
                setState(() {
                  //beklemede
                  color1 = Colors.yellow;
                });
              },
              onHorizontalDragStart: (DragStartDetails details) {
                setState(() {
                  //red
                  color1 = Colors.red;
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                setState(() {
                  //tamamlandı
                  color1 = Colors.greenAccent;
                });
              },
              onVerticalDragStart: (DragStartDetails details) {
                setState(() {
                  //tarih yaklaşıyor
                  color1 = Colors.orange;
                });
              },
              onVerticalDragEnd: (DragEndDetails details) {
                print(details.primaryVelocity);
                setState(() {
                  //düzeltme
                  color1 = Colors.deepPurpleAccent;
                });
              },
              onLongPress: () {
                setState(() {
                  //cezası var
                  color1 = Colors.black12;
                });
              },
              child: Container(
                color: color1,
                height: 100,
                width: 100,
                child: Image.asset("assets/images/sekerbank.jpeg"),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  //onaylandı
                  color2 = Colors.green;
                });
              },
              onDoubleTap: () {
                setState(() {
                  //beklemede
                  color2 = Colors.yellow;
                });
              },
              onHorizontalDragStart: (DragStartDetails details) {
                setState(() {
                  //red
                  color2 = Colors.red;
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                setState(() {
                  //tamamlandı
                  color2 = Colors.greenAccent;
                });
              },
              onVerticalDragStart: (DragStartDetails details) {
                setState(() {
                  //tarih yaklaşıyor
                  color2 = Colors.orange;
                });
              },
              onVerticalDragEnd: (DragEndDetails details) {
                print(details.primaryVelocity);
                setState(() {
                  //düzeltme
                  color2 = Colors.deepPurpleAccent;
                });
              },
              onLongPress: () {
                setState(() {
                  //cezası var
                  color2 = Colors.black12;
                });
              },
              child: Container(
                color: color2,
                height: 100,
                width: 100,
                child: Image.asset("assets/images/ziraat.jpeg"),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  //onaylandı
                  color3 = Colors.green;
                });
              },
              onDoubleTap: () {
                setState(() {
                  //beklemede
                  color3 = Colors.yellow;
                });
              },
              onHorizontalDragStart: (DragStartDetails details) {
                setState(() {
                  //red
                  color3 = Colors.red;
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                setState(() {
                  //tamamlandı
                  color3 = Colors.greenAccent;
                });
              },
              onVerticalDragStart: (DragStartDetails details) {
                setState(() {
                  //tarih yaklaşıyor
                  color3 = Colors.orange;
                });
              },
              onVerticalDragEnd: (DragEndDetails details) {
                print(details.primaryVelocity);
                setState(() {
                  //düzeltme
                  color3 = Colors.deepPurpleAccent;
                });
              },
              onLongPress: () {
                setState(() {
                  //cezası var
                  color3 = Colors.black12;
                });
              },
              child: Container(
                color: color3,
                height: 100,
                width: 100,
                child: Image.asset("assets/images/yapikredi.png"),
              ),
            ),
          ],
        )));
  }
}
