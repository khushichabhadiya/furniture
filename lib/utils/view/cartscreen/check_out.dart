import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/globalbutton.dart';
import 'package:furniture/utils/common/gobletext.dart';
import 'package:furniture/utils/view/cartscreen/Submmit_order.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Appcolor.blackcolor,
          ),
        ),
        title: Center(
          child: Text(
            'check out',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Appcolor.blackcolor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                GobleText(
                  text: 'Shipping address',
                  textStyle: TextStyle(
                      color: Appcolor.greycolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Spacer(),
                Icon(
                  Icons.border_color_outlined,
                  color: Appcolor.blackcolor,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(
                    offset: Offset(2, 2),color: Appcolor.subcolor1
                  )],
                  color: Appcolor.subcolor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GobleText(
                    text: 'Bruno Fernades',
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Appcolor.blackcolor),
                  ),
                  Divider(
                    color: Appcolor.greycolor,
                  ),
                  GobleText(
                    text:
                        '25 rue Robert Latouche, Nice, 06200, Côte\n D’azur, France',
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Appcolor.blackcolor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GobleText(
                  text: 'Payment',
                  textStyle: TextStyle(
                      color: Appcolor.greycolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Spacer(),
                Icon(
                  Icons.border_color_outlined,
                  color: Appcolor.blackcolor,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  height: 68,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [BoxShadow(
                        offset: Offset(2, 2),color: Appcolor.subcolor1
                      )],
                      color: Appcolor.subcolor),
                  child: Row(
                    children: [
                      Container(
                        height: 38,
                        width: 64,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Appcolor.subcolor1),
                        child: Image(
                          image: AssetImage('asset/image/Group (1).png'),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        '**** **** **** 3947',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Appcolor.blackcolor),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GobleText(
                  text: 'Delivery method',
                  textStyle: TextStyle(
                      color: Appcolor.greycolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Spacer(),
                Icon(
                  Icons.border_color_outlined,
                  color: Appcolor.blackcolor,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  Container(
                    height: 68,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Appcolor.subcolor,
                      boxShadow: [BoxShadow(
                        offset:Offset(2, 2),color: Appcolor.subcolor1
                      )]
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 88,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Appcolor.subcolor1),
                          child: Image(
                            image: AssetImage('asset/image/Logo.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Fast (2-3days)',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Appcolor.blackcolor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 134,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Appcolor.subcolor,
                boxShadow: [BoxShadow(
                  offset: Offset(2, 2),color: Appcolor.subcolor1
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GobleText(
                          text: 'Order',
                          color: Appcolor.greycolor,
                          fontWeight: FontWeight.w400,
                          fontsize: 18,
                        ),
                        Spacer(),
                        GobleText(
                          text: '\$ 95.00',
                          textStyle: TextStyle(
                              color: Appcolor.blackcolor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        GobleText(
                          text: 'Delivery',
                          color: Appcolor.greycolor,
                          fontsize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        GobleText(
                          text: '\$ 5.00',
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                          ),
                          color: Appcolor.blackcolor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        GobleText(
                          text: 'Total',
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Appcolor.greycolor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        GobleText(
                          text: '\$ 100.00',
                          fontWeight: FontWeight.w600,
                          fontsize: 18,
                          color: Appcolor.blackcolor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SubmmitOredrScreen()));
              },
              child: GobleButton(
                height: 50,
                width: double.infinity,
                text: 'Check out',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
