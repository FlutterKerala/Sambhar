import 'package:cloud_firestore/cloud_firestore.dart';

class SellerModel {
  String name,
      phone,
      gender,
      address,
      shopname,
      shoploc,
      gstid,
      shoppin,
      pincode,
      type;
  DateTime dob;

  SellerModel();

  SellerModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        gender = json['gender'],
        address = json['address'],
        pincode = json['pincode'],
        dob = json['dob'].toDate(),
        shopname = json['shopname'],
        gstid = json['gstid'],
        shoploc = json["shoplocation"],
        shoppin = json["shoppin"],
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
        'shoppin': shoppin,
        'shoplocation': shoploc,
        'type': "seller"
      };
}
