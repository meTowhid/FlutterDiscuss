import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/services/database_service.dart';
import 'package:flutter_discuss/constants/constants.dart';
import 'package:provider/provider.dart';

class AnswerForm extends StatefulWidget {
  final String questionId;

  const AnswerForm({this.questionId}) ;

  @override
  _AnswerFormState createState() => _AnswerFormState();
}

class _AnswerFormState extends State<AnswerForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _answerLineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<String>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
              'Answer',
              style: TextStyle(fontSize: 18.0)
          ),
          SizedBox(height: 20.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            validator: (value) => value.isEmpty ? 'Field can\'t be empty' : null,
            controller: _answerLineController,
            decoration: textInputDecoration,
          ),
          SizedBox(height: 20.0),
          RaisedButton(
              color: Colors.pink[400],
              child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white)
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await DatabaseService(uid: uid).postAnswer(
                    answerLine: _answerLineController.text,
                    questionId: widget.questionId,
                  );
                  Navigator.pop(context);
                }
              }),
        ],
      ),
    );
  }
}
