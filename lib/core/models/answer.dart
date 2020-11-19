import 'package:cloud_firestore/cloud_firestore.dart';

class Answer {
  final String answerLine, userUid;
  final Timestamp timestamp;
  final int voteCount;

  Answer({this.answerLine, this.userUid, this.timestamp, this.voteCount = 0});
}
