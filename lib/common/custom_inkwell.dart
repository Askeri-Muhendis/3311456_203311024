import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tarim_app/views/register_page.dart';

class CustomInkWell extends StatelessWidget {
  String text;
  Function function;

  CustomInkWell(
    this.text,
    this.function
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(30))
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class buildLoginWithOtherInkWell extends StatelessWidget {
  late String text;
  dynamic icon;
  dynamic color;
  late Function function;

  buildLoginWithOtherInkWell(
      {
        required this.text,
        required this.color,
        required this.icon,
        required this.function
      }
  );

  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: () => function,
     child: Container(
       padding: EdgeInsets.symmetric(vertical: 5),
       decoration: BoxDecoration(
         border: Border.all(color: color,width: 2),
         color: color,
         borderRadius: BorderRadius.all(Radius.circular(30))
       ),
       child: Padding(
         padding: EdgeInsets.all(5.0),
         child: Center(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               FaIcon(
                   icon,
                    color: Colors.white,
               ),
               SizedBox(
                 width: 10,
               ),
               Text(
                 text,
                 style: TextStyle(color: Colors.white),
               )
             ],
           ),
         ),
       ),
     ),
   );
  }
}







