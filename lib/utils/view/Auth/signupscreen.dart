import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:furniture/utils/view/Auth/signinscreen.dart';

import '../../common/appcolor.dart';
import '../../common/appimage.dart';
import '../../common/apptext.dart';
import '../../common/gobletext.dart';
import 'package:http/http.dart 'as http;
import '../../common/textfiled.dart';

class SingUP extends StatefulWidget {
  const SingUP({super.key});

  @override
  State<SingUP> createState() => _SingUPState();
}

class _SingUPState extends State<SingUP> {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController confrimecontroller = TextEditingController();

  Future<void> login(String email, String password, String name) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://typescript-al0m.onrender.com/api/user/signUp'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': password,
        }),
      );

      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        log('Sign in!');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const SignScreen()),
                (route) => false);
      } else {
        log('fail!');
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
              const SizedBox(
                height: 65,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 1,
                        width: 50,
                        color: Appcolor.greycolor,
                      )
                  ),
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
              const SizedBox(
                height: 30,
              ),
              GobleText(
                  text: AppText.welcome,
                  fontsize: 32,
                  color: Appcolor.blackcolor
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                height: 520,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.grey,
                    ),
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Commantextfieldwidget(


                        text: 'name',
                        controller: namecontroller,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined,), textfeildtext: 'Name',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Commantextfieldwidget(
                        textfeildtext: 'Email',
                        text: 'Email',
                        controller: emailcontroller,
                      ),
                      
                      Commantextfieldwidget(
                        textfeildtext: 'password',
                        text: 'password',
                        controller: passwordcontroller,
                        icon: const Icon(Icons.remove_red_eye_outlined),
                      ),
                      Commantextfieldwidget(
                        textfeildtext: 'confrime password',
                        text: 'confrime password',
                        controller: confrimecontroller,
                        icon: const Icon(Icons.remove_red_eye_outlined),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7),
                          ),
                          ),
                          ),
                        ),
                          onPressed: () {
                          login(emailcontroller.text, passwordcontroller.text, namecontroller.text);
                          },
                          child: const Text(
                            'sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Already have account?',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          children: [
                            TextSpan(
                                text: 'singn Up?',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Appcolor.blackcolor),),
                          ],
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
