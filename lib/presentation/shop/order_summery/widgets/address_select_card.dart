import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/address/address_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/address/address_functions.dart';
import 'package:razer/model/address_model.dart';

class AddressSelectCard extends StatelessWidget {
  AddressSelectCard({
    required this.address,
    Key? key,
  }) : super(key: key);
  AddressModel address;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // BlocProvider.of<AddressBloc>(context)
        //     .add(ChangeDeliveryAddress(address: address));
        AddressFunctions.changeDeliveryAddress(newAddress: address);
        Navigator.pop(context);
      },
      child: Container(
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
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  height_10,
                  Text(
                    '${address.localArea},\n${address.city} , ${address.state},\npin: ${address.pincode.join().toString()}\n\nphone: ${address.number.join().toString()}',
                    style: const TextStyle(height: 1.5, fontSize: 15),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 15,
              top: 10,
              child: StreamBuilder<List<AddressModel>>(
                  stream: AddressFunctions.fetchCurrentAddresses(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final currAddr = snapshot.data;
                      if (currAddr != null &&
                          currAddr.isNotEmpty &&
                          currAddr[0].id == address.id) {
                        return Icon(
                          Icons.check_box,
                          color: justgreen,
                        );
                      } else {
                        return Icon(
                          Icons.check_box_outline_blank,
                        );
                      }
                    } else {
                      return Icon(
                        Icons.check_box_outline_blank,
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
