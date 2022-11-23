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

  static Future<List<AddressModel>> fetchAllAddresses() async {
    final _currentEntries = FirebaseFirestore.instance
        .collection('users')
        .doc(_email)
        .collection('address')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList());
    final temp = await _currentEntries.first;
    return temp;
  }

  static Stream<List<AddressModel>> fetchAllAddressesStream() {
    final _currentEntries = FirebaseFirestore.instance
        .collection('users')
        .doc(_email)
        .collection('address')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList());
    return _currentEntries;
  }

  static removeAddress({required String id}) {
    final docProduct = FirebaseFirestore.instance
        .collection('users')
        .doc(_email)
        .collection('address')
        .doc(id);
    docProduct.delete();
  }

  static changeDeliveryAddress({required AddressModel newAddress}) async {
    //deleting old defult address
    var collection = FirebaseFirestore.instance
        .collection('users')
        .doc(_email)
        .collection('currentAddress');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
// Adding  new  address to defult
    final addressDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(_email)
        .collection('currentAddress')
        .doc(newAddress.id);

    final json = newAddress.toJson();

    await addressDoc.set(json);
  }

  static Stream<List<AddressModel>> fetchCurrentAddresses() {
    final _currentEntries = FirebaseFirestore.instance
        .collection('users')
        .doc(_email)
        .collection('currentAddress')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList());
    return _currentEntries;
  }
}
