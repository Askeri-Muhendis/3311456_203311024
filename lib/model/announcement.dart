import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarim_app/common/custom_inkwell.dart';
import '../services/firestore_service.dart';


class Announcement {
  String id;
  String userId;
  String image;
  String date;
  String comment;
  Announcement({
    Key? key,
    required this.id,
    required this.userId,
    required this.image,
    required this.date,
    required this.comment
  });
}



/*
veriler
  factory Announcement.fromSnapshot(DocumentSnapshot snapshot){
    return Announcement(
      id: snapshot.id,
      userId: snapshot["userId"],
      comment: snapshot["comment"],
      date: snapshot["date"],
      image: snapshot["image"]
    );
  }
}*/