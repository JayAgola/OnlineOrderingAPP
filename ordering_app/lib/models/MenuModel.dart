// class MenuModel{
//   int? id;
//   String? itemName;
//   String? description;
//   String? itemImage;
//   String? itemPrice;
//   MenuModel({this.id,this.itemName,this.description,this.itemImage,this.itemPrice});
// }

class MenuModel {
  String? description;
  int? id;
  String? imageUrl;
  String? name;
  double? price;

  MenuModel({this.description, this.id, this.imageUrl, this.name, this.price});

  MenuModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imageUrl = json['image_url'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}