import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/HrMenuCard.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/dataProvider.dart';
import '../utils/images.dart';
import 'CartPage.dart';


class ExploreMenuPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ExploreMenuPage();

}
class _ExploreMenuPage extends State<ExploreMenuPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leadingWidth: 40,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
        backgroundColor: Colors.white,
        leading:InkWell(onTap: (){Navigator.pop(context);},child:
        Container(width: 50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.black,width: 3)),child: Icon(Icons.arrow_back,size: 25,),)),
        title: Text("Pizzas",style: TextStyle(color: Colors.black,),),
        actions: [
          InkWell(onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
          },child: CircleAvatar(backgroundImage: AssetImage(CartImg),))
        ],
        bottom: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width,70), child:
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
          ],)        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("TRADITIONAL VEG",textScaler: TextScaler.linear(2),),
            HrMenuCard(MenuItemsList),
            Text("YOU MAY ALSO LIKE",textScaler: TextScaler.linear(2),),
            HrMenuCard(MenuItemsList),
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