import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/models/UserInfoModel.dart';
import 'package:ordering_app/screens/signInPage.dart';

import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/images.dart';
import 'BottomNavigation.dart';
import 'CartPage.dart';
import 'ChangeOutletPage.dart';
import 'SearchMenuPage.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfilePage();

}
class _ProfilePage extends State<ProfilePage>{
  List list = ["MY Orders"," Coins","Manage Addresses","FAQs","How to track my Refund?","Raise a Concern","Share this App","Rate Us"];
  List<Icon> listIcon = [Icon(Icons.list_alt),Icon(Icons.wallet),Icon(Icons.location_pin),Icon(Icons.question_mark),Icon(CupertinoIcons.arrow_2_circlepath_circle),Icon(CupertinoIcons.exclamationmark_octagon),Icon(Icons.share),Icon(Icons.stars_outlined)];
  List PageList = [CartPage(),BottomNavigation(Index: 3),ChangeOutletPage(),BottomNavigation(Index: 3),BottomNavigation(Index: 3),BottomNavigation(Index: 0),SearchMenuPage(),BottomNavigation(Index: 0)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))),
        leadingWidth: 70,
        leading:Row(
          children: [
            SizedBox(width: 16,),
            InkWell(onTap: (){Navigator.pop(context);},child: Container(width:50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.white,width: 3)),child: Icon(Icons.arrow_back,color: Colors.white,size: 20,),)),
          ],
        ),
        actions: [
          TextButton(onPressed: (){

          }, child: Text("EDIT",style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),)),
        ],
        bottom: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width,40), child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [PrimaryColor,Colors.green])),
          child: Row(
            children: [
              Text("${user!.name}",style: PrimaryText(Colors.white),textScaler: TextScaler.linear(1.2),),
              Spacer(),
              Text("+91-7202058535",style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(1.2),),
            ],
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              margin: EdgeInsets.all(16),
              height: MediaQuery.sizeOf(context).height*0.50,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>PageList[index] ,));
                  },
                  child: SizedBox(
                    height: 53,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            listIcon[index],
                            SizedBox(width: 10,),
                            Text(list[index]),
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  ),
                ),)
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            height: MediaQuery.sizeOf(context).height*0.13,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Text("Pizza Store",textScaler: TextScaler.linear(1.2),style: TextStyle(fontWeight: FontWeight.bold),),
                Positioned(top: 20,child: Text("A 139 Pramukh arcade, Kudasan, Gandhinagar,\nGujarat 382421")),
                Positioned(
                  bottom: -40,left: 0,right: 0,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.orangeAccent.shade200,borderRadius: BorderRadius.circular(15)),height: 50,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.call,color: PrimaryColor,),
                        Text("Call Outlet",style: TextStyle(color: PrimaryColor),),
                        VerticalDivider(color: PrimaryColor,endIndent: 10,indent: 10,),
                        Icon(CupertinoIcons.location,color: PrimaryColor,),
                        Text("Get Directions",style: TextStyle(color: PrimaryColor),),
                      ],),),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.sizeOf(context).height*0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image(image: AssetImage(FacebookLogo),height: 50,width: 50,),
                    SizedBox(height: 5,),
                    Text("Like Us on"),
                    Text("Facebook",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                VerticalDivider(),
                Column(
                  children: [
                    Image(image: AssetImage(InstaLogo),height: 50,width: 50,),
                    SizedBox(height: 5,),
                    Text("Like Us on"),
                    Text("Instagarm",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
          Text("v2.5.4(2.5.6)",style: TextStyle(color: Colors.grey),),
          Text("Powerd by ",style: TextStyle(color: Colors.grey),),
          TextButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SingInPage(),), (route) => false);
          }, child: Text("Log Out",style: TextStyle(color: Colors.grey),)),
        ],),
      ),
    );
  }

}