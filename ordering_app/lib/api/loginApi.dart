import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ordering_app/models/UserInfoModel.dart';
import 'package:ordering_app/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi{
  static Future login(email ,password) async {
    var body1 = jsonEncode(<String,dynamic>{
      "email":email,
      "password":password
    });
    print(body1);
    final headers = {
      "Content-Type": "application/json", // Set Content-Type to application/json
    };
    final response = await http.post(Uri.parse(AppApiConst.loginUrl),headers: headers,body: body1);
    if(response.statusCode == 200){
      String data = response.body;

      user = UserInfoModel.fromJson(jsonDecode(data));
      print(user!.name);
      final  prefs = await SharedPreferences.getInstance();
      prefs.setString("userData", data);
      return "Login successful";
    }else{
      return "Invalid email or password";
    }
  }
}