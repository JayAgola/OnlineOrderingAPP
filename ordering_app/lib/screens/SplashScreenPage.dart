import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ordering_app/api/menuApi.dart';
import 'package:ordering_app/screens/signInPage.dart';
import 'package:ordering_app/utils/colors.dart';
import 'package:ordering_app/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/UserInfoModel.dart';
import '../utils/dataProvider.dart';
import 'HomePage.dart';

class SplashScreenPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_SplashScreenPage();

}

class _SplashScreenPage extends State<SplashScreenPage>{
  Color col = Colors.white;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("--------------------------------------");

     MenuApi.getMenu().then((value){
       print(value);
       MenuItemsList = value;
     });
    Timer(Duration(seconds: 1),() => setState((){col=PrimaryColor;}),);
    Timer(Duration(seconds: 5), ()=>isLogin());
  }

isLogin() async {
  final prefs = await SharedPreferences.getInstance();
  print("============================${prefs.getString("userData")}");
  if(prefs.getString("userData") == null || prefs.getString("userData") == ""){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SingInPage(),));
  }else{
    user = UserInfoModel.fromJson(jsonDecode(prefs.getString("userData")!));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => route.isCurrent,);
  }
}
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: AnimatedContainer(
          duration: Duration(seconds: 2),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          alignment: Alignment.center,
          color: col,
          child: InkWell(
            onTap:(){
              setState((){col=PrimaryColor;});
              // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => LPSingInPage()),(route) => false,);
            },
            child: Hero(
                tag: "logo",
                child: Container(decoration:BoxDecoration(shape: BoxShape.circle,border: Border.all()),child: CircleAvatar(backgroundImage: AssetImage(Logo),radius: 100,))
            ),
          ),
        ),
      );
  }

}