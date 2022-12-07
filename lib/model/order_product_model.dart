import 'dart:convert';

class OrderedProduct {
  final String id;
  final String name;
  final String time;
  final String user;
  final String description;
  final String spec;
  final List colors;
  final num rating;
  final num price;
  final num quantity;
  final num orderQuantity;
  final bool isDeliverd;
  final bool isCanceled;

  final List images;
  OrderedProduct({
    required this.id,
    required this.name,
    required this.time,
    required this.user,
    required this.description,
    required this.spec,
    required this.price,
    required this.quantity,
    required this.colors,
    required this.rating,
    required this.images,
    required this.orderQuantity,
    required this.isDeliverd,
    required this.isCanceled,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'time': time,
        'user': user,
        'description': description,
        'spec': spec,
        'price': price,
        'quantity': quantity,
        'colors': colors,
        'rating': rating,
        'images': images,
        'orderQuantity': orderQuantity,
        'isDeliverd': isDeliverd,
        'isCanceled': isCanceled,
      };

  static OrderedProduct fromJson(Map<String, dynamic> json) => OrderedProduct(
        name: json['name'],
        time: json['time'],
        id: json['id'],
        user: json['user'],
        description: json['description'],
        spec: 'empty',
        price: json['price'],
        quantity: json['quantity'],
        colors: json['colors'],
        rating: json['rating'],
        images: json['images'],
        orderQuantity: json['orderQuantity'],
        isDeliverd: json['isDeliverd'],
        isCanceled: json['isCanceled'],
      );
}
