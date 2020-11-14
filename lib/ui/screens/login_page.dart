import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_discuss/core/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GoogleSignInButton(onPressed: () => context.read<AuthService>().signInWithGoogle()),
        ),
      ),
    );
  }
}
