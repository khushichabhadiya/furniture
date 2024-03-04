import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';

class ChairScreen extends StatefulWidget {
  const ChairScreen({super.key});

  @override
  State<ChairScreen> createState() => _ChairScreenState();
}

class _ChairScreenState extends State<ChairScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('chair',style: TextStyle(color: Appcolor.blackcolor),)
          ],
        ),
      ),
    );
  }
}
