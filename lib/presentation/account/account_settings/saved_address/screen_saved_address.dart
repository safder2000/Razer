import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:razer/application/address/address_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/locator_functions/geo_locator_current_pos.dart';
import 'package:razer/presentation/account/account_settings/save_card_n_wallet/cardsNwallet.dart';
import 'package:razer/presentation/account/account_settings/saved_address/widgets/model_sheets.dart';

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
      body: Form(
        key: addressFormKey,
        child: Column(
          children: [
            greenDiv,
            height_20,
            GestureDetector(
                onTap: () {
                  modalBottomSheetMenu(context);
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
      ),
    );
  }

  addAddressAlert(BuildContext context) {
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
}
