import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

Widget ContinueChangeTab (_PageController){
  List <String>Data = [
    "Fresh Dough",
    "Safety and Quality Standerd",
    "finest ingredient"
  ];
  List <String>Image=[Dough,Quality,Ingredient];


  return PageView.builder(allowImplicitScrolling: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: Data.length,
      controller:_PageController,
      itemBuilder: (context, index) {
        return
          ListTile(title: Text("${Data[index]}",style: TextStyle(color:PrimaryColor,),textScaler: TextScaler.linear(1.5),),trailing: CircleAvatar(backgroundImage:AssetImage(Image[index]) ,radius: 30,),);}
  );
}