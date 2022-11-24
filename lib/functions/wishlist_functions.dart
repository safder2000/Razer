import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razer/model/product_model.dart';

final email = FirebaseAuth.instance.currentUser!.email;

Future addToWishlist({
  required Product product,
}) async {
  final docUser = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('wishlist')
      .doc(product.id);

  final json = product.toJson();
  await docUser.set(json);
}

Stream<List<Product>> readWishlist() => FirebaseFirestore.instance
    .collection('users')
    .doc(email)
    .collection('wishlist')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

removeFromWishlist({required String id}) {
  final docProduct = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('wishlist')
      .doc(id);
  docProduct.delete();
}
