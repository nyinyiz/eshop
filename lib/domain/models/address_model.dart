class AddressModel {
  int id;
  String name;
  String address;
  String city;
  String country;
  String postalCode;

  AddressModel(
      {this.id,
      this.name,
      this.address,
      this.city,
      this.country,
      this.postalCode});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['postalCode'] = this.postalCode;
    return data;
  }
}
