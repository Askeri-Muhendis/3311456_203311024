import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tarim_app/services/firestore_service.dart';
import 'package:tarim_app/views/feed_page.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FireStoreService _fireStoreService = FireStoreService();

  //kullanıcı girişi
  Future<User?> signInWithEmail(String email, String password,BuildContext context) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password).then((userId){
          var userType = _fireStoreService.getUserIdType(userId.user!.uid).then((value){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FeedPage(userId : userId.user!.uid,userType: value!,)), (route) => false);
          });
    });
    return user.user;
  }

  //kullanıcının hesaptan çıkması
  signOut() async {
    return await _auth.signOut();
  }

  //kullanıcı oluşturulması
  Future<User?> createPerson(
    String name,
    String surname,
    String username,
    String email,
    String password,
    String againPassword,
    BuildContext context,
  ) async {
    if (password == againPassword) {
      try {
        var user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print("firestore öncesi");
        print("user ${user.user!.uid}");
        //firestore'a kullanıcı bilgilerinin eklenmesi
        await _firestore.collection("Person").doc(user.user!.uid).set({
          "name": name,
          "surname": surname,
          "username": username,
          "email": email,
          "userType":"user"
        });
        print("firestore sonrası");

        var userType = await _fireStoreService.getUserIdType(user.user!.uid).then((value){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FeedPage(userId:user.user!.uid,userType: value!,)));
        });
        print("UserType -> ${userType}");
        //TODO

        print("Navigator sonrası");
      } catch (exception) {
        print("Exception $exception");
      }
    } else {
      print("şifreleriniz aynı değil");
    }
  }

//google ile giriş -> asenkron işlemler olduğu için async ve await kullanıyoruz
Future<UserCredential> signInWithGoogle() async{
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

//facebook ile giriş
Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.token);
      return await FirebaseAuth.instance.signInWithCredential(facebookCredential);
    }else{
      print(result.message);
    }
}

}
