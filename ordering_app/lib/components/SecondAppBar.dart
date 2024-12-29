import 'package:flutter/material.dart';

AppBar SecondAppBar (context){
  return AppBar(
    leadingWidth: 56,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    leading: Row(
      children: [
        SizedBox(width: 16,),
        InkWell(onTap: (){
          Navigator.pop(context);
        },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.black,width: 2)),child: Icon(Icons.arrow_back,size: 30,),),),
      ],
    ),
    title:Text("Pizza Store",style: TextStyle(fontWeight: FontWeight.bold),),
    shape: RoundedRectangleBorder(),);
}