import 'package:flutter/material.dart';
import 'package:furniture/utils/view/Auth/signupscreen.dart';
import 'package:furniture/utils/view/Onboding/logoscreen.dart';
import 'package:furniture/utils/view/Auth/signinscreen.dart';
import 'package:furniture/utils/view/cartscreen/cartscreen.dart';
import 'package:furniture/utils/view/homescreen/homescreen.dart';
import 'package:furniture/utils/view/my_order.dart/deliverd.dart';
import 'package:furniture/utils/view/homescreen/proudect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/view/bootomnevigationbar.dart';
import 'utils/view/profilescreen/profilescreen.dart';
String? token ;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences  Preferences = await SharedPreferences.getInstance();
  token = Preferences.getString('token');
  print("token${token}");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  token !=null ? BootomNavigationBarScreen(selectedindex: 0,) : const SignScreen(),
    );
  }
}

