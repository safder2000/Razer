import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/utils/utils.dart';

import '../../../../../application/address/address_bloc.dart';

final TextEditingController name_ctr = TextEditingController();
final TextEditingController number_ctr = TextEditingController();
final TextEditingController pincode_ctr = TextEditingController();
final TextEditingController state_ctr = TextEditingController();
final TextEditingController city_ctr = TextEditingController();
final TextEditingController localAddress_ctr = TextEditingController();

final addressFormKey = GlobalKey<FormState>();

//address manual adding. model bottom sheet📝
modalBottomSheetMenu(context) {
  showModalBottomSheet(
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              height_10,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'use current location',
                    style: TextStyle(color: Colors.white70),
                  ),
                  IconButton(
                      onPressed: () async {
                        BlocProvider.of<AddressBloc>(context)
                            .add(FindLocation());
                        if (BlocProvider.of<AddressBloc>(context)
                            .state
                            .placemark
                            .isEmpty) {
                          return;
                        } else {
                          Navigator.pop(context);

                          currentLocation(context);
                        }

                        // _currentLocation(context);
                      },
                      icon: const Icon(
                        Icons.gps_fixed,
                        color: Colors.white,
                        size: 30,
                      )),
                  width_10
                ],
              ),
              height_10,
              textfield(hint: 'Full Name', width: 400, controller: name_ctr),
              height_10,
              textfield(
                  hint: 'Mobile Number',
                  width: 400,
                  keybord: TextInputType.number,
                  controller: name_ctr),
              height_10,
              textfield(
                  hint: 'Pincode',
                  width: 400,
                  keybord: TextInputType.number,
                  controller: pincode_ctr),
              height_10,
              Row(
                children: [
                  width_5,
                  textfield(hint: 'State', width: 195, controller: state_ctr),
                  width_10,
                  textfield(hint: 'City', width: 195, controller: city_ctr),
                ],
              ),
              height_10,
              textfield(
                  hint: 'Road name,Area,colony..',
                  width: 400,
                  height: 60,
                  controller: localAddress_ctr),
              height_10,
              ElevatedButton(
                onPressed: () {
                  final _isValid = addressFormKey.currentState!.validate();
                  if (!_isValid) {
                    log('Text  fields are empty');

                    return;
                  } else {
                    Navigator.pop(context);
                    log('Text valid');
                    BlocProvider.of<AddressBloc>(context).add(SaveAddress(
                        name: name_ctr.text.trim().isEmpty
                            ? 'no name given'
                            : name_ctr.text.trim(),
                        number: number_ctr.text.trim().isEmpty
                            ? []
                            : number_ctr.text
                                .trim()
                                .split('')
                                .map(int.parse)
                                .toList(),
                        pincode: pincode_ctr.text.trim().isEmpty
                            ? []
                            : pincode_ctr.text
                                .trim()
                                .split('')
                                .map(int.parse)
                                .toList(),
                        state: state_ctr.text.trim().isEmpty
                            ? 'field was empty'
                            : state_ctr.text.trim(),
                        city: city_ctr.text.trim().isEmpty
                            ? 'field was empty'
                            : city_ctr.text.trim(),
                        localAddress: localAddress_ctr.text.trim().isEmpty
                            ? 'field was empty'
                            : localAddress_ctr.text.trim()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.white24),
                child: const Text(
                  '    ADD   ',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              height_10,
            ],
          ),
        );
      });
}

//current location bottom sheet<<<<<<<<<<<<<<<<<<<<<<<<<<<🗺️
currentLocation(
  context,
) {
  showModalBottomSheet(
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textfield(
                      hint: 'Full Name', width: 400, controller: name_ctr),
                  height_10,
                  textfield(
                      hint: 'Mobile Number',
                      width: 400,
                      keybord: TextInputType.number,
                      controller: number_ctr),
                  height_10,
                  textfield(
                    hint: 'Pincode',
                    keybord: TextInputType.number,
                    controller: pincode_ctr,
                    width: 400,
                    initialvalue: "${state.placemark[0].postalCode}",
                  ),
                  height_10,
                  Row(
                    children: [
                      width_5,
                      textfield(
                        hint: 'State',
                        controller: state_ctr,
                        width: 195,
                        initialvalue:
                            "${state.placemark[0].administrativeArea}",
                      ),
                      width_10,
                      textfield(
                          hint: 'City',
                          width: 195,
                          initialvalue: "${state.placemark[0].locality}",
                          controller: city_ctr),
                    ],
                  ),
                  height_10,
                  textfield(
                    hint: 'Road name,Area,colony..',
                    width: 400,
                    height: 60,
                    controller: localAddress_ctr,
                    initialvalue:
                        "${state.placemark[0].subLocality}, ${state.placemark[0].street}, near ${state.placemark[0].name}",
                  ),
                  height_10,
                  ElevatedButton(
                    onPressed: () {
                      final _isValid = addressFormKey.currentState!.validate();
                      if (!_isValid) {
                        log('Text  fields are empty');
                        return;
                      } else {
                        Navigator.pop(context);
                        log('Text valid');
                      }
                    },
                    child: const Text(
                      '    ADD   ',
                      style: TextStyle(fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.white24),
                  ),
                  height_10,
                ],
              );
            },
          ),
        );
      });
}

// Text Field for everyone 📝

SizedBox textfield(
    {String hint = "none",
    String initialvalue = '',
    required TextEditingController controller,
    TextInputType keybord = TextInputType.text,
    double width = double.infinity,
    double? height}) {
  return SizedBox(
    width: width,
    height: height ?? 60,
    child: TextFormField(
      keyboardType: keybord,
      initialValue: initialvalue,
      textAlign: TextAlign.start,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value != null && value.length <= 0
          ? 'this field cant be empty '
          : null,
      onChanged: ((value) {
        controller.text = value;
      }),
      decoration: InputDecoration(
          // errorText: _validate ? 'wrong password' : null,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: razergreen, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white60, width: 1.0),
          ),
          label: Text(
            hint,
            style: const TextStyle(color: Colors.white70),
          ),
          hintStyle: const TextStyle(color: Colors.white70)),
    ),
  );
}
