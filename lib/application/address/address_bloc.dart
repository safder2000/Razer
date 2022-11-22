import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../functions/locator_functions/geo_locator_current_pos.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(InitialState()) {
    on<AddressEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FindLocation>((event, emit) async {
      Position position = await determinePosition();
      GetAddress(position);
    });
  }
}
