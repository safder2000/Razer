import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/order_functions/order_functions.dart';
import 'package:razer/model/order_product_model.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/shop/payment/track_order.dart';

import '../../../application/buying/buying_bloc.dart';

class ScreenPayment extends StatelessWidget {
  ScreenPayment({super.key, required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
              color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Divider(
            color: razergreen,
          ),
          height_10,
          height_10,
          height_10,
          Row(
            children: [
              width_10,
              width_5,
              Text(
                'Saved Options',
                style: titleStyle_17,
              ),
            ],
          ),
          height_20,
          paymentMethods('XXX XXX XXX 2345'),
          height_10,
          paymentMethods('Makima2000@ybl'),
          height_20,
          Divider(
            color: Colors.white54,
          ),
          height_20,
          Row(
            children: [
              width_10,
              width_5,
              Text(
                'All other options',
                style: titleStyle_17,
              ),
            ],
          ),
          height_20,
          paymentMethods('UPI'),
          height_10,
          paymentMethods('Wallet / Postpaid'),
          height_10,
          paymentMethods('Credit / Debit / ATM Card'),
          height_10,
          paymentMethods('Cash on Delivery'),
          Spacer(),
          Row(
            children: [
              const Expanded(
                child: SizedBox(
                  child: Center(
                    child: Text(
                      '199.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ScreenPayment(
                          product: product,
                        ),
                      ),
                    );
                  },
                  child: BlocBuilder<BuyingBloc, BuyingState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          OrderFunctions.addToOrder(
                            product: product,
                            quantinty: int.parse(
                                state.buyingItem.orderQuantity.toString()),
                          );
                          // BlocProvider.of<BuyingBloc>(context)
                          //     .add(AddToOrders());
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return TrackOrder();
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: theAmber,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              ' Pay ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Row paymentMethods(String text) {
    return Row(
      children: [
        Icon(
          Icons.check_box_outline_blank_sharp,
          color: Colors.white,
        ),
        width_10,
        Text(
          text,
          style: titleStyle_16,
        )
      ],
    );
  }
}
