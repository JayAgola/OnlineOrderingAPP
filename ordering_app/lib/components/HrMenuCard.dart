

import 'package:flutter/material.dart';
import 'package:ordering_app/models/MenuModel.dart';

import '../screens/ItemDetelisPage.dart';
import '../utils/colors.dart';
import '../utils/common.dart';


Widget HrMenuCard(List<MenuModel> list){
  return Container(
    margin: EdgeInsets.only(left: 16,right: 16,),
    height: 1300,
    child: ListView.builder(physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) => InkWell(
          child: Container(
            margin: EdgeInsets.only(bottom: 16),
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white,boxShadow:[BoxShadow(color: Colors.black,blurRadius: 3,)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 26,),
                    Row(children: [
                      Container(width:15,height:15,decoration: BoxDecoration(border:Border.all(color: Colors.green,width: 2)),child:Icon(Icons.circle,color: Colors.green,size: 10,) ,),
                      SizedBox(width: 10,),
                      Container(alignment:Alignment.center,width:80,height:20,decoration: BoxDecoration(color: SecondryColor,borderRadius: BorderRadius.circular(5)),child: Text("BestSeller",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,fontSize: 10),),),
                    ],),
                    Text(list[index].name!,style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.5),),
                    Text("An Exotic Combination of..",overflow:TextOverflow.clip,textScaler: TextScaler.linear(1),),
                    Row(children: [
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                    ],),
                    SizedBox(height: 20,),
                    Text("\$ ${list[index].price}",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.5),),
                  ],),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.sizeOf(context).width*0.3,
                  height: MediaQuery.sizeOf(context).height*0.20,
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${list[index].imageUrl!}"),fit: BoxFit.fill),borderRadius: BorderRadius.circular(15)),
                  child: Container(alignment: Alignment.center,height:30,width: 90,decoration: BoxDecoration(color:Colors.white,border: Border.all(color: PrimaryColor,width: 2),borderRadius: BorderRadius.circular(10)),
                    child: Text("Add +",style: TextStyle(color: PrimaryColor),),),
                )
              ],),),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetelisPage(index :index,list: list),));
          },
        )
    ),
  );
}