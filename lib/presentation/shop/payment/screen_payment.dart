import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/order_functions/order_functions.dart';
import 'package:razer/model/order_product_model.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/shop/payment/track_order.dart';
import 'package:razer/presentation/shop/screen_shop.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../application/buying/buying_bloc.dart';
import '../../../notifications/notification_api.dart';

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
                          Razorpay razorpay = Razorpay();
                          var options = {
                            'key': 'rzp_test_DYS7TJEsb2indp',
                            'amount': 100,
                            'name': 'Acme Corp.',
                            'description': 'Fine T-Shirt',
                            'retry': {'enabled': true, 'max_count': 1},
                            'send_sms_hash': true,
                            'prefill': {
                              'contact': '8888888888',
                              'email': 'test@razorpay.com'
                            },
                            'external': {
                              'wallets': ['paytm']
                            }
                          };
                          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                              handlePaymentErrorResponse);
                          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                              handlePaymentSuccessResponse);
                          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                              handleExternalWalletSelected);
                          razorpay.open(options);

                          // orderPlacedAlert(context);
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

  static orderPlacedAlert(BuildContext context) {
    // set up the button
    Widget toShop = TextButton(
      child: Text("Shop again"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return TrackOrder();
            },
          ),
        );
      },
    );
    Widget toTrack = TextButton(
      child: Text("Track Order"),
      onPressed: () {
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return ScreenShop(
                catogory: 'all',
              );
            },
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromARGB(255, 46, 46, 46),
      content: const Text(
        "Your Order has been placed.",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      actions: [
        toShop,
        toTrack,
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

  void handlePaymentSuccessResponse(PaymentSuccessResponse response, context) {
    orderPlacedAlert(context);
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response, context) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response, context) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
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
