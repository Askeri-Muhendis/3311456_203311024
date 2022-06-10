import 'package:flutter/material.dart';

class ChickenService extends StatelessWidget {
  //görev modeli
  final String name;
  final String age;
  final VoidCallback onSilinme;
  final VoidCallback onEdit;

  ChickenService({
    Key? key,
    required this.name,
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
