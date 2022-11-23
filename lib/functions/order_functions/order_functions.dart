import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razer/model/order_product_model.dart';

import '../../model/product_model.dart';

class OrderFunctions {
  static final email = FirebaseAuth.instance.currentUser!.email;

  static Future addToCart({
    required Product product,
    required int quantinty,
  }) async {
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .collection('orders')
        .doc(product.id);

    final orderedProduct = OrderedProduct(
        id: product.id,
        name: product.name,
        description: product.description,
        spec: product.spec,
        price: product.price,
        quantity: product.quantity,
        colors: product.colors,
        rating: product.rating,
        images: product.images,
        orderQuantity: quantinty);
    final json = orderedProduct.toJson();
    await docUser.set(json);
  }
}
