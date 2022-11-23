import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/address/address_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/address/address_functions.dart';
import 'package:razer/model/address_model.dart';
import 'package:razer/presentation/account/account_settings/save_card_n_wallet/cardsNwallet.dart';
import 'package:razer/presentation/account/account_settings/saved_address/widgets/address_card.dart';
import 'package:razer/presentation/account/account_settings/saved_address/widgets/model_sheets.dart';

class ScreenSavedAddress extends StatelessWidget {
  const ScreenSavedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    _fetchAllAddresses(context);
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
        child: ListView(
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
            StreamBuilder<List<AddressModel>>(
              stream: AddressFunctions.fetchAllAddressesStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    'somthing went wrong ${snapshot.error}',
                    style: TextStyle(color: Colors.white),
                  ));
                } else if (snapshot.hasData) {
                  final addresses = snapshot.data;
                  if (addresses == null || addresses.isEmpty) {
                    return Center(
                        child: Container(
                            decoration: BoxDecoration(
                      // borderRadius:BorderRadius(Radius.circular(20)) ,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdni.iconscout.com/illustration/premium/thumb/no-address-found-4344458-3613886.png')),
                    )));
                  } else if (addresses.isNotEmpty) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AddressCard(
                          address: addresses[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return height_10;
                      },
                    );
                  } else {
                    return const Center(child: Text('unknown error'));
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
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

  _fetchAllAddresses(context) async {
    final _addresses = await AddressFunctions.fetchAllAddresses();
    BlocProvider.of<AddressBloc>(context)
        .add(FetchAllAddress(addressList: _addresses));
  }
}
