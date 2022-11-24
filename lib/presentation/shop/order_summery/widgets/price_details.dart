import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/model/product_model.dart';

class PriceDetails extends StatelessWidget {
  PriceDetails({Key? key, required this.product}) : super(key: key);
  Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: white10,
      child: Column(
        children: [
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Price Details : ',
                style: titleStyle_16,
              ),
            ],
          ),
          height_10,
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Price (1 item)',
                style: titleStyle_15,
              ),
              Spacer(),
              Text(
                '\$ ${product.price}',
                style: titleStyle_15,
              ),
              width_10
            ],
          ),
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Discount',
                style: titleStyle_15,
              ),
              Spacer(),
              Text(
                '-\$ 0.00',
                style: TextStyle(fontSize: 15, color: razergreen),
              ),
              width_10
            ],
          ),
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Delivery Charges',
                style: titleStyle_15,
              ),
              Spacer(),
              Text(
                'Free Delivery',
                style: TextStyle(fontSize: 15, color: razergreen),
              ),
              width_10
            ],
          ),
          height_10,
          Divider(
            color: Colors.white38,
          ),
          height_10,
          Row(
            children: [
              width_10,
              Text(
                'Total Amount',
                style: titleStyle_17,
              ),
              Spacer(),
              Text(
                '\$ ${product.price}',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              width_10
            ],
          ),
        ],
      ),
    );
  }
}
