import 'package:flutter/material.dart';

import '../components/SecondAppBar.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/images.dart';

//import 'package:geolocator/geolocator.dart';
class ChangeOutletPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ChangeOutletPage();

}
class _ChangeOutletPage extends State<ChangeOutletPage>{
  List<String> list = ["Ahemdabad","Agra","Alwar","Anand","Ayodhya","Amreli","Goa","Gandhinagar","Surat"];
  List<String> list1=["A","B","C","D","E","F"];
  //Position? _currentPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(margin:EdgeInsets.all(16),padding: EdgeInsets.only(left: 16),alignment:Alignment.center,decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(15)),
              child: TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.search),border: InputBorder.none,hintText: "Search for area, city name...")),),
            Container(
              margin:EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: Colors.black,blurRadius: 2)]),
              child: Column(
                children: [
                  Text("My Favorites",style: PrimaryText(Colors.black),),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: Colors.black,blurRadius: 2)]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(backgroundImage: AssetImage(Logo),radius: 30),
                            Text("La Pino'z Pizza",style: TextStyle(fontSize: 18),),
                            Text("Kudasan,\nGandhinagar")
                          ],
                        ),)
                    ],
                  )
                ],
              ),),
            Container(
              margin:EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(color: Colors.black,blurRadius: 2)]),
              child: Column(
                  children: [
                    Text("Choose by City",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.2),),
                    Divider(),
                    Container(
                      height:1000,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: list1.length,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Container(margin:EdgeInsets.only(left: 16,top: 16,right: 8),alignment:Alignment.center,width: MediaQuery.sizeOf(context).width*0.13,height: 50,child: Text("${list1[index]}",style: PrimaryText( Colors.white),),decoration: BoxDecoration(color: PrimaryColor,shape: BoxShape.circle),),
                            Container(height: 200,
                              width: MediaQuery.sizeOf(context).width*0.73,
                              padding: EdgeInsets.only(right: 8,top: 16),
                              child:
                              Wrap(
                                children: List.generate(list.length, (index) => Container(decoration: BoxDecoration(color: SecondryColor,borderRadius: BorderRadius.circular(10)),
                                  margin:EdgeInsets.all(8) ,padding: EdgeInsets.all(8),height: 35,
                                  child: Text(list[index],style: TextStyle(color: PrimaryColor),textScaler: TextScaler.linear(1.2),),),),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
              ),),

          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          // _getCurrentLocation();
          // showDialog(context: context, builder: (context) =>AlertDialog(
          //   title: Text(
          // "LAT: ${_currentPosition?.latitude}, LNG: ${_currentPosition?.longitude}"),
          // ),);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 30,left: 20,right: 20),

          height: 50,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green,PrimaryColor,PrimaryColor],begin: Alignment.topCenter,end: Alignment.bottomCenter),borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.control_point,color: Colors.white,size: 20,),
              Text("Use your Current Location",style: PrimaryText( Colors.white),)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
// _getCurrentLocation() {
//   Geolocator
//       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
//       .then((Position position) {
//     _currentPosition= position;
//   }).catchError((e) {
//     print(e);
//   });
// }
}

