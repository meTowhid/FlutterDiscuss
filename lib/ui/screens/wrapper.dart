import 'package:flutter/material.dart';
import 'package:flutter_discuss/ui/screens/login.dart';
import 'package:flutter_discuss/ui/screens/questions_list/questions_screen.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<String>(context);
    return uid == null ? Login() : QuestionsScreen();
  }
}
