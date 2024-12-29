import 'package:flutter/material.dart';

import '../screens/BottomNavigation.dart';
import '../utils/colors.dart';
import '../utils/images.dart';


Widget EmptyCart(context){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 150,
          height: 150,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(CartImg),fit: BoxFit.fill)),),
        Text("Your Cart is Empty",style: TextStyle(fontSize: 25),),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation(Index: 2,),));
          },
          child: Container(
            alignment:Alignment.center,decoration: BoxDecoration(color: PrimaryColor,borderRadius:BorderRadius.circular(15),gradient: LinearGradient(colors: [Colors.green,PrimaryColor,Colors.black],begin: Alignment.topCenter,end: Alignment.bottomCenter)),width: 150,height: 50,child: Text("Order Now",style: TextStyle(color: Colors.white,fontSize: 15),),),
        )
      ],
    ),
  );
}