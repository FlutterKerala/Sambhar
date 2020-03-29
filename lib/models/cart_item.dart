class CartItem {
  String name;
  double price, quantity;

  CartItem();

  CartItem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'quantity': quantity,
      };
}
