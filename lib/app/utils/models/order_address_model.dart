class OrderAddressModel {
  String? name, phone, sex, provinceId, districtId, wardId, address;

  OrderAddressModel({
    this.name,
    this.phone,
    this.sex,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.address,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['sex'] = this.sex;
    data['city'] = this.provinceId;
    data['district'] = this.districtId;
    data['ward'] = this.wardId;
    data['address'] = this.address;
    return data;
  }
}
