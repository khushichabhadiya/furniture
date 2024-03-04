
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/gobletext.dart';



class Commantextfieldwidget extends StatelessWidget {
  final String text,textfeildtext;
  final Icon? icon;
  final TextEditingController? controller;
  const   Commantextfieldwidget({super.key, required this.text, this.icon,  this.controller, required this.textfeildtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const SizedBox(
          height: 9,
        ),
        SizedBox(
          height: 59,
          width: double.infinity,
          child: TextFormField(
            controller:controller ,
            decoration: InputDecoration(
              hintText: textfeildtext,
              suffixIcon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Appcolor.greycolor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Appcolor.greycolor),
              ),
              fillColor: Appcolor.greycolor,
            ),
          ),
        ),

      ],
    );
  }
}
