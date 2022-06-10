import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tarim_app/model/announcement.dart';
import 'package:tarim_app/model/land.dart';
import 'package:tarim_app/model/question.dart';
import 'package:tarim_app/model/user.dart';
import 'package:tarim_app/services/firestorage_service.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StorageService _storageService = StorageService();
  String mediaUrl = "";

  //duyuru eklemek için
  Future<Announcement> addAnnouncement(String userId,String comment,
      String date,XFile pickedFile) async {
    var ref = _firestore.collection("Announcement");

    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));
    var documentRef = await ref.add({
      "userId": userId,
      "comment": comment,
      "date": date,
      "image": mediaUrl
    });
    return Announcement(
        id: documentRef.id,
        userId: userId,
        comment: comment,
        date: date,
        image: mediaUrl
    );
  }


  //arazi eklemek için
  Future<Land> addLand(String land,
      String weight,
      String height,
      String location,
      String size,
      String cultivatedCrop) async {
    var ref = _firestore.collection("Land");
    var documentRef = await ref.add({
      "land": land,
      "weight": weight,
      "height": height,
      "location": location,
      "size": size,
      "cultivatedCrop": cultivatedCrop
    });
    return Land(
        landId: documentRef.id,
        land: land,
        width: weight,
        height: height,
        location: location,
        size: size,
        cultivatedCrop: cultivatedCrop
    );
  }

  //soru Sor
  Future<Question> addQuestion(
      String userId,
      String question,
      String date,
      String scope,
      String location,
      String ekilen,
      ) async {
    var ref = _firestore.collection("Question");
    var documentRef = await ref.add({
      "userId": userId,
      "question": question,
      "date": date,
      "scope": scope,
      "location": location,
      "ekilen": ekilen,
    });

    return Question(
        id: documentRef.id,
        userId: userId,
        date: date,
        question: question,
        location: location,
        scope: scope,
        ekilen: ekilen
    );
  }

  //duyurları göstermek için
  Stream<QuerySnapshot> getAnnouncements() {
    var ref = _firestore.collection("Announcement").snapshots();
    return ref;
  }

  //duyuru göstermek
  Future<Land> getLand(String landId) async {
    var ref = _firestore.collection("Land").doc(landId).get();
    late Land land;
    await ref.then((DocumentSnapshot ds) {
      land = Land(
        landId: ds.id,
        land: ds.get("land"),
        width: ds.get("weight"),
        height: ds.get("height"),
        location: ds.get("location"),
        size: ds.get("size"),
        cultivatedCrop: ds.get("cultivatedCrop"),
      );
    });
    return land;
  }

  Stream<QuerySnapshot> getLands() {
    var ref = _firestore.collection("Land").snapshots();
    return ref;
  }

  Stream<QuerySnapshot> getQuestions() {
    var ref = _firestore.collection("Question").snapshots();
    return ref;
  }

  //kullanıcı bilgileri için
  Stream<QuerySnapshot> getPerson() {
    var ref = _firestore.collection("Person").snapshots();
    return ref;
  }

  //kullanıcı id'sinden usertype almamız gerekli 
  Future<String?> getUserIdType(String userId) async {
    String userType = "user";
    var ref = _firestore.collection("Person").doc(userId).get();
    await ref.then((DocumentSnapshot documentSnapshot) {
      print("usertype -> ${documentSnapshot.get(
          "userType")} : userId -> ${userId}");
      userType = documentSnapshot.get("userType");
      print("usertype ->: $userType");
      return userType;
    });
    return userType;
  }

  Future<User> getUserData(String userId) async {
    print("getUserData");
    var ref = _firestore.collection("Person").doc(userId).get();
    late User user;
    await ref.then((DocumentSnapshot documentSnapshot) {
      user = User(
          name: documentSnapshot.get("name"),
          surname: documentSnapshot.get("surname"),
          email: documentSnapshot.get("email"),
          location: "lokasyon",
          userImage: "resim",
          userType: documentSnapshot.get("userType"),
          banned: "banned",
          land: "arazi"
      );
      print("user verileri firestore -> $user");
      print("username ${user.name}");
    });
    return user;
  }


  String? getUserType(String userId) {
    var ref = _firestore.collection("Person").doc(userId).get();
    ref.then((value) {});
  }

  //duyuru silmek için-Storage silmesini unutma !
  Future<void> removeAnnouncement(String docId) {
    var ref = _firestore.collection("Announcement").doc(docId).delete();
    return ref;
  }


}