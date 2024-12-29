import 'package:flutter/material.dart';
import 'package:ordering_app/models/MenuModel.dart';

import '../screens/ItemDetelisPage.dart';
import '../utils/colors.dart';
import '../utils/common.dart';

Widget TrendingItems({required List<MenuModel> list}){
  return Container(
    padding: EdgeInsets.only(right: 16),
    height: 300,
    child:GridView.builder(scrollDirection: Axis.horizontal,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,),itemBuilder: (context, index) => InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetelisPage(index :index,list: list,),));
      },
      child: Container(
          margin: EdgeInsets.only(left:16,top: 8,bottom: 8),
          width: 300,
          height: 300,
          child: Stack(fit:StackFit.expand,children: [
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),image: DecorationImage(image:NetworkImage(list[index].imageUrl!),fit: BoxFit.fill )),),
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.black.withOpacity(0.5),)),
            Positioned(left:16,top:16,child: Container(width:15,height:15,decoration: BoxDecoration(border:Border.all(color: Colors.green,width: 2)),child:Icon(Icons.circle,color: Colors.green,size: 10,) ,)),
            Positioned(left: 40,top: 16,child: Container(alignment:Alignment.center,width:60,height:15,decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(5)),child: Text("BestSeller",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),)),
            Positioned(left: 16,top: 36,child: Text(list[index].name!,style: PrimaryText(Colors.white),textScaler: TextScaler.linear(1.5),)),
            Positioned(left:16,bottom:26,child: Text("\$ ${list[index].price}",style: PrimaryText(Colors.white),textScaler: TextScaler.linear(1.3),)),
            Positioned(right:16,bottom: 26,child: Container(alignment:Alignment.center,height: 30,width: 80,decoration: BoxDecoration(border: Border.all(color: PrimaryColor),borderRadius: BorderRadius.circular(15),color: Colors.white),child: Text("Add +",style: TextStyle(fontWeight: FontWeight.bold,color: PrimaryColor),),))
          ])
      ),
    ),itemCount: list.length,),
  );
}