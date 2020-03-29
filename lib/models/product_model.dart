class ProductModel {
  String name, category, imageUrl;
  double price;
  bool availability;

  ProductModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        category = json['category'],
        imageUrl = json['imageUrl'],
        price = json['price'],
        availability = json['price'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category,
        'imageUrl': imageUrl,
        'price': price,
        'availability': availability,
      };
}
