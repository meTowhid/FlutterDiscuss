import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/models/answer.dart';
import 'package:flutter_discuss/core/models/question.dart';
import 'package:flutter_discuss/core/services/database_service.dart';
import 'package:flutter_discuss/ui/screens/answer_form.dart';
import 'package:flutter_discuss/ui/screens/question_details/answer_list.dart';
import 'package:flutter_discuss/ui/widgets/question_tile.dart';
import 'package:provider/provider.dart';

class QuestionDetailsScreen extends StatelessWidget {
  final Question question;

  QuestionDetailsScreen(this.question);

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) => AnswerForm(questionId: question.id));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: _showSettingsPanel, child: Icon(Icons.add)),
      appBar: AppBar(title: Text('Q&A Discussions'), elevation: 0.0),
      body: ListView(
        children: [
          QuestionTile(question: question),
          Center(child: Text('answers')),
          StreamProvider<List<Answer>>.value(value: DatabaseService().answers(question.id), child: AnswersList()),
        ],
      ),
    );
  }
}
