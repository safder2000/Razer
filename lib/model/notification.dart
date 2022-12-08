import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.isReaded,
    required this.id,
  });
  String id;
  String title;
  String subtitle;
  String description;
  bool isReaded;

  static NotificationModel fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'],
        title: json['title'],
        subtitle: json['subtitle'],
        description: json['description'],
        isReaded: json['isReaded'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'description': description,
        'isReaded': isReaded,
      };
}
