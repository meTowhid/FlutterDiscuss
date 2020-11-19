import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_discuss/core/services/auth_service.dart';
import 'package:flutter_discuss/ui/widgets/loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading ? Loading() : Center(child: GoogleSignInButton(onPressed: _onLogin)),
    );
  }

  void _onLogin() {
    setState(() => loading = true);
    _auth.signInWithGoogle().then(
      (value) {
        if (value == null) {
          setState(
            () {
              loading = false;
              error = 'Couldn\'t login, Something went wrong.';
            },
          );
        }
      },
    );
  }
}
