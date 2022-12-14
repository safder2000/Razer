import 'dart:convert';

class Product {
  final String id;
  final String name;
  final String description;
  final String spec;
  final List colors;
  final num rating;
  final num price;
  final num quantity;

  final List images;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.spec,
    required this.price,
    required this.quantity,
    required this.colors,
    required this.rating,
    required this.images,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'spec': spec,
        'price': price,
        'quantity': quantity,
        'colors': colors,
        'rating': rating,
        'images': images,
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
        name: json['name'],
        id: json['id'],
        description: json['description'],
        spec: json['spec'],
        price: json['price'],
        quantity: json['quantity'],
        colors: json['colors'],
        rating: json['rating'],
        images: json['images'],
      );
}
