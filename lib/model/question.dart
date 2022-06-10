import 'package:flutter/material.dart';

class Question {
  String id;
  String userId;
  String date;
  String question;
  String scope;
  String location;
  String ekilen;

  Question({
    Key? key,
    required this.id,
    required this.userId,
    required this.date,
    required this.question,
    required this.location,
    required this.scope,
    required this.ekilen
  });
}