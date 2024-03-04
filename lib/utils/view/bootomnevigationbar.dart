import 'package:flutter/material.dart';
import 'package:furniture/utils/common/appcolor.dart';
import 'package:furniture/utils/view/notification_screen/bellscreen.dart';
import 'package:furniture/utils/view/cartscreen/cartscreen.dart';
import 'package:furniture/utils/view/homescreen/homescreen.dart';
import 'package:furniture/utils/view/profilescreen/profilescreen.dart';

class BootomNavigationBarScreen extends StatefulWidget {
  int? selectedindex;
  BootomNavigationBarScreen({super.key,this.selectedindex});

  @override
  State<BootomNavigationBarScreen> createState() => _BootomNavigationBarScreenState();
}

class _BootomNavigationBarScreenState extends State<BootomNavigationBarScreen> {

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CartScreen(),
    BellScreen(),
    ProfileScreen (),

  ];


  void onItemTapped(int index) {
    setState(() {
     widget.selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(widget.selectedindex!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
                'asset/image/clarity_home-solid.png',
                height: 24,
                width: 24,
                color: widget.selectedindex == 0
                    ? Appcolor.blackcolor
                    : Appcolor.greycolor
            ),
              label: ""
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
                'asset/image/marker 1.png',
                height: 24,
                width: 24,
                color: widget.selectedindex == 1
                    ? Appcolor.blackcolor
                    : Appcolor.greycolor
            ),
              label: ""
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
                'asset/image/bell.png',
                height: 24,
                width: 24,
                color: widget.selectedindex == 2
                    ? Appcolor.blackcolor
                    : Appcolor.greycolor
            ),
              label: ""
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
                'asset/image/bi_person.png',
                height: 24,
                width: 24,
                color: widget.selectedindex == 3
                    ? Appcolor.blackcolor
                    : Appcolor.greycolor
            ),
            label: ""

          ),

        ],
        currentIndex: widget.selectedindex!,
        selectedItemColor: Appcolor.blackcolor,
        onTap: onItemTapped,
        showUnselectedLabels: false,
        unselectedItemColor: Appcolor.greycolor,
        selectedLabelStyle: TextStyle(fontSize: 0),
        unselectedLabelStyle: TextStyle(fontSize: 0),
      ),
    );
  }
}
