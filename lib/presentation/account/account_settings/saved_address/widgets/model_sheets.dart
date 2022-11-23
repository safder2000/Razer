import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/utils/utils.dart';

import '../../../../../application/address/address_bloc.dart';

final addressFormKey = GlobalKey<FormState>();

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
                    hint: 'Full Name',
                    width: 400,
                  ),
                  height_10,
                  textfield(
                    hint: 'Mobile Number',
                    width: 400,
                  ),
                  height_10,
                  textfield(
                    hint: 'Pincode',
                    width: 400,
                    initialvalue: "${state.placemark[0].postalCode}",
                  ),
                  height_10,
                  Row(
                    children: [
                      width_5,
                      textfield(
                          hint: 'State',
                          width: 195,
                          initialvalue:
                              "${state.placemark[0].administrativeArea}"),
                      width_10,
                      textfield(
                        hint: 'City',
                        width: 195,
                        initialvalue: "${state.placemark[0].locality}",
                      ),
                    ],
                  ),
                  height_10,
                  textfield(
                    hint: 'Road name,Area,colony..',
                    width: 400,
                    height: 60,
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
              textfield(
                hint: 'Full Name',
                width: 400,
              ),
              height_10,
              textfield(
                hint: 'Mobile Number',
                width: 400,
              ),
              height_10,
              textfield(
                hint: 'Pincode',
                width: 400,
              ),
              height_10,
              Row(
                children: [
                  width_5,
                  textfield(
                    hint: 'State',
                    width: 195,
                  ),
                  width_10,
                  textfield(
                    hint: 'City',
                    width: 195,
                  ),
                ],
              ),
              height_10,
              textfield(
                hint: 'Road name,Area,colony..',
                width: 400,
                height: 60,
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

SizedBox textfield(
    {String hint = "none",
    String initialvalue = '',
    double width = double.infinity,
    double? height}) {
  return SizedBox(
    width: width,
    height: height ?? 60,
    child: TextFormField(
      initialValue: initialvalue,
      textAlign: TextAlign.start,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value != null && value.length <= 0
          ? 'this field cant be empty '
          : null,
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
