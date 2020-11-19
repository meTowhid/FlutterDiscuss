import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/models/answer.dart';

class AnswerTile extends StatelessWidget {
  final Answer answer;

  AnswerTile({this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(answer.answerLine),
        subtitle: Text(answer.voteCount.toString()),
      ),
    );
  }
}
