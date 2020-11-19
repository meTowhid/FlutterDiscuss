import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/models/question.dart';
import 'package:flutter_discuss/ui/screens/new_question_form.dart';
import 'package:flutter_discuss/core/services/auth_service.dart';
import 'package:flutter_discuss/core/services/database_service.dart';
import 'package:flutter_discuss/ui/screens/questions_list/question_list.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) => NewQuestionForm());
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: _showSettingsPanel, child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text('Flutter Discuss'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(icon: Icon(Icons.logout), label: Text('Logout'), onPressed: _auth.signOut),
        ],
      ),
      body: StreamProvider<List<Question>>.value(value: DatabaseService().questions, child: QuestionsList()),
    );
  }
}
