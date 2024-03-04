import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:furniture/utils/view/homescreen/popularscreen.dart';
import 'package:furniture/utils/view/bootomnevigationbar.dart';
import 'package:http/http.dart%20' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpadateScreen extends StatefulWidget {
  const UpadateScreen({super.key});

  @override
  State<UpadateScreen> createState() => _UpadateScreenState();
}

class _UpadateScreenState extends State<UpadateScreen> {
  TextEditingController _controller = TextEditingController();
  Future<void> UpdateProfile(String name) async {
    final SharedPreferences Preferences = await SharedPreferences.getInstance();
    String? token = Preferences.getString('token');

    if (Token == null) {
      throw (Exception('tokon not found'),);
    }
    try {
      http.Response response = await http.put(
          Uri.parse(
              'https://typescript-al0m.onrender.com/api/user/update-profile'),
          headers: {
            'content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'name': name,
          }));
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        log('profile updated');
      } else {
        log('fail');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextFormField(controller: _controller),
          ),
          ElevatedButton(
              onPressed: () {
                UpdateProfile(_controller.text);
                Navigator.push(context, MaterialPageRoute(builder: (_) => BootomNavigationBarScreen(selectedindex: 3,)));
                // Navigator.push(context, MaterialPageRoute(builder: (_)=> UpadateScreen()));
              },
              child: Text('Update'))
        ],
      ),
    );
  }
}
