
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  IconData iconData;
  String hintText;
  bool obscureText;

  CustomTextField({Key? key,
    required this.controller,
    required this.keyboardType,
    required this.iconData,
    required this.hintText,
    required this.obscureText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, //verileri alabilmemiz için gerekli
      style:  const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      keyboardType:keyboardType, //keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
            //iconData,
            color: Colors.white,
          ),
          hintText: hintText,
          prefixText: " ",
          hintStyle: const TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder:  const UnderlineInputBorder(
              borderSide: BorderSide(
                color:Colors.white,
              )
          ),
          enabledBorder:  const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          )
      ),
    );
  }
}