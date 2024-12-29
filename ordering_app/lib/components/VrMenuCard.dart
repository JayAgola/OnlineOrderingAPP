import 'package:flutter/material.dart';
import 'package:ordering_app/models/MenuModel.dart';

import '../screens/ItemDetelisPage.dart';
import '../utils/colors.dart';
import '../utils/common.dart';


Widget VrMenuCard(List<MenuModel> list){
  return Container(
    height: 1035,
    margin: EdgeInsets.only(left: 16,right: 16),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing:5,crossAxisSpacing: 5,crossAxisCount: 2,childAspectRatio: 0.55),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) => InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetelisPage(index :index,list: list,),));
        },
        child: Container(
          height: 400,
          padding: EdgeInsets.only(left: 8,right: 8),
          decoration:BoxDecoration(boxShadow:[BoxShadow(color: Colors.black,blurRadius: 5)],borderRadius: BorderRadius.circular(15),color: Colors.white),
          margin: EdgeInsets.all(8),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Container(
                height: MediaQuery.sizeOf(context).height*0.15,
                decoration: BoxDecoration(image:DecorationImage(image: NetworkImage(list[index].imageUrl!),fit: BoxFit.fill),borderRadius: BorderRadius.only(topRight:Radius.circular(15),topLeft:Radius.circular(15) ) ),),
              Spacer(),
              Row(children: [Container(width:15,height:15,decoration: BoxDecoration(border:Border.all(color: Colors.green,width: 2)),child:Icon(Icons.circle,color: Colors.green,size: 10,) ,),
                SizedBox(width: 10,),
                Container(alignment:Alignment.center,width:60,height:15,decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(5)),child: Text("BestSeller",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),),],),
              Text(list[index].name!,style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.5),),
              Container(width:MediaQuery.sizeOf(context).width*0.35,child: Text("Customization Available",style: TextStyle(color: PrimaryColor,overflow: TextOverflow.clip),)),
              Text("\$ ${list[index].price}",style: PrimaryText(Colors.black),),
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 13),
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(border: Border.all(color: PrimaryColor,width: 2),borderRadius: BorderRadius.circular(10)),
                child: Text("Add +",style: PrimaryText(PrimaryColor),),)
            ],),
        ),
      ),
    ),
  );
}