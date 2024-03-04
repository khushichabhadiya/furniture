import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/gobletext.dart';

class BellScreen extends StatefulWidget {
  const BellScreen({super.key});

  @override
  State<BellScreen> createState() => _BellScreenState();
}

class Bellscreen {
  String image;
  String title;
  String subtitle;
  String name;
  Color color;

  Bellscreen({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.name,
    required this.color
  });
}

List<Bellscreen> balscreen = [
  Bellscreen(
    image: 'asset/image/Media (3).png',
    title: 'Your order #123456789 has \nbeen shipped successfully',
    subtitle: 'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. ',
    name: 'New',color: Colors.green,
  ),
  Bellscreen(
    image: 'asset/image/2681826 1 (3).png',
    title: 'Your order #123456789 has been\n shipped',
    subtitle: 'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. ',
    name: 'New',color: Colors.green,
  ),
  Bellscreen(
    image: 'asset/image/2681826 1 (4).png',
    title: 'Your order #123456789 has been\n confirmed',
    subtitle: 'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. ',
    name: 'Hot',color: Colors.red,
  ),
  Bellscreen(
    image: 'asset/image/2681826 1 (5).png',
    title: 'Discover hot sale furnitures this\n week.',
    subtitle: 'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. ',
    name: 'Hot',color: Colors.red,
  ),
  Bellscreen(
    image: 'asset/image/2681826 1 (6).png',
    title: 'Your order #123456789 has been\n canceled',
    subtitle: 'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. ',
    name: '',color: Colors.white,
  ),
];

class _BellScreenState extends State<BellScreen> {
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
            'Notofication',
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
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 84,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 2), color: Appcolor.subcolor1),
                        ], color: Appcolor.subcolor,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  image: DecorationImage(
                                      image: AssetImage(balscreen[index].image),
                                      scale: 2)),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    GobleText(
                                      text: balscreen[index].title,
                                      textStyle: TextStyle(
                                          color: Appcolor.blackcolor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GobleText(
                                          text: balscreen[index].subtitle,
                                          textStyle: TextStyle(
                                              color: Appcolor.greycolor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),

                                    GobleText(text: balscreen[index].name,textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: balscreen[index].color,
                                    ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
