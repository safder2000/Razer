part of 'address_bloc.dart';

@immutable
class AddressState {
  AddressState({required this.placemark
      // required this.state,
      // required this.locality,
      // required this.Sublocality,
      // required this.Street,
      // required this.road,
      });
  List<Placemark> placemark;
  // String state;
  // String locality;
  // String Sublocality;
  // String Street;
  // String road;
}

class InitialState extends AddressState {
  InitialState()
      : super(placemark: []
            // Street: '',
            // state: '',
            // Sublocality: '',
            // locality: '',
            // road: '',
            );
}
