import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/images.dart';
import 'BottomNavigation.dart';
import 'ChangeOutletPage.dart';
import 'ProfilePage.dart';
import 'SearchMenuPage.dart';


class CoinesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_CoinesPage();

}
class _CoinesPage extends State<CoinesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 75), child: Column(
          children: [
            Container(color: PrimaryColor,height: 40,),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),gradient: LinearGradient(colors: [PrimaryColor,PrimaryColor,Colors.green],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
              child: Row(
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
                              Text("Change Outlet",style: TextStyle(color: Colors.white,fontSize: 16),),
                              Icon(Icons.keyboard_arrow_down,size: 30,color: Colors.white,),
                            ]
                        ),
                      ),
                      Text("Kudasan, Gandhinagar",style: PrimaryText( Colors.white),)
                    ],
                  ),
                  SizedBox(width: 20,),
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));},child: Container(width:40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),child: Icon(Icons.person_outline,size: 30,color:Colors.white ,))),
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMenuPage(),));},child: Container(width: 40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),child: Icon(Icons.search,size: 30,color: Colors.white,))),
                ],
              ),
            ),
          ],
        )),
        body:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(boxShadow:[BoxShadow(color: Colors.grey,spreadRadius: 2)],color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(" 0     COINS",style: PrimaryText(PrimaryColor),textScaler: TextScaler.linear(1.5),),
                      Text("Get  Coins on Evrey Order"),
                      SizedBox(height: 15,),
                      LinearProgressIndicator(minHeight: 20,color: PrimaryColor,backgroundColor: SecondryColor,value: 0,borderRadius: BorderRadius.circular(25)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("ACE",style: TextStyle(color: PrimaryColor.withOpacity(0.7),fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange.shade200),child: Icon(CupertinoIcons.suit_spade_fill,color: Colors.white,size: 45,),)
                            ],
                          ),
                          Column(
                            children: [
                              Text("PRIME",style: TextStyle(color: PrimaryColor.withOpacity(0.7),fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange.shade200),child: Icon(CupertinoIcons.suit_club_fill,color: Colors.white,size: 45,),)
                            ],
                          ),
                          Column(
                            children: [
                              Text("ELITE",style: TextStyle(color: PrimaryColor.withOpacity(0.7),fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange.shade200),child: Icon(Icons.star,color: Colors.white,size: 45,),)
                            ],
                          ),
                          Column(
                            children: [
                              Text("LEGEND",style: TextStyle(color: PrimaryColor.withOpacity(0.7),fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange.shade200),child: Icon(CupertinoIcons.xmark_shield_fill,color: Colors.white,size: 45,),)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Text("   How TO Get There" ,style: PrimaryText( Colors.black),),
                Container(
                  decoration: BoxDecoration(boxShadow:[BoxShadow(color: Colors.grey,spreadRadius: 2)],color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.star_circle,color: Colors.grey,size: 45,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(" \$ 0",style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.2),),
                              Text("You've Spent"),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(" \$ 1000",style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.2),),
                              Text("Goal"),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.report_outlined,size: 35,),
                          Text("Place Order Worth Rs. 1000 to Upgrade \nYour Account to ACE Level",textScaler: TextScaler.linear(1),),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children : [
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange.shade200),child: Icon(CupertinoIcons.suit_spade_fill,color: Colors.white,),),
                                Container(
                                    height:200,child: VerticalDivider(indent: 8,endIndent: 8,)),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("ACE",style: TextStyle(color: PrimaryColor,),textScaler: TextScaler.linear(1.2),),
                                  Text("Get  Coines worth 5% of \nyour order amount"),
                                ],
                              ),
                            )

                          ]
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children : [
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange.shade200),child: Icon(CupertinoIcons.suit_club_fill,color: Colors.white,),),
                                Container(
                                    height:200,child: VerticalDivider(indent: 8,endIndent: 8,)),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("PRIME",style: TextStyle(color: PrimaryColor,),textScaler: TextScaler.linear(1.2)),
                                  Text("Get  Coines worth 10% of \nyour order amount"),
                                ],
                              ),
                            )

                          ]
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children : [
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange.shade200),child: Icon(Icons.star,color: Colors.white,),),
                                Container(
                                    height:200,child: VerticalDivider(indent: 8,endIndent: 8,)),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("ELITE",style: TextStyle(color: PrimaryColor,),textScaler: TextScaler.linear(1.2)),
                                  Text("Get  Coines worth 15% of \nyour order amount"),
                                ],
                              ),
                            )

                          ]
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children : [
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange.shade200),child: Icon(CupertinoIcons.xmark_shield_fill,color: Colors.white,),),

                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("LEGEND",style: TextStyle(color: PrimaryColor,),textScaler: TextScaler.linear(1.2)),
                                  Text("Get  Coines worth 20% of \nyour order amount"),
                                ],
                              ),
                            )

                          ]
                      ),

                    ],
                  ),

                )
              ],
            )
        )
    );
  }
}
