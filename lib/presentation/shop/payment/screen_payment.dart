import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class ScreenPayment extends StatelessWidget {
  const ScreenPayment({super.key});

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
                        builder: (BuildContext context) => ScreenPayment(),
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
