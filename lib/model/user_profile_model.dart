import 'dart:convert';

class UserProfile {
  final String name;

  final String profilePic;
  UserProfile({
    required this.name,
    required this.profilePic,
  });
  Map<String, dynamic> toJson() => {
        'name': name,
        'profilePic': profilePic,
      };

  static UserProfile fromJson(Map<String, dynamic> json) => UserProfile(
        name: json['name'],
        profilePic: json['profilePic'],
      );
}
