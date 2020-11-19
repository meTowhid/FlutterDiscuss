import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/models/question.dart';

class QuestionDetails extends StatelessWidget {
  final Question question;

  QuestionDetails({this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        child: ListTile(
          title: Text(question.title),
          subtitle: Text(question.tags.toString()),
        ),
      ),
    );
  }
}
