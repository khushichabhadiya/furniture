import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/globalbutton.dart';
import 'package:furniture/utils/common/gobletext.dart';
import 'package:furniture/utils/view/bootomnevigationbar.dart';
import 'package:furniture/utils/view/homescreen/homescreen.dart';

class SubmmitOredrScreen extends StatefulWidget {
  const SubmmitOredrScreen({super.key});

  @override
  State<SubmmitOredrScreen> createState() => _SubmmitOredrScreenState();
}

class _SubmmitOredrScreenState extends State<SubmmitOredrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'SUCCESS!',
              style: TextStyle(fontSize: 30),
            ),

            Container(
              height: 255,
              width: 268,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/image/Graphics.png'))),
            ),
            SizedBox(
              height: 10,
            ),
            GobleText(
              text:
                  'Your order will be delivered soon.\n Thank you for choosing our app!',
              textStyle: TextStyle(color: Appcolor.greycolor),
            ),
            Spacer(),
            GobleButton(
              height: 60,
              width: double.infinity,
              text: 'Track your orders',
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => BootomNavigationBarScreen(selectedindex: 0,)));
              },
              child: GobleButton(
                height: 60,
                width: double.infinity,
                text: 'Back To Home',
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
