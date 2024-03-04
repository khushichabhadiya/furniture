import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/appimage.dart';
import 'package:furniture/utils/common/apptext.dart';
import 'package:furniture/utils/view/Auth/signupscreen.dart';
import 'package:furniture/utils/view/Onboding/logoscreen.dart';
import 'package:furniture/utils/view/bootomnevigationbar.dart';
import 'package:furniture/utils/view/homescreen/homescreen.dart';
import 'package:http/http.dart ' as http;
import 'package:furniture/utils/common/gobletext.dart';
import 'package:furniture/utils/common/textfiled.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://typescript-al0m.onrender.com/api/user/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email':email,
          'password': password,
        }),
      );

      log(response.statusCode.toString());
      var data = jsonDecode(response.body);
      log(data['message']);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (_) =>  BootomNavigationBarScreen(selectedindex: 0,)),
            (route) => false);
        log(data['token']);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']);
        log('login!!');
      } else {
        log('Fail!');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 65,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 1,
                    width: 50,
                    color: Appcolor.greycolor,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                        border: Border.all(color: Appcolor.blackcolor),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(Appimage.Logoimage1), scale: 3)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      width: 50,
                      color: Appcolor.greycolor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GobleText(
                  text: AppText.singscreen,
                  fontsize: 32,
                  color: Appcolor.blackcolor),
              SizedBox(
                height: 28,
              ),
              Container(
                height: 369,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.grey,
                    ),
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.grey,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Commantextfieldwidget(
                        textfeildtext: ' Email',
                        text: 'Email',
                        controller: emailcontroller,
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Commantextfieldwidget(
                        textfeildtext: ' password',
                        text: 'password',
                        controller: passwordcontroller,
                        icon: Icon(Icons.remove_red_eye_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GobleText(
                        text: AppText.pssword,
                        color: Appcolor.blackcolor,
                        fontsize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            login(emailcontroller.text,passwordcontroller.text);
                          },
                          child: Text(
                            'login',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>SingUP()));
                      }, child: GobleText(

                        text: 'sign up',
                        fontWeight: FontWeight.w400,
                        fontsize: 16,
                        color: Colors.black,
                      ),


                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
