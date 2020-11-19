import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/models/question.dart';
import 'package:flutter_discuss/ui/screens/question_details/question_details_screen.dart';

class QuestionTile extends StatelessWidget {
  final Question question;

  QuestionTile({this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () => _gotoQuestionDetails(context),
        child: Card(
          child: ListTile(
            title: Text(question.title),
            subtitle: Text(question.tags.toString()),
          ),
        ),
      ),
    );
  }

  void _gotoQuestionDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionDetailsScreen(question)),
    );
  }
}
