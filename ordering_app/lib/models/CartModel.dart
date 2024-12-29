class CartModel {
  String? itemName;
  String? itemIamge;
  String? itemPrice;
  CartModel({this.itemName,this.itemIamge,this.itemPrice});
}
class OrderItemModel{
  int? product_id;
  int? quantity;
  OrderItemModel({this.product_id,this.quantity});
  OrderItemModel.fromJson(Map<String, dynamic> json) {
    product_id = json["product_id"];
    quantity = json["quantity"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["product_id"] = this.product_id;
    data["quantity"] = this.quantity;
    return data;
  }
}