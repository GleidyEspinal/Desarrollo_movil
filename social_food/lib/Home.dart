import 'package:flutter/material.dart';
import 'package:social_food/card_1.dart';
import 'package:social_food/card_2.dart';
import 'package:social_food/card_3.dart';

class Home extends StatefulWidget {
  const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

  class _HomeState extends State<Home> {

  int selectedIndex = 0;

  List<Widget> pages = [
    Card1(),
    Card2(),
    Card3()

  ];

  //Metodo para cambiar el indice del tab
  void selectedIndexChanged(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    //Para controlar el tab actual


  return Scaffold(
    appBar: AppBar(
      title: Text('Material App Bar',
          style: Theme.of(context).textTheme.headlineSmall,
      ),

  ),
    body: pages[selectedIndex],
    bottomNavigationBar: BottomNavigationBar(
      onTap: selectedIndexChanged,
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),
              label: "Card 1"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Card 2"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Card 3"
        ),
    ],),


  );
  }
}
