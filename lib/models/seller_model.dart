class SellerModel {
  String name, phone, gender, address, shopname, shoploc, gstid, pincode, type;
  DateTime dob;

  SellerModel();

  SellerModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        gender = json['gender'],
        address = json['address'],
        pincode = json['pincode'],
        dob = json['dob'],
        shopname = json['shopname'],
        gstid = json['gstid'],
        shoploc = json["shoplocation"],
        type = "seller";

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'gender': gender,
        'address': address,
        'pincode': pincode,
        'dob': dob,
        'shopname': shopname,
        'gstid': gstid,
        'shoplocation': shoploc,
        'type': "seller"
      };
}
