import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/address/address_functions.dart';
import 'package:razer/model/address_model.dart';
import 'package:razer/presentation/shop/order_summery/widgets/change_address.dart';

class DeliverTo extends StatelessWidget {
  const DeliverTo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: white10,
      child: StreamBuilder<List<AddressModel>>(
          stream: AddressFunctions.fetchCurrentAddresses(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final currAddr = snapshot.data;
              if (currAddr != null && currAddr.isNotEmpty) {
                return Column(
                  children: [
                    height_10,
                    Row(
                      children: [
                        width_10,
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            '  ${currAddr[0].name}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            changeAddresses(context);
                          },
                          child: Container(
                            height: 23,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: Text(
                              '  change  ',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                        width_10,
                      ],
                    ),
                    Text(
                        '\n${currAddr[0].localArea},\n${currAddr[0].city},\n${currAddr[0].pincode.join()}\n\n${currAddr[0].number.join()}')
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
