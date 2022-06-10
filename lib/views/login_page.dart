import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:tarim_app/common/custom_inkwell.dart';
import 'package:tarim_app/services/auth_service.dart';
import 'package:tarim_app/services/firestore_service.dart';
import 'package:tarim_app/views/feed_page.dart';
import 'package:tarim_app/views/register_page.dart';

import '../common/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //textFile veri aktarabilmek için TextEditing Controlller sınıfına ihtiyacımız var
   TextEditingController _emailController    = TextEditingController();
   TextEditingController _passwordController = TextEditingController();

  //auth servisimiz gelicek
  final AuthService _authService = AuthService();
  final FireStoreService _fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    //ekran bilgisi
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: size.height * 0.9,
            width: size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.75),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.75),
                  blurRadius: 10,
                  spreadRadius: 2
                )
              ]
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
                    child: Image.asset("assets/images/tree.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextField(
                              controller   : _emailController,
                              keyboardType : TextInputType.emailAddress,
                              iconData: Icons.mail,
                              hintText: "E-Mail",
                              obscureText: false,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            CustomTextField(
                                controller: _passwordController,
                                keyboardType: TextInputType.multiline,
                                iconData: Icons.vpn_key,
                                hintText: "Password",
                                obscureText: true
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            CustomInkWell("Giriş Yap",login),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            CustomInkWell("Kayıt Ol", register),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Lottie.network(
                              "https://assets3.lottiefiles.com/packages/lf20_6sdrivi8.json",
                              repeat: true,
                              reverse: true,
                              animate: true,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _emailController.text != "" && _passwordController.text != ""){
        await _authService.signInWithEmail(
            _emailController.text,
            _passwordController.text,
            context
        );
      }else{
        print("lütfen email ve şifrenizi giriniz");
      }
   }

  void register(){
    print("register çalıştı");
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  void _loginWithGoogleButtonFunction() async {
    //auth service google işlemleri
    return _authService.signInWithGoogle().then((userId){
      var userType = _fireStoreService.getUserIdType(userId.user!.uid).then((value){
         return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FeedPage(userId: userId.user!.uid, userType: value!)), (route) => false);
      });
    });
  }

  void _loginWithFacebookButtonFunction() async{
    //auth facebook işlemleri
    _authService.signInWithFacebook().then((userId){
      var userType = _fireStoreService.getUserIdType(userId!.user!.uid).then((value){
          return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FeedPage(userId: userId.user!.uid, userType: value!)), (route) => false);
      });
    });
  }
}




