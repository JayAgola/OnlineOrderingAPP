import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/images.dart';
Widget OfferZone() {
  List<Color>OfferColors =[Colors.blue.shade100,Colors.greenAccent.shade100,Colors.orange.shade100 ];
  return Container(
    padding: EdgeInsets.only(right: 16),
    height:240,
    child: ListView.builder(scrollDirection: Axis.horizontal,itemCount:3,itemBuilder: (context, index) => InkWell(
      onTap: (){
        showBottomSheet(context: context, builder: (context) => Container(
          color: Colors.white,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height*0.6,
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height*0.30,
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                    color: OfferColors[index]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width*0.55,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('FLAT',
                            style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.2),),
                          Text("\$50\nOFF", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PrimaryColor),textScaler: TextScaler.linear(2.2)),
                          Text("ON ORDER ABOVE 299",
                            style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.clip,textScaler: TextScaler.linear(1.2),),
                          Container(padding: EdgeInsets.all(5),
                            child: Text("Use Code N50",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(05),
                                border: Border.all(color: PrimaryColor)),),
                        ],
                      ),
                    ),
                    Container(decoration: BoxDecoration(image: DecorationImage(
                        image: AssetImage(PizzaFront), fit: BoxFit.scaleDown),
                        shape: BoxShape.circle), width:MediaQuery.sizeOf(context).width*0.35, height: MediaQuery.sizeOf(context).height*0.30,)
                  ],),
              ),
              Container(
                height:MediaQuery.sizeOf(context).height*0.30 ,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Flat RS.50 Off",style: PrimaryText(Colors.black),maxLines: 1,),
                          Text("1) Flat  Rs. 50 Off On minimum order Of Rs. 299",overflow:TextOverflow.clip,maxLines: 1,),
                          Text("2) Cannot be clubbed with any other offers",overflow: TextOverflow.clip,maxLines: 1,),
                          Text("3) Not Valid on BOGO,Classic Maniacs Pizza,\nBeverages and Combos",overflow: TextOverflow.clip,maxLines: 1,),
                        ],),
                    ),
                    Container(padding:EdgeInsets.only(left: 16),height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25,),border: Border.all(color: Colors.orange),),
                      child: Row(children: [
                        Text("Use code"),
                        Text(" N50",style: PrimaryText(Colors.black),),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(colors: [Colors.green,PrimaryColor],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
                          child: Text("Copy Code",style: TextStyle(color: Colors.white),),),
                      ],),),
                    InkWell(onTap: (){
                      Navigator.pop(context);
                    },child: Container(alignment: Alignment.center,child: Text("Okay, I got it!",style: TextStyle(color: PrimaryColor),textScaler: TextScaler.linear(1.5),),)),

                  ],
                ),
              ),
            ],
          ),
        ),);
      },
      child: Container(
        margin: EdgeInsets.only(left: 16),
        width: MediaQuery.sizeOf(context).width*0.85,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: OfferColors[index]),
        child: Row(children: [
          Container(
            width: MediaQuery.sizeOf(context).width*0.4,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('FLAT',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Spacer(flex: 1,),
                Row(
                  children: [
                    Text("\$50\nOFF", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PrimaryColor),textScaler: TextScaler.linear(2.1),),
                  ],
                ),
                Spacer(flex: 1,),
                Text("ON ORDER ABOVE 299",
                  style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.2),),
                Spacer(flex: 1,),
                Container(height: 35,
                  padding: EdgeInsets.all(5),
                  child: Text("Use Code N50",
                      style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.clip,textScaler: TextScaler.linear(1)),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(05),
                      border: Border.all(color: PrimaryColor)),),
              ],
            ),
          ),
          Container(decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage(PizzaFront), fit: BoxFit.scaleDown,),
              shape: BoxShape.circle),height: MediaQuery.sizeOf(context).height*0.35,width: MediaQuery.sizeOf(context).width*0.35,)
        ],),
      ),
    ),),
  );
}