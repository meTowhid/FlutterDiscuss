import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/models/answer.dart';
import 'package:flutter_discuss/ui/widgets/answer_tile.dart';
import 'package:provider/provider.dart';

class AnswersList extends StatefulWidget {
  @override
  _AnswersListState createState() => _AnswersListState();
}

class _AnswersListState extends State<AnswersList> {
  @override
  Widget build(BuildContext context) {
    final answers = Provider.of<List<Answer>>(context) ?? [];
    return answers.isEmpty
        ? Center(child: Text('No answers found'))
        : ListView.builder(shrinkWrap: true, itemCount: answers.length, itemBuilder: (_, index) => AnswerTile(answer: answers[index]));
  }
}
