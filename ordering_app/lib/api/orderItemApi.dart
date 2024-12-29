import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ordering_app/models/UserInfoModel.dart';
import 'package:ordering_app/utils/const.dart';

import '../models/CartModel.dart';
class OrderItemApi{
  static Future orderItem(List<OrderItemModel> items) async {
    print(items[0].product_id);
    final headers = {
      "Content-Type": "application/json", // Set Content-Type to application/json
    };

    var body1 = jsonEncode(<String,dynamic>{
      "user_id": user!.user_id,
      "items":items
    });
    print(body1);
    final response = await http.post(Uri.parse(AppApiConst.orderItemUrl),headers:headers ,body:body1 );
    print(response.body);
  }
}