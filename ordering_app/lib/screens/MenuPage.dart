import 'package:flutter/material.dart';

import '../components/HrMenuCard.dart';
import '../components/TrendingItems.dart';
import '../components/VrMenuCard.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/dataProvider.dart';
import '../utils/images.dart';
import 'BottomNavigation.dart';
import 'ChangeOutletPage.dart';


class MenuPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_MenuPage();

}
class _MenuPage extends State<MenuPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height*0.16), child: Column(
        children: [
          Container(color: PrimaryColor,height: 40,),
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [PrimaryColor,PrimaryColor,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation(Index: 0),));
                    },child: Hero(tag: "logo",child: CircleAvatar(backgroundImage: AssetImage(Logo),backgroundColor: Colors.white,))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeOutletPage(),));
                          },
                          child: Row(
                              children: [
                                Text("Change Outlet",style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(1.1),),
                                Icon(Icons.keyboard_arrow_down,size: 30,color: Colors.white,),
                                SizedBox(width: 16,)
                              ]
                          ),
                        ),
                        Text("Kudasan, Gandhinagar",style: PrimaryText(Colors.white),textScaler: TextScaler.linear(1.4),)
                      ],
                    ),
                    Column(children: [
                      Container(width:60,alignment: Alignment.center,height:20,decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green,PrimaryColor,PrimaryColor,Colors.black],begin: Alignment.topCenter,end: Alignment.bottomCenter),borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),color: PrimaryColor),child:Text("4.17 ★",style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(0.9),) ),
                      Container(width:60,alignment: Alignment.center,height:35,decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),child:Text("   2721 \n Reviews",textScaler: TextScaler.linear(0.9),)),
                    ],)

                  ],
                ),
                Row(
                  children: [
                    Container(width: 225,height: 40,
                        margin: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey.shade200),
                        child:TextField(decoration: InputDecoration(hintText:"  Search Menu",suffixIcon:Icon(Icons.search),border: InputBorder.none ,),)
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent),borderRadius: BorderRadius.circular(15),color: SecondryColor),
                      child: Text("Pure Veg"),
                    ),
                  ],),

              ],
            ),
          ),
        ],),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 80,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))),
              child: Row(
                children: [
                  Text("Delivery 60 Mins approx",style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.3),),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 40,height: 40,
                    decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black12)),child: Icon(Icons.call_outlined,color: PrimaryColor,),),
                  Container(width: 40,height: 40,
                    decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black12)),child: Icon(Icons.navigation_outlined,color: PrimaryColor,),),
                ],
              ),
            ),
            Text("FEATURED ITEMS",style: PrimaryText(Colors.black),),
            TrendingItems(list: MenuItemsList),
            Text("BESTSELLERS",style: PrimaryText(Colors.black),),
            HrMenuCard(MenuItemsList),
            Text("MOST LOVED ITEMS",style: PrimaryText(Colors.black),),
            VrMenuCard(MenuItemsList),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          showDialog(context: context,builder: (context) =>  Dialog(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
              width: 300,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Menu",style: PrimaryText(Colors.black),),
                  Text("Personal Slice Veg Pizza.",style: TextStyle(fontSize: 15)),
                  Text("Pizzas",style: TextStyle(fontSize: 15)),
                  Text("Garlic Breads",style: TextStyle(fontSize: 15)),
                  Text("Sides",style: TextStyle(fontSize: 15)),
                  Text("Lasagna",style: TextStyle(fontSize: 15)),
                  Text("Spaghetti",style: TextStyle(fontSize: 15)),
                  Text("Desserts",style: TextStyle(fontSize: 15)),
                  Text("Dips",style: TextStyle(fontSize: 15)),

                ],
              ),
            ),
          ));
        },
        child: Container(height: 50,width: 120,
          margin: EdgeInsets.only(bottom: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(25),),child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.room_service_outlined,color: Colors.white,size: 18,),
              SizedBox(width: 10,),
              Text("Menu",style: TextStyle(color: Colors.white,fontSize: 18,),),
            ],
          ),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}