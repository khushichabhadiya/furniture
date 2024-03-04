import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:furniture/Model/profile_model.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/gobletext.dart';
import 'package:furniture/utils/view/Auth/signinscreen.dart';
import 'package:furniture/utils/view/homescreen/popularscreen.dart';
import 'package:furniture/utils/view/profilescreen/update.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

List<String> title = [
  'My orders',
  'Shipping Addresses',
  'Payment Method',
  'My reviews',
  'Setting'
];

List<String> subtitle = [
  'Already have 10 orders',
  '03 Addresses',
  'You have 2 cards',
  'Reviews for 5 items',
  'Setting',
  'Notification, Password, FAQ, Contact'
];

class _ProfileScreenState extends State<ProfileScreen> {
  Future<GetProfile>? Profiledetail;
  String? Token;

  void initState() {
    Profiledetail = GetProduct();
    super.initState();
  }

  Future<GetProfile> GetProduct() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Token = preferences.getString('token');
    log(Token.toString());
    final response = await http.get(
      Uri.parse('https://typescript-al0m.onrender.com/api/user/get-profile'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $Token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      log('Sign in!');
      return GetProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load employee');
    }
  }

  Future DeleteProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.getString('token', data['token']);
    Token = prefs.getString('token');
    log(Token.toString());
    final response = await http.delete(
      Uri.parse("https://typescript-al0m.onrender.com/api/user/delete-profile"),
      headers: {
        'content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $Token"
      },
    );
    if (response.statusCode == 200) {
      log(response.body);
      log("delete successfully");
      prefs.remove("token");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>SignScreen()), (route) => false);


    } else {
      throw Exception('failed to load employees');
    }
  }
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("yes"),
    onPressed: () {
      DeleteProduct();
    },
  );
  Widget noButton = TextButton(
    child: Text("no"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete"),
    content: Text("do you want to delete?"),
    actions: [
      okButton,
      noButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {
                     showAlertDialog(context);
                    }, child: Text('Delete')),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Appcolor.blackcolor),
                    ),
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> UpadateScreen()));
                    }, child: Text('Update'))
                  ],
                ),
              ),
              FutureBuilder(
                future: Profiledetail,
                builder: (context,snapshot) {
                  return Container(
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Appcolor.subcolor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('asset/image/avatar.png'))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            GobleText(
                              text: snapshot.data?.name.toString()??'',
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                              color: Appcolor.blackcolor,
                            ),
                            GobleText(
                              text: snapshot.data?.email.toString()??'',
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              color: Appcolor.greycolor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              ),
              SizedBox(
                height: 40,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Appcolor.subcolor,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 20,
                                color: Colors.grey.shade300,
                              ),
                              BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 20,
                                color: Colors.grey.shade300,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GobleText(
                                    text: title[index].toString(),
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Appcolor.blackcolor),
                                  ),
                                  GobleText(
                                    text: subtitle[index].toString(),
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Appcolor.greycolor),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Appcolor.blackcolor,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
