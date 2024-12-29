import 'package:flutter/material.dart';

import '../utils/dataProvider.dart';
import 'ItemDetelisPage.dart';



class SearchMenuPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SearchMenuPage();

}
class _SearchMenuPage extends State<SearchMenuPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
        backgroundColor: Colors.white,
        leading:Row(
          children: [
            SizedBox(width: 16,),
            InkWell(onTap: (){Navigator.pop(context);},child:
            Container(width: 50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.black,width: 3)),child: Icon(Icons.arrow_back,size: 25,),)),
          ],
        ),
        title: Text("Search Menu",style: TextStyle(color: Colors.black,),),
        bottom: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width,70), child: Container(
            margin: EdgeInsets.all(16),
            child: Container(width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black12),
              child: TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.search),hintText: "  Search for  items or more...",border: InputBorder.none)),
            )
        )),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Popular Searches",textScaler:TextScaler.linear(1.2),style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: 500,
                child: ListView.builder(physics: NeverScrollableScrollPhysics(),itemCount: MenuItemsList.length,itemBuilder: (context, index) => ListTile(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetelisPage(index: index, list: MenuItemsList),));
                },leading: Image(image: AssetImage("${MenuItemsList[index].imageUrl}"),height: 50,width: 50,fit: BoxFit.fill,),title: Wrap(children:[ Container(width:15,height:15,decoration: BoxDecoration(border:Border.all(color: Colors.green,width: 2)),child:Icon(Icons.circle,color: Colors.green,size: 10,))]),subtitle: Text("${MenuItemsList[index].name}"),trailing: Icon(Icons.trending_up,color: Colors.green,),shape: Border(bottom: BorderSide(color: Colors.grey)) ),),
              )
            ],
          ),
        ),
      ),
    );
  }


}