import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/common/gobletext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/product_model.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
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

List<homescreen> furnituredata = [
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
Future<List<ProductModel>>? productdetail;
String? Token;
@override
void initState() {
  productdetail = GetProduct();
}

Future<List<ProductModel>> GetProduct() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.getString('token', data['token']);
  Token = prefs.getString('token');
  log("tokeeen1 ${Token.toString()}");
  final response = await http.get(
      Uri.parse(
          'https://typescript-al0m.onrender.com/api/user/product/showall-product'),
      headers: {'Authorization': 'Bearer $Token'});
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => ProductModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load employess');
  }
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ProductModel>>(
        future: GetProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 21),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                ProductModel Product = snapshot.data![index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   image: AssetImage(furnituredata[index].image),
                          //   fit: BoxFit.cover,
                          // ),
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      GobleText(
                        text: Product.productName.toString(),
                        fontWeight: FontWeight.w400,
                        fontsize: 14,
                        color: Appcolor.blackcolor,
                      ),
                      GobleText(
                        text: Product.productPrice.toString(),
                        // fontfamily: GoogleFonts.abhayaLibre().toString(),
                        fontWeight: FontWeight.w600,
                        fontsize: 14,
                        color: Appcolor.homescreen,
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
