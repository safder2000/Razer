import 'dart:convert';

class AddressModel {
  final String name;
  final String id;
  final List number;
  final List pincode;
  final String state;
  final String city;
  final String localArea;

  AddressModel({
    required this.name,
    required this.id,
    required this.number,
    required this.pincode,
    required this.state,
    required this.city,
    required this.localArea,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'number': number,
        'pincode': pincode,
        'state': state,
        'city': city,
        'localArea': localArea,
      };

  static AddressModel fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        name: json['name'],
        number: (json['number']),
        pincode: json['pincode'],
        state: json['state'],
        city: json['city'],
        localArea: json['localArea'],
      );
}
