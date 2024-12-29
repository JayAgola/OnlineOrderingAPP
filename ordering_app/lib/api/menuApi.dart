// import 'dart:convert';
//
// import 'package:ordering_app/models/MenuModel.dart';
// import 'package:http/http.dart' as http;
// class MenuApi{
//   static Future getMenu() async{
//     dynamic menu;
//     final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/product'));
//      if(response.statusCode == 200) {
//        print(response.body);
//       menu = response.body;
//       return List.from(menu).map((e)=>MenuModel.fromJson(e)).toList();
//      }
//      else{
//        print(response.body);
//      }
//
// }
// }
import 'dart:convert';
import 'package:ordering_app/models/MenuModel.dart';
import 'package:http/http.dart' as http;
import 'package:ordering_app/utils/const.dart';

class MenuApi {
  static Future<List<MenuModel>> getMenu() async {
    try {
      final response =
      await http.get(Uri.parse(AppApiConst.menuUrl));

      if (response.statusCode == 200) {
        // Decode the response body to JSON
        final List<dynamic> jsonData = json.decode(response.body);

        // Map the JSON data to the MenuModel
        return jsonData.map((e) => MenuModel.fromJson(e)).toList();
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        return []; // Return an empty list on error
      }
    } catch (e) {
      print("Exception: $e");
      return []; // Return an empty list on exception
    }
  }
}
