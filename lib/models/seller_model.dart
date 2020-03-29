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
      home_pincode,
      shop_pincode,
      type;
  DateTime dob;

  SellerModel();

  SellerModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        gender = json['gender'],
        address = json['address'],
<<<<<<< HEAD
        home_pincode = json['home_pincode'],
        shop_pincode = json['shop_pincode'],
        dob = json['dob'],
=======
        pincode = json['pincode'],
        dob = json['dob'].toDate(),
>>>>>>> 8759535eba8e2aeffe9d2c46bce16a3f36e4a2e1
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
        'home_pincode': home_pincode,
        'shop_pincode' : shop_pincode,
        'dob': dob,
        'shopname': shopname,
        'gstid': gstid,
        'shoppin': shoppin,
        'shoplocation': shoploc,
        'type': "seller"
      };
}
