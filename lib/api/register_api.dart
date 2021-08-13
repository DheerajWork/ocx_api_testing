import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ocx_api_testing/api/global.dart';
import 'package:ocx_api_testing/api/home_page.dart';
import 'package:ocx_api_testing/api/model_class.dart';
import 'package:ocx_api_testing/custom.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterApi extends StatefulWidget {
  @override
  _RegisterApiState createState() => _RegisterApiState();
}

class _RegisterApiState extends State<RegisterApi> {

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fireId = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? pref;


  getRegister() async{
    http.Response response =  await http.post(Uri.parse('http://ocx.quiz99.online/api/register'),body: {
      "username":name.text,
      "phone_no":phone.text,
      "country_code":"+91",
      "image":"jhgjj.png",
      "email":email.text,
      "firebase_id":fireId.text
    });

    var registerData = jsonDecode(response.body);

    print(registerData);
    print('***********************');
    if(registerData['statusCode'] == 200){
      Fluttertoast.showToast(msg: "${registerData['message']}", gravity: ToastGravity.BOTTOM,);
      Global.myModelClass = MyModelClass.fromJson(registerData['data']);
      pref!.setString("UserDetails", jsonEncode(registerData['data'])).toString();
      Navigator.push(context, MaterialPageRoute(builder: (c) =>HomePage()));
    } else{
      Fluttertoast.showToast(msg: "${registerData['message']}",gravity: ToastGravity.BOTTOM,);
    }

  }

  getPref() async{
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRegister();
    getPref();
    print("Register screen Open");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CustomField(
                  controller: name,
                  labelText: 'User Name',
                  validator: (name){
                    if(name ==null || name=="" || name.length==0){
                      return 'Enter Name';
                    } else{
                      return null;
                    }
                  },
                ),
                CustomField(
                  controller: phone,
                  labelText: 'Phone Number',
                  validator: (phone){
                    if(phone!.length <= 5){
                      return 'Enter valid number';
                    } else{
                      return null;
                    }
                  },
                ),
                CustomField(
                  controller: email,
                  labelText: 'Email Id',
                  validator: (email){
                    if (email!.length == 0) {
                      return 'Enter email';
                    } else if ( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                CustomField(
                  controller: fireId,
                  labelText: 'Firebase Id',
                  validator: (id){
                    if(id!.isEmpty){
                      return 'Enter Firebase Id';
                    } else{
                      return null;
                    }
                  },
                ),
                ElevatedButton(onPressed: (){

                  print(name.text);
                  if(_formKey.currentState!.validate()){
                    getRegister();
                    print("Validator Successfully");
                    showDialog(context: context, builder: (C){
                      return Center(child: CircularProgressIndicator(),);
                    });
                  } else {
                    print("Validation Failed");
                  }

                }, child: Text("")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
