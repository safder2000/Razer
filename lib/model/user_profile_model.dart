import 'dart:convert';

class UserProfile {
  final String email;
  final String name;
  final List<int> number;
  final String profilePic;
  UserProfile({
    required this.email,
    required this.name,
    required this.number,
    required this.profilePic,
  });
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'number': number,
        'profilePic': profilePic,
      };

  static UserProfile fromJson(Map<String, dynamic> json) => UserProfile(
        name: json['name'],
        email: json['email'],
        number: json['number'],
        profilePic: json['profilePic'],
      );
}
