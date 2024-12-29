import 'package:http/http.dart' as http;
import 'package:ordering_app/utils/const.dart';
import 'dart:convert';
class CreateUserApi{
  static Future createUser(String name,String email,String passWord) async {
    var body1 = jsonEncode(<String,dynamic>{
        "name": name,
        "email":email,
        "password": passWord
    });
    final headers = {
      "Content-Type": "application/json", // Set Content-Type to application/json
    };
    print(body1);
    final response = await http.post(Uri.parse(AppApiConst.createUserUrl),
        headers: headers,
        body:body1,
    );
    if(response.statusCode == 400){
      return jsonDecode(response.body);
    }else if(response.statusCode == 201){
      return jsonDecode(response.body);
    }else{
      return jsonDecode(response.body);
    }

  }
}