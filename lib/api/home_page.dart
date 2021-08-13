import 'package:flutter/material.dart';
import 'package:ocx_api_testing/api/global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Text("Direct Enter");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name : ${Global.myModelClass.username}"),
            Text("Phone : ${Global.myModelClass.phoneNo}"),
            Text("Code : ${Global.myModelClass.countryCode}"),
            Text("Email : ${Global.myModelClass.email}"),
            Text("Id : ${Global.myModelClass.firebaseId}"),
          ],
        ),
      ),
    );
  }
}
