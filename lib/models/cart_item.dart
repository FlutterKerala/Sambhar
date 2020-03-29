class CartItem {
  String name, imageUrl;
  double price, quantity;

  CartItem();

  CartItem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imageUrl = json['imageUrl'],
        price = json['price'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl' : imageUrl,
        'price': price,
        'quantity': quantity,
      };
}
