import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/appimage.dart';
import 'package:furniture/utils/common/apptext.dart';
import 'package:furniture/utils/common/gobletext.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Appimage.Logoimage),fit: BoxFit. cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: GobleText(text: AppText.logoscreen,
                fontWeight: FontWeight.w600,
                  fontsize: 32,
                  color: Appcolor.blackcolor,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GobleText(text: AppText.logoscreen1,
              fontsize: 16,
                color: Appcolor.blackcolor,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: ElevatedButton(style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7),
                    ),
                    ),
                    ),
                  ),
                    onPressed: () {},
                    child: Text(
                      'Get stared',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    ),
                  ),
              ),
              SizedBox(
                height: 43,
              ),
            ],
          ),
        ),
      )
    );
  }
}
