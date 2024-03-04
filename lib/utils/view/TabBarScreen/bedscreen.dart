import 'package:flutter/material.dart';

class BedScreen extends StatefulWidget {
  const BedScreen({super.key});

  @override
  State<BedScreen> createState() => _BedScreenState();
}

class _BedScreenState extends State<BedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('bed')
          ],
        ),
      ),
    );
  }
}
