import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_discuss/core/services/auth_service.dart';
import 'package:flutter_discuss/ui/screens/wrapper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlutterDiscussApp());
}

class FlutterDiscussApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Discuss',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamProvider<String>.value(
        value: AuthService().userUid,
        child: AuthWrapper(),
      ),
    );
  }
}
