import 'package:flutter/material.dart';
import 'package:ordering_app/api/loginApi.dart';
import 'package:ordering_app/screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/images.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPage();

}
class _LoginPage extends State<LoginPage>{
  String email = "";
  String password ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
            alignment: Alignment.center,
            children: [Column(
              children: [
                Container(height: MediaQuery.sizeOf(context).height*0.4,color: Colors.black12,),
                Container(height: MediaQuery.sizeOf(context).height*0.6,child: Image(image: AssetImage(FestivCom),fit: BoxFit.fill,))
              ],
            ),
              Container(color: Colors.white.withOpacity(0.3),width: MediaQuery.sizeOf(context).width,height: MediaQuery.sizeOf(context).height,),
              Positioned(top:MediaQuery.sizeOf(context).height*0.1,
                  child: Hero(tag: "logo",child: CircleAvatar(backgroundImage: AssetImage(Logo),radius: 80,))),
              Positioned(
                right: 16,
                left: 16,
                top: MediaQuery.sizeOf(context).height*0.35,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height*0.4,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.8),borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Log in into your account",textScaler: TextScaler.linear(1.5),),
                        // Text("We'll send you a verification code to help us keep your account safe."),
                        //TextFormField(onChanged: (value){ name = value;},decoration: InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide: BorderSide.none),hintText: "Enter Your Name",filled: true,fillColor: Colors.black26,),keyboardType: TextInputType.numberWithOptions(),textAlign: TextAlign.center,),
                        TextFormField(onChanged: (value){email = value;},decoration: InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide: BorderSide.none),hintText: "Enter Your Email",filled: true,fillColor: Colors.black26,),keyboardType: TextInputType.numberWithOptions(),textAlign: TextAlign.center,),
                        TextFormField(onChanged: (value){password = value;},decoration: InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide: BorderSide.none),hintText: "Enter Your Password",filled: true,fillColor: Colors.black26,),keyboardType: TextInputType.numberWithOptions(),textAlign: TextAlign.center,),
                        // TextField(onChanged:(value){
                        //   value1 = value;
                        // },decoration: InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide: BorderSide.none),hintText: "Enter Phone number",filled: true,fillColor: Colors.black26,),keyboardType: TextInputType.numberWithOptions(),textAlign: TextAlign.center,),
                        InkWell(
                          onTap: () {
                            if(email != "" && password != "") {
                              LoginApi.login(email, password)
                                  .then((value) async {
                                print(value);
                                if(value == "Invalid email or password"){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email or password")));
                                }
                                if(value == "Login successful"){
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),),(route) => route.isCurrent,);
                                }
                              });
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter all Details")));
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top:20,left: 16,right: 16),
                            height: 50,
                            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green,PrimaryColor,PrimaryColor],begin: Alignment.topCenter,end: Alignment.bottomCenter),borderRadius: BorderRadius.circular(15)),
                            child: Text("Sign In",style: PrimaryText( Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )

            ]
        ),
      ),
    );
  }

}