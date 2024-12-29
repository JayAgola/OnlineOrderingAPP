import 'package:flutter/material.dart';
import 'package:ordering_app/models/MenuModel.dart';

import '../components/HrMenuCard.dart';
import '../models/CartModel.dart';
import '../utils/colors.dart';
import '../utils/common.dart';
import '../utils/dataProvider.dart';
import 'CartPage.dart';

class ItemDetelisPage extends StatefulWidget{
  const ItemDetelisPage({super.key,required this.index,required this.list});
  final index;
  final list;
  @override
  State<StatefulWidget> createState() => _ItemDetelisPage();
}

class _ItemDetelisPage extends State<ItemDetelisPage>{
  @override
  Widget build(BuildContext context) {
    int i = widget.index;
    List<MenuModel> list= widget.list;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        surfaceTintColor: PrimaryColor,
        leadingWidth: 70,
        leading: Row(
          children: [
            SizedBox(width: 16,),
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(width:50,height: 50,child: Icon(Icons.arrow_back),decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white,border: Border.all(width: 2)),)),
          ],
        ),
        actions: [
          InkWell(
              onTap: (){
                Navigator.popUntil(context,(route) => route.isFirst,);
              },
              child: Container(width:50,height: 50,child: Icon(Icons.home),decoration: BoxDecoration(border: Border.all(width: 2),shape: BoxShape.circle,color: Colors.white),)),
          SizedBox(width: 16,)
        ],
      ),

      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 400,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${list[i].imageUrl}"),fit: BoxFit.fill),borderRadius: BorderRadius.circular(15)),),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(children: [
                    Container(width:15,height:15,decoration: BoxDecoration(border:Border.all(color: Colors.green,width: 2)),child:Icon(Icons.circle,color: Colors.green,size: 10,) ,),
                    SizedBox(width: 10,),
                    Container(alignment:Alignment.center,width:80,height:20,decoration: BoxDecoration(color: SecondryColor,borderRadius: BorderRadius.circular(5)),child: Text("BestSeller",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,fontSize: 10),),),
                  ],),
                  Text("${list[i].name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("Eating a wide variety of nutritious foods, including fruit,vegetables, nuts, seeds, and lean protein can he support your overall health."),
                  Text("\$ ${list[i].price}",style: PrimaryText(Colors.black),),
                  SizedBox(height: 30,),
                  Container(
                      height: 25,
                      width: 100,
                      color: Colors.white,
                      child: Text("You May Also Like",style: PrimaryText(PrimaryColor),)),
                ],
              ),),
            Container(
              child: HrMenuCard(MenuItemsList),
            )



          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          OrderList.add(MenuModel(id:list[i].id,name:list[i].name,imageUrl:list[i].imageUrl,price:list[i].price));
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CartPage(),),(route) => route.isFirst,);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom:20,left: 16,right: 16),
          height: 50,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green,PrimaryColor,PrimaryColor],begin: Alignment.topCenter,end: Alignment.bottomCenter),borderRadius: BorderRadius.circular(15)),
          child: Text("Add to Cart",style: PrimaryText( Colors.white),),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}