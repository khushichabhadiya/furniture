import 'package:flutter/material.dart';

class Armchairscreen extends StatefulWidget {
  const Armchairscreen({super.key});

  @override
  State<Armchairscreen> createState() => _ArmchairscreenState();
}

class _ArmchairscreenState extends State<Armchairscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Armchair')
          ],
        ),
      ),
    );
  }
}
