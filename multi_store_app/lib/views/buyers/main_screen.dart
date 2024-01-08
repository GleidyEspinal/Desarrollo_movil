

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_store_app/views/buyers/nav_screens/account_screen.dart';
import 'package:multi_store_app/views/buyers/nav_screens/cart_screen.dart';
import 'package:multi_store_app/views/buyers/nav_screens/category_screen.dart';
import 'package:multi_store_app/views/buyers/nav_screens/home_screen.dart';
import 'package:multi_store_app/views/buyers/nav_screens/search_screen.dart';
import 'package:multi_store_app/views/buyers/nav_screens/store_screen.dart';

class MainScren extends StatefulWidget {
  const MainScren({super.key});

  @override
  State<MainScren> createState() => _MainScrenState();
}

class _MainScrenState extends State<MainScren> {
  int _pageIndex = 0;

  List<Widget> _listPages = [
    HomeScreen(),
    CategoryScreen(),
    StoreScreen(),
    CartScreen(),
    SearchScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.yellow.shade900,
          type: BottomNavigationBarType.fixed,
          currentIndex: _pageIndex,
          onTap: (value){
          setState(() {
            _pageIndex = value;
          });
          },
          items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
          ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/explore.svg", width: 20),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/store.svg", width: 20),
              label: "Store",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/cart.svg", width: 20),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/search.svg", width: 20),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/account.svg", width: 20),
              label: "Account",
            ),
        ],
      ),

      body: _listPages[_pageIndex],
    );
  }
}
