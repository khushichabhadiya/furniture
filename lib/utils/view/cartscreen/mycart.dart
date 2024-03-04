import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/globalbutton.dart';
import 'package:furniture/utils/common/gobletext.dart';
import 'package:furniture/utils/common/textfiled.dart';
import 'package:furniture/utils/view/cartscreen/check_out.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

TextEditingController namecontroller = TextEditingController();

class cartScreen {
  String image;
  String image2;
  String image3;
  String title;
  String price;

  cartScreen({
    required this.image,
    required this.image2,
    required this.image3,
    required this.title,
    required this.price,
  });
}

List<cartScreen> Cartscreen = [
  cartScreen(
      image: 'asset/image/2681826 1.png',
      image2: 'asset/image/Cart.png',
      image3: 'asset/image/Shape.png',
      title: 'Minimal Stand',
      price: ' 25.00'),
  cartScreen(
      image: 'asset/image/2681826 1 (1).png',
      image2: 'asset/image/Cart.png',
      image3: 'asset/image/Shape.png',
      title: 'Minimal Stand',
      price: '25.00'),
  cartScreen(
      image: 'asset/image/2681826 1 (2).png',
      image2: 'asset/image/Cart.png',
      image3: 'asset/image/Shape.png',
      title: 'Minimal Stand',
      price: '25.00'),
  cartScreen(
      image: 'asset/image/Media6.png',
      image2: 'asset/image/Cart.png',
      image3: 'asset/image/Shape.png',
      title: 'Minimal Stand',
      price: '25.00'),
];

class _MyCartScreenState extends State<MyCartScreen> {
  int selectindex = 1;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Favorites',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Appcolor.blackcolor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Appcolor.subcolor),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(Cartscreen[index].image),
                                      scale: 2)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GobleText(
                                    text: Cartscreen[index].title,
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Appcolor.greycolor),
                                  ),
                                  GobleText(
                                    text: Cartscreen[index].price,
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Appcolor.blackcolor),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Appcolor.subcolor1,
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Appcolor.blackcolor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Appcolor.subcolor1,
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        child: Center(
                                            child: Text(
                                          '1',
                                          style: TextStyle(
                                              color: Appcolor.blackcolor),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Appcolor.subcolor1,
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Appcolor.blackcolor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  Cartscreen[index].image3,
                                  scale: 3,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 20,
                          color: Appcolor.subcolor1),
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Enter Your Promo Code',
                          contentPadding: EdgeInsets.only(left: 20),
                          labelStyle: TextStyle(color: Appcolor.greycolor),
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Appcolor.blackcolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Appcolor.whitecolor,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  GobleText(text: "Total",textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Appcolor.blackcolor
                  ),
                  ),
                  Spacer(),
                  GobleText(text: '\$ 95.00',textStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,
                  color: Appcolor.blackcolor),)
                ],
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CheckOutScreen()));
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
      ),
    );
  }
}
