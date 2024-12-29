class UserInfoModel {
  int? user_id;
  String? name;
  String? email;
  String? password;


  UserInfoModel({this.user_id,this.name, this.email, this.password});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    user_id =json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
UserInfoModel? user;