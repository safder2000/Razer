import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/buying/buying_bloc.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/model/order_product_model.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/shop/order_summery/widgets/items.dart';
import 'package:razer/presentation/shop/order_summery/widgets/price_details.dart';
import 'package:razer/presentation/shop/payment/screen_payment.dart';
import 'package:razer/presentation/shop/screen_buy_item.dart';

import 'widgets/deliver_to.dart';

class ScreenOederSummery extends StatelessWidget {
  ScreenOederSummery({super.key, required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;

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
            product: OrderedProduct(
                id: product.id,
                name: product.name,
                description: product.description,
                spec: product.spec,
                price: product.price,
                quantity: product.quantity,
                colors: product.colors,
                rating: product.rating,
                images: product.images,
                orderQuantity: 1,
                user: email!,
                isCanceled: false,
                isDeliverd: false,
                time: 'time'),
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
                child: BlocBuilder<BuyingBloc, BuyingState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        state.buyingItem = OrderedProduct(
                            id: product.id,
                            name: product.name,
                            description: product.description,
                            spec: product.spec,
                            price: product.price,
                            quantity: product.quantity,
                            colors: product.colors,
                            rating: product.rating,
                            images: product.images,
                            orderQuantity: state.buyingItem.orderQuantity,
                            user: email,
                            isCanceled: false,
                            isDeliverd: false,
                            time: state.buyingItem.time);
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                ScreenBuyItem(product: product),
                            // ScreenPayment(
                            //   product: product,
                            // ),
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
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
