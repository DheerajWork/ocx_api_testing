import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ocx_api_testing/api/register_api.dart';
import 'package:ocx_api_testing/api/splash_screen.dart';
import 'package:ocx_api_testing/email_auth/email_auth.dart';
import 'package:ocx_api_testing/phone_auth/phone_auth.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: EmailAuth()
    );
  }
}

