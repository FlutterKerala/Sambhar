class ConsumerModel {
  String name, phone, gender, address, pincode, type;
  DateTime dob;

  ConsumerModel();

  ConsumerModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        gender = json['gender'],
        address = json['address'],
        pincode = json['pincode'],
        dob = json['dob'].toDate(),
        type = "consumer";

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'gender': gender,
        'address': address,
        'pincode': pincode,
        'dob': dob,
        'type': "consumer"
      };
}
