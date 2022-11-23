import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razer/model/address_model.dart';

class AddressFunctions {
  static final _email = FirebaseAuth.instance.currentUser!.email;

  static saveAddress({
    required String name,
    required List<int> number,
    required List<int> pincode,
    required String state,
    required String city,
    required String localArea,
  }) async {
    final addressDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(_email)
        .collection('address')
        .doc();
    final AddressModel _address = AddressModel(
        name: name,
        number: number,
        pincode: pincode,
        state: state,
        city: city,
        localArea: localArea,
        id: addressDoc.id);
    final json = _address.toJson();
    await addressDoc.set(json);
  }
}
