import 'package:cloud_firestore/cloud_firestore.dart';

class SellerModel {
  String name,
      phone,
      gender,
      address,
      shopname,
      shoploc,
      gstid,
      homePincode,
      shopPincode,
      type;
  DateTime dob;

  SellerModel();

  SellerModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        gender = json['gender'],
        address = json['address'],
        homePincode = json['homePincode'],
        shopPincode = json['shopPincode'],
        dob = json['dob'].toDate(),
        shopname = json['shopname'],
        gstid = json['gstid'],
        shoploc = json["shoplocation"],
        type = "seller";

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'gender': gender,
        'address': address,
        'homePincode': homePincode,
        'shopPincode': shopPincode,
        'dob': dob,
        'shopname': shopname,
        'gstid': gstid,
        'shoplocation': shoploc,
        'type': "seller"
      };
}
