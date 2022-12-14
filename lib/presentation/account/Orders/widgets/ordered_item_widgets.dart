import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/Order/order_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/model/order_product_model.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/shop/order_summery/screen_order_summary.dart';

class OrderedItems extends StatelessWidget {
  OrderedItems({
    required this.orderedProduct,
    Key? key,
  }) : super(key: key);
  OrderedProduct orderedProduct;

  @override
  Widget build(BuildContext context) {
    bool isCanceled = orderedProduct.isCanceled;
    bool isDeliverd = orderedProduct.isDeliverd;

    return Container(
      color: isDeliverd || isCanceled ? Colors.white24 : Colors.white12,
      height: 220,
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
                          image: NetworkImage('${orderedProduct.images[0]}')),
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
                      '${orderedProduct.name}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  height_5,
                  SizedBox(
                    width: 290,
                    child: Text(
                      '${orderedProduct.description}',
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  height_10,
                  isCanceled || isDeliverd
                      ? Text(
                          '\$ ${orderedProduct.price}',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54),
                        )
                      : Text(
                          '\$ ${orderedProduct.price}',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 75,
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: razergreen),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(children: [
                  Text(' Qty:   ${orderedProduct.orderQuantity}'),
                ]),
              ),
              Spacer(),
              isCanceled
                  ? Text(
                      'Order Canceled ',
                      style: TextStyle(color: theAmber, fontSize: 13),
                    )
                  : isDeliverd
                      ? Text(
                          'Order Devilverd',
                          style: TextStyle(color: justgreen, fontSize: 13),
                        )
                      : Text(
                          '',
                          style: TextStyle(color: justgreen, fontSize: 13),
                        ),
              width_10,
              width_10,
            ],
          ),
          Spacer(),
          Row(
            children: [
              isCanceled || isDeliverd
                  ? CustomButton(text: 'Cancel', color: Colors.white54)
                  : Expanded(
                      child: InkWell(
                        onTap: () {
                          BlocProvider.of<OrderBloc>(context).add(
                            CancelOrder(
                                time: orderedProduct.time,
                                productID: orderedProduct.id),
                          );
                        },
                        child: CustomButton(
                          text: 'Cancel',
                        ),
                      ),
                    ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ScreenOederSummery(
                          product: Product(
                              id: orderedProduct.id,
                              name: orderedProduct.name,
                              description: orderedProduct.description,
                              spec: orderedProduct.spec,
                              price: orderedProduct.price,
                              quantity: orderedProduct.quantity,
                              colors: orderedProduct.colors,
                              rating: orderedProduct.rating,
                              images: orderedProduct.images),
                        ),
                      ),
                    );
                  },
                  child: CustomButton(
                    text: 'Buy this again',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.text,
    this.color = Colors.white,
    Key? key,
  }) : super(key: key);
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(border: Border.all(color: Colors.white38)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: color),
          ),
        ),
      ),
    );
  }
}
