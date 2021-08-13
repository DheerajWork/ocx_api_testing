import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ocx_api_testing/api/home_page.dart';

class EmailAuth extends StatefulWidget {
  @override
  _EmailAuthState createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  emailSignUp() async {
    await _auth
        .createUserWithEmailAndPassword(email: email.text, password: pass.text)
        .then((value) {
      print("11111111${value.user!.uid}");
      Navigator.push(context, MaterialPageRoute(builder: (c) => HomePage()));
    }).catchError((c) {
      print("0000000$c");
      Fluttertoast.showToast(msg: "$c");
    });
  }

  emailLogin() async {
    await _auth
        .signInWithEmailAndPassword(email: email.text, password: pass.text)
        .then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (C) => HomePage()));
    }).catchError((e){
      print(e);
      Fluttertoast.showToast(msg: '$e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
            ),
            TextField(
              controller: pass,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  print("signUp");
                  await emailSignUp();
                },
                child: Text("SignUp")),
            ElevatedButton(
                onPressed: () async {
                  print("login");
                  await emailLogin();
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
