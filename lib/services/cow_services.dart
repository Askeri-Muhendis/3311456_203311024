import 'package:flutter/material.dart';

class CowSatiri extends StatelessWidget {
  //görev modeli
  final String name;
  final String id;
  final String age;
  final VoidCallback onSilinme;
  final VoidCallback onEdit;

  CowSatiri({
    Key? key,
    required this.name,
    required this.id,
    required this.age,
    required this.onSilinme,
    required this.onEdit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Görev satırı
    return Row(
      children: [
        SizedBox(width: 5,),
        Text(
          id,
          style: TextStyle(
          ),
        ),
        SizedBox(width: 10,),
        Text(
          name,
          style: TextStyle(
          ),
        ),
        SizedBox(width: 10,),
        Text(
          age,
          style: TextStyle(
          ),
        ),
        IconButton(
            onPressed: (){
              onSilinme();
            },
            icon: Icon(Icons.delete)
        ),
        SizedBox(width: 5,),
        IconButton(
            onPressed: (){
              onEdit();
            },
            icon: Icon(Icons.edit)
        )
      ],
    );
  }
}
