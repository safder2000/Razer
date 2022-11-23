import 'package:flutter/material.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/address/address_functions.dart';
import 'package:razer/model/address_model.dart';

class AddressCard extends StatelessWidget {
  AddressCard({
    required this.address,
    Key? key,
  }) : super(key: key);
  AddressModel address;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
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
                Text(
                  '${address.name}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                height_10,
                Text(
                  '${address.localArea},\n${address.city} , ${address.state},\npin: ${address.pincode.join().toString()}\n\nphone: ${address.number.join().toString()}',
                  style: TextStyle(height: 1.5, fontSize: 15),
                ),
              ],
            ),
          ),
          Positioned(
            right: 15,
            top: 10,
            child: IconButton(
              onPressed: () {
                addressDeleteAlert(context);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white70,
              ),
            ),
          )
        ],
      ),
    );
  }

  addressDeleteAlert(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Delete"),
      onPressed: () {
        AddressFunctions.removeAddress(id: address.id);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog languageSelect = AlertDialog(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      content: Text(
        'Are you sure want to remove this Address',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return languageSelect;
      },
    );
  }
}
