import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';

class DeliverdScreen extends StatefulWidget {
  const DeliverdScreen({super.key, required int selectedindex});

  @override
  State<DeliverdScreen> createState() => _DeliverdScreenState();
}

class _DeliverdScreenState extends State<DeliverdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Deliverd',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Appcolor.blackcolor),
          ),
        ),
      ),
    );
  }
}
