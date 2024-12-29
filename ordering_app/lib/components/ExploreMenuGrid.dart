import 'package:flutter/material.dart';
import 'package:ordering_app/models/MenuModel.dart';

import '../screens/ExploreMenuPage.dart';
import '../utils/colors.dart';


Widget ExploreMenuGrid(List<MenuModel> list,){
  return  Container(
    color: SecondryColor,
    height: 650,
    child: GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // number of items in each row// spacing between rows
        // spacing between columns
      ),// padding around the grid
      itemCount: list.length, // total number of items
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreMenuPage()));
          },
          child: Container(// color of grid items
              child: Column(children: [
                CircleAvatar(backgroundImage:NetworkImage(list[index].imageUrl!),radius: 35,),
                Text(
                  list[index].name!,style: TextStyle(fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1),
                ),
              ],)
          ),
        );
      },
    ),
  )
  ;
}