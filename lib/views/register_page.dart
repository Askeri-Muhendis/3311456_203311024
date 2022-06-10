import 'package:flutter/material.dart';
import 'package:tarim_app/common/custom_textfield.dart';
import 'package:tarim_app/views/feed_page.dart';

import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //textField'a veri aktarabilmemiz için gerekli değişkenler
  final TextEditingController _userNameController      = TextEditingController();
  final TextEditingController _emailController         = TextEditingController();
  final TextEditingController _passwordController      = TextEditingController();
  final TextEditingController _passwordAgainController = TextEditingController();
  final TextEditingController _nameContoller           = TextEditingController();
  final TextEditingController _surnameController       = TextEditingController();

  //Auth service gelicek
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    //ekran bilgisi
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.06,left: size.width * 0.02),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.blue.withOpacity(.75),
                        size: 26,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                    ),
                    Text(
                      "Kayıt Ol",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue.withOpacity(.75),
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: size.height * .8,
                  width: size.width * .85,
                  decoration: BoxDecoration(
                    color : Colors.blue.withOpacity(.75),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color:Colors.grey.withOpacity(.75),
                        blurRadius: 10,
                        spreadRadius: 2
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                              controller: _nameContoller,
                              keyboardType: TextInputType.multiline,
                              iconData: Icons.person_pin_sharp,
                              hintText: "Ad",
                              obscureText: false
                          ),
                          CustomTextField(
                              controller: _surnameController,
                              keyboardType: TextInputType.multiline,
                              iconData: Icons.person_outline_sharp,
                              hintText: "Soyad",
                              obscureText: false
                          ),
                          CustomTextField(
                              controller: _userNameController,
                              keyboardType: TextInputType.emailAddress,
                              iconData: Icons.person,
                              hintText: "Kullanıcı Adı",
                              obscureText: false
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          CustomTextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              iconData: Icons.mail,
                              hintText: "E-Mail",
                              obscureText: false
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          CustomTextField(
                              controller: _passwordController,
                              keyboardType: TextInputType.multiline,
                              iconData: Icons.vpn_key,
                              hintText: "Parola",
                              obscureText: true
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          CustomTextField(
                              controller: _passwordAgainController,
                              keyboardType: TextInputType.multiline,
                              iconData: Icons.vpn_key,
                              hintText: "Parola Tekrar",
                              obscureText: true
                          ),
                          SizedBox(
                            height: size.height * 0.08,
                          ),
                          InkWell(
                            onTap: (){
                              //auth service ve login page navigation TODO
                              _authService.createPerson(
                                  _nameContoller.text,
                                  _surnameController.text,
                                  _userNameController.text,
                                  _emailController.text,
                                  _passwordController.text,
                                  _passwordAgainController.text,
                                  context
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color : Colors.white,width: 2),
                                borderRadius: const BorderRadius.all(Radius.circular(30)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    "Kaydet",
                                    style: TextStyle(
                                      color : Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerWithEmail(){

  }
}
