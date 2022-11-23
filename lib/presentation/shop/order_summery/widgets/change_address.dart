import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/functions/address/address_functions.dart';
import 'package:razer/model/address_model.dart';
import 'package:razer/presentation/shop/order_summery/widgets/address_select_card.dart';

import '../../../../application/address/address_bloc.dart';
import '../../../../core/constents.dart';

changeAddresses(
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
              return StreamBuilder<List<AddressModel>>(
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
                          return AddressSelectCard(
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
              );
            },
          ),
        );
      });
}
