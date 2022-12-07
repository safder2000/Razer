import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razer/model/order_product_model.dart';

import '../../model/product_model.dart';
import 'package:intl/intl.dart';

class OrderFunctions {
  static final email = FirebaseAuth.instance.currentUser!.email;

  static Future addToOrder({
    required Product product,
    required int quantinty,
  }) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM - kk:mm:ss ').format(now);
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .collection('orders')
        .doc(product.id);

    final totalOrders =
        FirebaseFirestore.instance.collection('orders').doc(formattedDate);
    // .collection(formattedDate)
    // .doc(product.id);

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
        orderQuantity: quantinty,
        user: email!,
        isCanceled: false,
        isDeliverd: false,
        time: formattedDate);
    final json = orderedProduct.toJson();
    Map<String, dynamic> count = {
      'id': product.id,
      'name': product.name,
      'user': email,
      'count': quantinty,
      'images': product.images,
      'description': formattedDate,
      // 'time': formattedDate,
      'isDeliverd': false,
      'isCanceled': false,
    };
    await docUser.set(json);
    await totalOrders.set(count);
  }

  static Stream<List<OrderedProduct>> readOrders() => FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('orders')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => OrderedProduct.fromJson(doc.data()))
          .toList());

  static cancelOrder({
    required String productId,
    required String date,
  }) async {
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .collection('orders')
        .doc(productId);

    final totalOrders =
        FirebaseFirestore.instance.collection('orders').doc(date);
    await totalOrders.update({'isCanceled': true});
    await docUser.update({'isCanceled': true});
  }
}
