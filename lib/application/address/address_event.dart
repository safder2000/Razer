part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}

//find location in map and covert it in to address 🗺️📌
class FindLocation extends AddressEvent {}

//save address to db ⬆️
class SaveAddress extends AddressEvent {}
