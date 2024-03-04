import 'package:flutter/material.dart';

class TabelScreen extends StatefulWidget {
  const TabelScreen({super.key});

  @override
  State<TabelScreen> createState() => _TabelScreenState();
}

class _TabelScreenState extends State<TabelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('tabel')
          ],
        ),
      ),
    );
  }
}
