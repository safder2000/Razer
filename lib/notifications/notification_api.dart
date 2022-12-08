import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static Future _notificationDetails() async {
    return
        // AndroidNotificationDetails androidNotificationDetails =
        // const AndroidNotificationDetails('your channel id', 'your channel name',
        //     channelDescription: 'your channel description',
        //     importance: Importance.max,
        //     priority: Priority.high,
        //     ticker: 'ticker');

        // const NotificationDetails notificationDetails =
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description',
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'ticker'));
  }

  static Future init({bool initSheduled = false}) async {
    final android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android);
    await _notifications.initialize(
      settings,
    );
  }

  // static Future<void> showNotification() async {
  //   const AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails('your channel id', 'your channel name',
  //           channelDescription: 'your channel description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           ticker: 'ticker');
  //   const NotificationDetails notificationDetails =
  //       NotificationDetails(android: androidNotificationDetails);
  //   await _flutterLocalNotificationsPlugin.show(
  //       0, 'plain title', 'plain body', notificationDetails,
  //       payload: 'item x');
  // }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );
}
