import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String id, title, description, tags;
  final List<String> images;
  final Timestamp timestamp;
  final int viewCount;

  Question({this.id, this.title, this.description, this.tags, this.images, this.timestamp, this.viewCount = 0});
}

