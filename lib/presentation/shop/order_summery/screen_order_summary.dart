import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/shop/order_summery/widgets/items.dart';
import 'package:razer/presentation/shop/order_summery/widgets/price_details.dart';
import 'package:razer/presentation/shop/payment/screen_payment.dart';
import 'widgets/deliver_to.dart';

class ScreenOederSummery extends StatelessWidget {
  ScreenOederSummery({super.key, required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Order Summary',
            style: TextStyle(
                color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: []),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: razergreen, height: 0),
          height_10,
          height_10,
          const Text(
            '     Deliver to :',
            style: TextStyle(fontSize: 17),
          ),
          const DeliverTo(),
          height_10,
          Item(
            product: product,
          ),
          height_10,
          PriceDetails(
            product: product,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Center(
                    child: Text(
                      '${product.price}',
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
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: theAmber,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        'Continue',
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
}
