import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/images.dart';
import 'BottomNavigation.dart';

class OtpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OtpPage();

}
class _OtpPage extends State<OtpPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.1),
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
            children:[
              Positioned(
                bottom: 0,
                child: Container(
                  height:  MediaQuery.sizeOf(context).height*0.4,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(PizzaCross),fit: BoxFit.fill,)),),
              ),
              Container(
                height:  MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white.withOpacity(0.7),),
              Column(
                children: [
                  Text("Verify your phone number",style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.5),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("OTP has been sent to ",textScaler: TextScaler.linear(1.2),),
                      Text("7202058535",style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.2),),
                      Text(" Edit",style: TextStyle(color: PrimaryColor,decoration: TextDecoration.underline),textScaler: TextScaler.linear(1.2),),
                    ],
                  ),
                  Container(
                    height: 50,width: MediaQuery.sizeOf(context).width,
                    margin: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(width: 50,height: 50,
                            child: TextField(decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: PrimaryColor,width: 2),borderRadius: BorderRadius.circular(15)),filled: true,fillColor: Colors.black12,border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12),borderRadius: BorderRadius.circular(15)),),keyboardType: TextInputType.number,)),
                        Container(width: 50,height: 50,
                            child: TextField(decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: PrimaryColor,width: 2),borderRadius: BorderRadius.circular(15)),filled: true,fillColor: Colors.black12,border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12),borderRadius: BorderRadius.circular(15)),),keyboardType: TextInputType.number,)),
                        Container(width: 50,height: 50,
                            child: TextField(decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: PrimaryColor,width: 2),borderRadius: BorderRadius.circular(15)),filled: true,fillColor: Colors.black12,border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12),borderRadius: BorderRadius.circular(15)),),keyboardType: TextInputType.number,)),
                        Container(width: 50,height: 50,
                            child: TextField(decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: PrimaryColor,width: 2),borderRadius: BorderRadius.circular(15)),filled: true,fillColor: Colors.black12,border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12),borderRadius: BorderRadius.circular(15)),),keyboardType: TextInputType.number,)),
                        Container(width: 50,height: 50,
                            child: TextField(decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: PrimaryColor,width: 2),borderRadius: BorderRadius.circular(15)),filled: true,fillColor: Colors.black12,border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12),borderRadius: BorderRadius.circular(15)),),keyboardType: TextInputType.number,)),
                        Container(width: 50,height: 50,
                            child: TextField(decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: PrimaryColor,width: 2),borderRadius: BorderRadius.circular(15)),filled: true,fillColor: Colors.black12,border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12),borderRadius: BorderRadius.circular(15)),),keyboardType: TextInputType.number,)),
                      ],),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavigation(Index: 0),), (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top:20,left: 16,right: 16),
                      height: 50,
                      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green,PrimaryColor,PrimaryColor],begin: Alignment.topCenter,end: Alignment.bottomCenter),borderRadius: BorderRadius.circular(15)),
                      child: Text("Continue",style: PrimaryText( Colors.white),),
                    ),
                  ),
                ],
              )
            ] ),
      ),
    );
  }

}