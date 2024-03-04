import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/appimage.dart';
import 'package:furniture/utils/common/apptext.dart';
import 'package:furniture/utils/common/gobletext.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children:[
           SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 455,
                      width: 323,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/image/Media-1.png'))),
                    ),
                  ]
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GobleText(
                        text: AppText.product,
                        color: Appcolor.blackcolor,
                      ),
                      Row(
                        children: [
                          GobleText(
                            text: '50',
                            color: Appcolor.blackcolor,
                          ),
                         Spacer(),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Appcolor.subcolor,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(Appimage.product1), scale: 3)),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Appcolor.subcolor,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(Appimage.product2), scale: 3)),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Appcolor.subcolor,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(Appimage.product3), scale: 3)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image: AssetImage(Appimage.product4),
                                    )),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GobleText(
                                text: '4.5',
                                color: Appcolor.blackcolor,
                                fontsize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GobleText(
                                text: '(50 reviews)',
                                color: Appcolor.greycolor,
                                fontWeight: FontWeight.w400,
                                fontsize: 14,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          GobleText(
                            text: AppText.product1,
                            color: Appcolor.greycolor,
                            fontsize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Appcolor.greycolor,
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                        image: AssetImage(Appimage.product5),
                                        scale: 3
                                    ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                height: 60,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(Colors.black),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)))),
                                    onPressed: () {},
                                    child: GobleText(
                                      text: 'Add to cart',
                                      fontWeight: FontWeight.w400,
                                      fontsize: 16,
                                    ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
                       ),
           ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Appcolor.greycolor
                    ),
                    child: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                Container(
                  height: 192,
                  width: 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: Appcolor.greycolor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle
                          ),
                          child:
                          Center(
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  color: Appcolor.subcolor,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle
                          ),
                          child:
                          Center(
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  color: Appcolor.stcak,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle
                          ),
                          child:
                          Center(
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  color: Appcolor.stcak1,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),

              ],
            ),

      ]
        ),

      ),
    );
  }
}
