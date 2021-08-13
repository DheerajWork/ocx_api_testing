import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ocx_api_testing/api/global.dart';
import 'package:ocx_api_testing/api/home_page.dart';
import 'package:ocx_api_testing/api/model_class.dart';
import 'package:ocx_api_testing/api/register_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences? pref;

  getUserDetails() async{
    pref = await SharedPreferences.getInstance();
    String? a = pref!.getString("UserDetails");
    print(a);
    print('----------------------');
    if (pref!.getString("UserDetails") != null) {
      Global.myModelClass = MyModelClass.fromJson(jsonDecode(a!));
      Navigator.push(context, MaterialPageRoute(builder: (c) => HomePage()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (C) => RegisterApi()));
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Splash screen");
    Timer(Duration(seconds: 5), getUserDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ruko Jara",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 170,vertical: 5),
              child: LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
