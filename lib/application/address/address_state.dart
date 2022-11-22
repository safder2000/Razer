part of 'address_bloc.dart';

@immutable
abstract class AddressState {
  AddressState({required this.placemark});
  List<Placemark> placemark;
}

class InitialState extends AddressState {
  InitialState() : super(placemark: []);
}
