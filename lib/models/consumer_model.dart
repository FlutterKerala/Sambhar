class ConsumerModel {
  String name, phone, gender, address, pincode;
  DateTime dob;

  ConsumerModel();

  ConsumerModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        gender = json['gender'],
        address = json['address'],
        pincode = json['pincode'],
        dob = json['dob'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'gender': gender,
        'address': address,
        'pincode': pincode,
        'dob': dob,
      };
}
