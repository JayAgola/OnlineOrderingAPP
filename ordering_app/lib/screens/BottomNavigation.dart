

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'CartPage.dart';
import 'CoinesPage.dart';
import 'HomePage.dart';
import 'MenuPage.dart';

class BottomNavigation extends StatefulWidget{
  const BottomNavigation({super.key,required this.Index,});
  final Index;
  @override
  State<StatefulWidget> createState() => _BottomNavigation();

}
class _BottomNavigation extends State<BottomNavigation>{
  int selectedIndex =0;
  PageController pageController=PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.Index;
    pageController=PageController(initialPage: selectedIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            selectedIndex =index;
            if(index==1){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>CartPage()));
              //index =0;
              selectedIndex=0;
            }
            else{
              pageController.jumpToPage(index);

            }
            return setState(() {

            });

          },
          currentIndex: selectedIndex,
          showSelectedLabels:true ,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          selectedItemColor: PrimaryColor,
          selectedIconTheme: IconThemeData(color: PrimaryColor),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size:35,),
              label: "La Pino'z",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket_outlined,
                  size: 35,
                ),
                label: "Cart"
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                  size: 35,
                ),
                label: "Menu"
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.currency_exchange,
                  size: 35,),
                label: " Coins"
            ),]

      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomePage(),
          CartPage(),
          MenuPage(),
          CoinesPage()
        ],
      ),
    );
  }

}