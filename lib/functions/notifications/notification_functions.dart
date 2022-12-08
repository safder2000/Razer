import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razer/model/notification.dart';

final email = FirebaseAuth.instance.currentUser!.email;

Stream<List<NotificationModel>> readNotifications() =>
    FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .collection('notifications')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => NotificationModel.fromJson(doc.data()))
            .toList());
notificationOpened({
  required String id,
}) async {
  final openedNotif = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('notifications')
      .doc(id);
  await openedNotif.update({'isReaded': true});
}

deleteNotification({
  required String id,
}) async {
  final openedNotif = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('notifications')
      .doc(id);
  await openedNotif.delete();
}
