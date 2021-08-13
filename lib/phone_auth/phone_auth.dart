import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocx_api_testing/api/home_page.dart';

class MyPhoneAuth extends StatefulWidget {
  @override
  _MyPhoneAuthState createState() => _MyPhoneAuthState();
}

class _MyPhoneAuthState extends State<MyPhoneAuth> {

  TextEditingController number = TextEditingController();
  TextEditingController code = TextEditingController();

  phoneAuthDemo() async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: "+91${number.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          print(credential);
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, int) {
          showDialog(context: context, builder: (c) =>
              AlertDialog(
                title: Text("Enter The Code"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: code,
                    )
                  ],
                ),
                actions: [
                  ElevatedButton(onPressed: () async{
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: verificationId,smsCode: code.text);
                    UserCredential user = await _auth.signInWithCredential(credential);

                    if(user != null){
                      Navigator.push(context, MaterialPageRoute(builder: (C) => HomePage()));
                    }

                  }, child: Text("Enter"))
                ],
              )
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {}
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: number,
          ),
          ElevatedButton(onPressed: (){
            phoneAuthDemo();
          }, child: Text("Send"))
        ],
      ),
    );
  }
}
