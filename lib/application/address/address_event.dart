part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}

//find location in map and covert it in to address 🗺️📌
class FindLocation extends AddressEvent {}

//save address to db ⬆️
class SaveAddress extends AddressEvent {
  SaveAddress({
    required this.name,
    required this.number,
    required this.pincode,
    required this.state,
    required this.city,
    required this.localAddress,
  });
  String name;
  List<int> number;
  List<int> pincode;
  String state;
  String city;
  String localAddress;
}
