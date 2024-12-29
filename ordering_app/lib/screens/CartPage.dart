import 'package:flutter/material.dart';

import '../components/EmptyCart.dart';
import '../components/HrMenuCard.dart';
import '../components/SecondAppBar.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/dataProvider.dart';
import 'PaymentPage.dart';

class CartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_CartPage();
}
class _CartPage extends State<CartPage>{
  double  sum = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(OrderList.isNotEmpty){
      for(int i= 0;i < OrderList.length;i++){
        sum=sum + OrderList[i].price!;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    if(OrderList.isEmpty){
      return Scaffold(
        appBar: SecondAppBar(context),
        body:EmptyCart(context),
      );
    }
    else{
      return Scaffold(
        appBar: SecondAppBar(context),
        body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Items Added",style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.5),),
                Container(
                  height: MediaQuery.sizeOf(context).height*0.3,
                  child: ListView.builder(
                    itemCount: OrderList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction)
                          {
                            sum = sum - int.parse("${OrderList[index].price}");
                            setState(() {
                              OrderList.removeAt(index);
                            });
                            if(OrderList.isEmpty){
                              return setState(() {

                              });
                            }
                          },
                          onResize: (){

                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(color: Colors.white,border: Border.all(),borderRadius: BorderRadius.circular(15),boxShadow: [BoxShadow(blurRadius: 5)]),
                            child: ListTile(shape: RoundedRectangleBorder(),
                                tileColor: Colors.white,
                                title:Text("${OrderList[index].name}"),leading: CircleAvatar(backgroundImage: AssetImage("${OrderList[index].imageUrl}"),),trailing: Text("${OrderList[index].price}")),
                          ));
                    },),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text("Total",style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.5)),
                      Spacer(),
                      Text("$sum",textScaler: TextScaler.linear(1.2),),
                    ],
                  ),),
                Text("People also Add this ",style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.5),),
                SizedBox(height: 16,),
                HrMenuCard(MenuItemsList),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25),)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PaymentPage(total:sum),));
            },
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green,PrimaryColor,PrimaryColor],begin: Alignment.topCenter,end: Alignment.bottomCenter),borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$sum",style: PrimaryText( Colors.white),),
                  Text("Pay Securely",style: PrimaryText( Colors.white),),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    }
  }

}