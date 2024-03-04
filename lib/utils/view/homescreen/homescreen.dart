import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:furniture/utils/view/cartscreen/cartscreen.dart';
import 'package:furniture/utils/view/cartscreen/mycart.dart';
import 'package:http/http.dart'as http;
import 'package:furniture/Model/product_model.dart';
import 'package:furniture/utils/view/TabBarScreen/armchairscreen.dart';
import 'package:furniture/utils/view/TabBarScreen/bedscreen.dart';
import 'package:furniture/utils/view/TabBarScreen/chairscreen.dart';
import 'package:furniture/utils/view/homescreen/popularscreen.dart';
import 'package:furniture/utils/view/TabBarScreen/tabelscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/appcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class homescreen {
  String image;
  String title;
  String subtitle;

  homescreen({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<homescreen> Homescreen = [
  homescreen(
      image: 'asset/image/Media.png',
      title: 'Black Simple Lamp',
      subtitle: '\$  12.00'),
  homescreen(
    image: 'asset/image/Media (1).png',
    title: 'Minimal Stand',
    subtitle: '\$  25'
        '.00',
  ),
  homescreen(
    image: 'asset/image/media3.jpg',
    title: 'Coffee Chair',
    subtitle: '\$  12.00',
  ),
  homescreen(
    image: 'asset/image/Media (2).png',
    title: 'Simple Desk',
    subtitle: '\$  12.00',
  ),
];

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int selectindex = 0;
  late TabController _tabController;
  Future<List<ProductModel>>? productdetail;
  String? Token;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    productdetail = GetProduct();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectindex = index;
    });
  }


  Future<List<ProductModel>> GetProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.getString('token', data['token']);
    Token = prefs.getString('token');
    log(Token.toString());
    final response = await http.get(
      Uri.parse('https://typescript-al0m.onrender.com/api/user/product/showall-product'),
      headers: {'Authorization':"Bearer $Token"}
    );
    if(response.statusCode == 200){
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();

    }else{
      throw Exception('Failed to load employess');
    }

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'asset/image/ri_search-2-line.png',
          scale: 3,
        ),
        title: Center(
          child: RichText(
            text: TextSpan(
              text: 'MAKE HOME',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                  text: '\nBEAUTIFUL',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Appcolor.homescreen),
                ),
              ],
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MyCartScreen()));
            },
            child: Image.asset(
              'asset/image/bi_cart2.png',
              scale: 3,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(

          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
               height: 70,
              child: TabBar(
                labelPadding: const EdgeInsets.only(bottom: 1),
                padding: EdgeInsets.zero,
                dividerHeight: 0,
                indicatorColor: Appcolor.whitecolor,
                controller: _tabController,
                labelColor: Appcolor.homescreen,
                unselectedLabelColor: Appcolor.homescreen,
                labelStyle: const TextStyle(fontSize: 11),
                tabs: [
                  Column(
                    children: [
                      Container(
                        // height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: selectindex == 0
                              ? Appcolor.whitecolor
                              : Appcolor.whitecolor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'asset/image/Rectangle 42.png',
                          scale: 3,
                          // color: selectindex == 0
                          //     ? Colors.white
                          //     : Appcolor.whitecolor,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Popular',
                        style: TextStyle(
                            // color: selectindex == 0
                            //     ? Appcolor.homescreen
                            //     : Colors.black
                            ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        // height: 42,
                        width: 42,
                        decoration: const BoxDecoration(
                          // color: selectindex == 1
                          //     ? Appcolor.homescreen
                          //     : Appcolor.greycolor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'asset/image/Chair.png',

                          scale: 3,
                          // color: selectindex == 1
                          //     ? Colors.white
                          //     : Appcolor.greycolor,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Chair',
                        style: TextStyle(
                            // color: selectindex == 1
                            //     ? Appcolor.homescreen
                            //     : Colors.black
                            ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        // height: 42,
                        width: 42,
                        decoration: const BoxDecoration(
                            // color: selectindex == 2
                            //     ? Appcolor.blackcolor
                            //     : Appcolor.homescreen,

                            ),
                        child: Image.asset(
                          'asset/image/table 1 1.jpg',
                          scale: 3,
                          // color: selectindex == 2
                          //     ? Colors.white
                          //     : Appcolor.blackcolor,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'table',
                        style: TextStyle(
                            color: selectindex == 2
                                ? Appcolor.greycolor
                                : Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        // height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: selectindex == 3
                              ? Appcolor.greycolor
                              : Appcolor.homescreen,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'asset/image/Armchair.png',
                          scale: 3,
                          // color: selectindex == 3
                          //     ? Colors.white
                          //     : Appcolor.homescreen,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Armchair',
                        style: TextStyle(
                            color: selectindex == 3
                                ? Appcolor.greycolor
                                : Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        // height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: selectindex == 4
                              ? Appcolor.blackcolor
                              : Appcolor.homescreen,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'asset/image/Bed.png',
                          scale: 3,
                          // color: selectindex == 4
                          //     ? Colors.white
                          //     : Appcolor.whitecolor,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Bed',
                        style: TextStyle(
                            color: selectindex == 4
                                ? Appcolor.greycolor
                                : Colors.black),
                      ),
                    ],
                  ),
                ],
                onTap: _onItemTapped,
                mouseCursor: MouseCursor.uncontrolled,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const PopularScreen(),
                  const ChairScreen(),
                  const TabelScreen(),
                  const Armchairscreen(),
                  const BedScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
