import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/model/order_product_model.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/shop/order_summery/widgets/item_count.dart';

import '../../../../application/buying/buying_bloc.dart';

class Item extends StatelessWidget {
  Item({
    Key? key,
    required this.product,
  }) : super(key: key);
  OrderedProduct product;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      height: 180,
      child: Column(
        children: [
          Row(
            children: [
              width_5,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              '${product.images.isEmpty ? 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png' : product.images[0]}')),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              width_5,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height_10,
                  SizedBox(
                    width: 290,
                    child: Text(
                      '${product.name}',
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Text(
                    '\$ ${product.price}',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  try {
                    itemCount(context);
                  } on Exception catch (_) {
                    return;
                  }
                  ;
                },
                child: Container(
                  height: 30,
                  width: 75,
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: razergreen),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(children: [
                    BlocBuilder<BuyingBloc, BuyingState>(
                      builder: (context, state) {
                        return Text(' Qty: ${state.buyingItem.orderQuantity}');
                      },
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: razergreen,
                    )
                  ]),
                ),
              ),
              Spacer(),
              Text(
                'Devilvery by Sun Nov 6',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              width_10,
              width_10,
            ],
          ),
        ],
      ),
    );
  }
}
