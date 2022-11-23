import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razer/model/product_model.dart';

final email = FirebaseAuth.instance.currentUser!.email;

Future addToCart({
  required Product product,
}) async {
  final docUser = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('cart')
      .doc(product.id);

  final json = product.toJson();
  log('cart function called');
  await docUser.set(json);
  log('added to cart');
}

Stream<List<Product>> readCart() => FirebaseFirestore.instance
    .collection('users')
    .doc(email)
    .collection('cart')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

removeFromCart({required String id}) {
  final docProduct = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('cart')
      .doc(id);
  docProduct.delete();
}
