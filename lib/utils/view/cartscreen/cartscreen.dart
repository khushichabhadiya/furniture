import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/globalbutton.dart';
import 'package:furniture/utils/common/gobletext.dart';
import 'package:furniture/utils/view/cartscreen/mycart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

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

class _CartScreenState extends State<CartScreen> {
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
                                      image: AssetImage(Cartscreen[index].image),
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
                                Image.asset(
                                  Cartscreen[index].image2,
                                  scale: 3,
                                ),
                              ],
                            )
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
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MyCartScreen()));
                },
                child: GobleButton(
                    height: 50,
                    width: double.infinity,
                    text: 'Add all to my cart',

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
