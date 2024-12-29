import 'package:flutter/material.dart';


import '../screens/ChangeOutletPage.dart';
import '../screens/ProfilePage.dart';
import '../screens/SearchMenuPage.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

Widget AppBar1(context){
  return Column(
    children: [
      Container(color: PrimaryColor,height: 40,),
      Container(
        color: PrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar( backgroundImage: AssetImage(Logo)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ChangeOutletPage(),));
                  },
                  child: Row(
                      children: [
                        Text("Change Outlet",style: TextStyle(color: Colors.white,fontSize: 16),),
                        Icon(Icons.keyboard_arrow_down,size: 30,color: Colors.white,),
                      ]
                  ),
                ),
                Text("Kudasan, Gandhinagar",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
              ],
            ),
            InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));},child: Container(width:40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),child: Icon(Icons.person_outline,size: 30,color:Colors.white ,))),
            InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMenuPage(),));},child: Container(width: 40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),child: Icon(Icons.search,size: 30,color: Colors.white,))),
          ],
        ),
      ),
    ],
  );
}
AppBar AppBar2(context){
  return AppBar(
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft:Radius.circular(25))),
    leading: Container(padding:EdgeInsets.only(left: 16),child: Hero(tag: "logo",child: CircleAvatar( backgroundImage: AssetImage(Logo),backgroundColor: Colors.white,radius: 40,))),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>ChangeOutletPage(),));
          },
          child: Row(
              children: [
                Text("Change Outlet",style: TextStyle(color: Colors.white,),textScaler: TextScaler.linear(0.7),),
                Icon(Icons.keyboard_arrow_down,size: 30,color: Colors.white,),
              ]
          ),
        ),
        Text("Kudasan, Gandhinagar",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textScaler: TextScaler.linear(0.9),)
      ],
    ),
    backgroundColor: PrimaryColor,
    actions: [
      InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));},child: Container(width:40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),child: Icon(Icons.person_outline,size: 30,color:Colors.white ,))),
      SizedBox(width: 10,),
      InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMenuPage(),));},child: Container(width: 40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),child: Icon(Icons.search,size: 30,color: Colors.white,))),
      SizedBox(width: 16,)
    ],
  );
}