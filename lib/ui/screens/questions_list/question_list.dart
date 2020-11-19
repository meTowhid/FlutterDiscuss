import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/models/question.dart';
import 'package:flutter_discuss/ui/widgets/question_tile.dart';
import 'package:provider/provider.dart';

class QuestionsList extends StatefulWidget {
  @override
  _QuestionsListState createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<List<Question>>(context) ?? [];
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (_, index) => QuestionTile(question: questions[index]),
    );
  }
}
