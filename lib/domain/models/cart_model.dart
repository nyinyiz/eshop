class CartModel {
  int productId;
  int count;

  CartModel({this.productId, this.count});

  CartModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['count'] = this.count;
    return data;
  }
}
