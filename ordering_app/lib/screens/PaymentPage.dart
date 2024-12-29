import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/api/orderItemApi.dart';
import 'package:ordering_app/models/CartModel.dart';

import '../components/SecondAppBar.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/dataProvider.dart';
import '../utils/images.dart';

class PaymentPage extends StatefulWidget{
  const PaymentPage({super.key,required this.total});
  final total;
  @override
  State<StatefulWidget> createState() =>_PaymentPage();

}
class _PaymentPage extends State<PaymentPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:SecondAppBar(context) ,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.checkmark_shield_fill,color: PrimaryColor,size: 30,),
                Text(" Secure Payment Options",style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.5),),
              ],
            ),
            Container(
              height: MediaQuery.sizeOf(context).height*0.08,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.greenAccent.shade100,Colors.white,Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter,),
                border: Border.all(color: Colors.white,width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text("To Pay ${widget.total}",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.5),),),
            Text("     UPI",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.3),),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
              child: Column(
                children: [
                  ListTile(onTap: (){PaymentDone();},title: Text("BHIM",textScaler: TextScaler.linear(1.1),),leading: CircleAvatar(backgroundImage: AssetImage(BhimUpi),radius: 20,),trailing: Icon(Icons.arrow_forward_ios,color: PrimaryColor,),),
                  Divider(),
                  ListTile(onTap: (){PaymentDone();},title: Text("Google Pay",textScaler: TextScaler.linear(1.1),),leading: CircleAvatar(backgroundImage: AssetImage(GPayLogo),radius: 20,),trailing: Icon(Icons.arrow_forward_ios,color: PrimaryColor,),),
                  Divider(),
                  ListTile(title: Text("Add New UPI",textScaler: TextScaler.linear(1.1),),leading: Container(
                    decoration: BoxDecoration(color: Colors.black12,shape: BoxShape.circle,border: Border.all(color: PrimaryColor,width: 2)),
                    width: 50,
                    height: 50,
                    child: Icon(Icons.add,color: PrimaryColor,),
                  ),trailing:
                  Text("ADD",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),textScaler: TextScaler.linear(1.2),),),
                ],
              ),
            ),
            Text("     Wallets",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.3),),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
              child: Column(
                children: [
                  ListTile(onTap: (){PaymentDone();},title: Text("Mobikwik",textScaler: TextScaler.linear(1.1),),leading: CircleAvatar(backgroundImage: AssetImage(Mobikwik),radius: 20,),trailing: Icon(Icons.arrow_forward_ios,color: PrimaryColor,),),
                ],
              ),
            ),
            Text("     Debit Card",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.3),),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
              child: Column(
                children: [
                  ListTile(title: Text("Add New Debit Card",textScaler: TextScaler.linear(1.1),),
                    leading:Container(
                      decoration: BoxDecoration(color: Colors.black12,shape: BoxShape.circle,border: Border.all(color: PrimaryColor,width: 2)),
                      width: 50,
                      height: 50,
                      child: Icon(Icons.add,color: PrimaryColor,),
                    ),trailing:
                    Text("ADD",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),textScaler: TextScaler.linear(1.2),),),
                ],
              ),
            ),
            Text("     Credit Card",style: PrimaryText(Colors.black),textScaler: TextScaler.linear(1.3),),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
              child: Column(
                children: [
                  ListTile(title: Text("Add New Credit Card",textScaler: TextScaler.linear(1.1),),leading:
                  Container(
                    decoration: BoxDecoration(color: Colors.black12,shape: BoxShape.circle,border: Border.all(color: PrimaryColor,width: 2)),
                    width: 50,
                    height: 50,
                    child: Icon(Icons.add,color: PrimaryColor,),
                  ),trailing:
                  Text("ADD",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),textScaler: TextScaler.linear(1.2),),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  PaymentDone(){
List<OrderItemModel>orderItem =[];
for(int i = 0; i < OrderList.length;i++){
  print(OrderList[i].id);
  if(orderItem.any((item) => item.product_id ==OrderList[i].id) == false){
    orderItem.add(OrderItemModel(product_id:OrderList[i].id,quantity: 1));
  }else{
    int k = orderItem.indexWhere((element) => element.product_id == OrderList[i].id);
    orderItem[k].quantity = orderItem[k].quantity! + 1;
  }
}
OrderItemApi.orderItem(orderItem);
    showDialog(barrierDismissible: false,context: context, builder: (context) => Dialog(
      elevation: 2.0,
      alignment: Alignment.center,surfaceTintColor: Colors.white,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(16),
        width: 200,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle,color: Colors.white,),
            Text("Payment Done",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.5),),
          ],
        ),decoration:BoxDecoration(color: Colors.green,shape: BoxShape.circle) ,),
    ),);
    Timer(Duration(seconds: 3), () {
      Navigator.popUntil(context, (route) =>route.isFirst);
      OrderList.removeRange(0, OrderList.length);
    });

  }
}