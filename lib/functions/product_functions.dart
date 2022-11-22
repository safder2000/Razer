import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/categories/widgets/catogory_tile_widgets.dart';

class ProductFn {
  static Stream<List<Product>> readProducts({required String catogory}) =>
      FirebaseFirestore.instance
          .collection('categories')
          .doc(catogory)
          .collection(catogory)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Product.fromJson(doc.data()))
              .toList());
}
