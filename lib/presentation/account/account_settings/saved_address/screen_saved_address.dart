import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:razer/application/address/address_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/locator_functions/geo_locator_current_pos.dart';
import 'package:razer/presentation/account/account_settings/save_card_n_wallet/cardsNwallet.dart';

class ScreenSavedAddress extends StatelessWidget {
  const ScreenSavedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: justBlack,
        title: const Text(
          'My Addresses',
          style: TextStyle(color: justgreen),
        ),
      ),
      body: Column(
        children: [
          greenDiv,
          height_20,
          GestureDetector(
              onTap: () {
                _modalBottomSheetMenu(context);
              },
              child: AddButtonWidget(name: 'ADDRESS')),
          height_20,
          height_20,
          Row(
            children: [
              width_20,
              const Text(
                'Saved Addresses',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          height_10,
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.92,
            color: Colors.white12,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height_10,
                      const Text(
                        'Makima',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      height_10,
                      const Text(
                          'Flat no H6-902 Arun excello, temple green,\nSripepambur , vallaikotte,\n608768\n\n8976564322')
                    ],
                  ),
                ),
                const Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(
                    Icons.edit_location_alt_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  addAddress(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.black,
      content: const Text('gg'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
        validator: (value) => value != null && value.length <= 6
            ? 'password must be atleast 6 char long'
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

  _modalBottomSheetMenu(context) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                height_10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'use current location',
                      style: TextStyle(color: Colors.white70),
                    ),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<AddressBloc>(context)
                              .add(FindLocation());
                          _currentLocation(context);

                          // Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.gps_fixed,
                          color: Colors.white,
                          size: 30,
                        )),
                    width_10
                  ],
                ),
                height_10,
                textfield(hint: 'Full Name', width: 400),
                height_10,
                textfield(hint: 'Mobile Number', width: 400),
                height_10,
                textfield(hint: 'Pincode', width: 400),
                height_10,
                Row(
                  children: [
                    width_5,
                    textfield(hint: 'State', width: 195),
                    width_10,
                    textfield(hint: 'City', width: 195),
                  ],
                ),
                height_10,
                textfield(
                    hint: 'Road name,Area,colony..', width: 400, height: 60),
                height_10,
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
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
            ),
          );
        });
  }

  _currentLocation(
    context,
  ) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    textfield(hint: 'Full Name', width: 400),
                    height_10,
                    textfield(hint: 'Mobile Number', width: 400),
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
                      onPressed: () {},
                      child: Text(
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
}
