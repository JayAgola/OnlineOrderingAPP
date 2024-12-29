import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ordering_app/models/UserInfoModel.dart';

import '../components/AppBar.dart';
import '../components/ContinueChangeTeb.dart';
import '../components/ExploreMenuGrid.dart';
import '../components/HrMenuCard.dart';
import '../components/OfferZone.dart';
import '../components/TrendingItems.dart';
import '../components/VrMenuCard.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/dataProvider.dart';
import '../utils/images.dart';
import 'BottomNavigation.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>_HomePage();
}

class _HomePage extends State<HomePage>with TickerProviderStateMixin{
  List <String> tabList=["Delivery","Pickup","Dine In"];
  int _currentPage = 0;


  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.jumpToPage(_currentPage);

    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar2(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //AppBar1(context),
            Container(
              padding: EdgeInsets.only(left: 16,right: 16),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: PrimaryColor,gradient: LinearGradient(colors: [PrimaryColor,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome ${user!.name}",style: TextStyle(color: Colors.white,fontSize: 25),),
                  SizedBox(height: 8,),
                  Container(height:50,decoration:BoxDecoration(color: Colors.white.withOpacity(0.4),borderRadius: BorderRadius.circular(15),) ,
                    child: TabBar(tabs: [Tab(text:"Delivery",),Tab(text: "Pickup",),Tab(text: "Dine_in")],
                      controller: TabController(length: 3, vsync: this,),
                      onTap: (value) {
                        showDialog(context: context, builder: (context) => AlertDialog(surfaceTintColor: Colors.white,actionsAlignment: MainAxisAlignment.center,
                            actions: [ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("ok",style: PrimaryText( Colors.white),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(PrimaryColor),fixedSize: MaterialStatePropertyAll(Size(120, 30))),)],
                            title: Container(
                                width: 200,
                                height:100,
                                alignment: Alignment.center,
                                child: Text("you selcted ${tabList[value]}",style: PrimaryText( PrimaryColor),))),);
                      },
                      indicator: BoxDecoration(border: Border.all(color: Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,),
                      indicatorSize:TabBarIndicatorSize.tab,labelColor: Colors.white,),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    height: 100,
                    decoration: BoxDecoration(),
                    width: MediaQuery.sizeOf(context).width,
                    child: ContinueChangeTab(_pageController),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(16),
              child: InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation(Index: 2,),));
              },
                child: Container(clipBehavior: Clip.antiAlias,
                    padding: EdgeInsets.only(top: 16,left: 10,bottom: 16),
                    decoration: BoxDecoration(color: PrimaryColor,borderRadius: BorderRadius.circular(15)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("FLAT 50%. OFF",style: TextStyle(color: Colors.white,),textScaler: TextScaler.linear(2.5)),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width*0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("on Order Above RS. 200",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.clip,textScaler: TextScaler.linear(1.2),),
                                  Text("Not Valid on BOGO ,Beverages,Classic Pizzas, Slash Menu",style: TextStyle(color: Colors.white),overflow: TextOverflow.clip,textScaler: TextScaler.linear(1),),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    child: Text("Use Code : NEW50",style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(1.2),),color: Colors.black,),
                                  Text("Valid for New User Only",style: TextStyle(color: Colors.white),maxLines: 1,overflow: TextOverflow.clip,)
                                ],
                              ),
                            ),
                            CircleAvatar(backgroundImage: AssetImage(PizzaCross),minRadius: MediaQuery.sizeOf(context).width*0.19)
                          ],
                        )
                      ],)
                ),
              ),
            ),
            Container(padding: EdgeInsets.only(left: 16,right: 16,top: 5,bottom: 10),child: Text("Special Promos",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.5),)),
            OfferZone(),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left:16,top: 16,bottom: 16,right: 16),
                width: MediaQuery.sizeOf(context).width,
                color: SecondryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Text("Explore Menu",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.5),),
                  ExploreMenuGrid(MenuItemsList),
                ],)
            ),
            SizedBox(height: 16,),
            Text("   Trending Items",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.5),),
            TrendingItems(list: MenuItemsList),
            Text("   Bestsellers",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.5),),
            HrMenuCard(MenuItemsList),
            Text("   Newly Added Items",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.5),),
            VrMenuCard(MenuItemsList),
            Text("   Top Offers",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.5),),

          ],
        ),
      ),
    );
  }

}