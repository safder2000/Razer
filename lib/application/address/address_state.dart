part of 'address_bloc.dart';

@immutable
class AddressState {
  AddressState({
    required this.placemark,
    required this.addresses,
    required this.isCurrentAddress,
  });
  List<Placemark> placemark;
  List<AddressModel> addresses;
  bool isCurrentAddress;
}

class InitialState extends AddressState {
  InitialState()
      : super(
          placemark: [],
          addresses: [],
          isCurrentAddress: false,

          // Street: '',
          // state: '',
          // Sublocality: '',
          // locality: '',
          // road: '',
        );
}
