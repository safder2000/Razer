import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razer/application/EditProfile/edit_profile_bloc.dart';
import 'package:razer/model/user_profile_model.dart';

Future saveProfile({
  required String name,
  required String profilePic,
}) async {
  final oldEmail = FirebaseAuth.instance.currentUser!.email;
  final docProduct = FirebaseFirestore.instance
      .collection('users')
      .doc(oldEmail)
      .collection('userProfile')
      .doc('profile');
  final UserProfile profile = UserProfile(name: name, profilePic: profilePic);

  final json = profile.toJson();
  log('befre adding');

  await docProduct.set(json);

  log('added');
}

Stream<List<UserProfile>> readProfile() {
  final email = FirebaseAuth.instance.currentUser!.email;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('userProfile')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map(
            (doc) => UserProfile.fromJson(
              doc.data(),
            ),
          )
          .toList());
}
