import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:razer/functions/address/address_functions.dart';
import 'package:razer/model/address_model.dart';

import '../../functions/locator_functions/geo_locator_current_pos.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(InitialState()) {
    on<AddressEvent>((event, emit) {});

    on<FindLocation>((event, emit) async {
      // 🎯 target acquired
      Position position = await determinePosition();
      // i know where you live 📌🗺️
      final _address = await GetAddress(position);
      emit(AddressState(
          placemark: _address,
          addresses: state.addresses,
          isCurrentAddress: state.isCurrentAddress));
      // emit(
      //   AddressState(
      //     state: "${address.state}",
      //     locality: "${address.locality}",
      //     Sublocality: "${address.Sublocality}",
      //     Street: "${address.Street}",
      //     road: "${address.road}",
      //   ),
      // );
    });
    //saving 📌🗺️  to db ⬆️
    on<SaveAddress>((event, emit) {
      AddressFunctions.saveAddress(
          name: event.name,
          number: event.number,
          pincode: event.pincode,
          state: event.state,
          city: event.city,
          localArea: event.localAddress);
      emit(state);
    });
    on<FetchAllAddress>((event, emit) async {
      // final _addresses = await AddressFunctions.fetchAllAddresses();
      final newState = AddressState(
          placemark: state.placemark,
          addresses: event.addressList,
          isCurrentAddress: state.isCurrentAddress);
      emit(newState);
    });
    on<ChangeDeliveryAddress>((event, emit) async {
      // AddressFunctions.changeDeliveryAddress(
      //   newAddress: event.address,
      // );
      emit(state);
    });
  }
}
