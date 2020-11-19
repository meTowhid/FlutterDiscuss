import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/services/database_service.dart';
import 'package:flutter_discuss/constants/constants.dart';
import 'package:provider/provider.dart';

class NewQuestionForm extends StatefulWidget {
  @override
  _NewQuestionFormState createState() => _NewQuestionFormState();
}

class _NewQuestionFormState extends State<NewQuestionForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    String uid = Provider.of<String>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'New Question',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            onEditingComplete: node.nextFocus,
            validator: (value) => value.isEmpty ? 'Field can\'t be empty' : null,
            controller: _titleController,
            decoration: textInputDecoration,
          ),
          SizedBox(height: 20.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            onEditingComplete: node.nextFocus,
            validator: (value) => value.isEmpty ? 'Field can\'t be empty' : null,
            controller: _descriptionController,
            decoration: textInputDecoration,
          ),
          SizedBox(height: 20.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            onEditingComplete: node.nextFocus,
            validator: (value) => value.isEmpty ? 'Field can\'t be empty' : null,
            controller: _tagsController,
            decoration: textInputDecoration,
          ),
          SizedBox(height: 20.0),
          RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await DatabaseService(uid: uid).postNewQuestion(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    tags: _tagsController.text,
                  );
                  Navigator.pop(context);
                }
              }),
        ],
      ),
    );
  }
}
