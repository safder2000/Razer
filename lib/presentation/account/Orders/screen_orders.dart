import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/order_functions/order_functions.dart';
import 'package:razer/model/order_product_model.dart';
import 'package:razer/presentation/account/Orders/widgets/ordered_item_widgets.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

class ScreenOrders extends StatelessWidget {
  const ScreenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          AppLocalizations.of(context)!.orders,
          style: TextStyle(color: justgreen),
        ),
      ),
      body: ListView(
        children: [
          height_20,
          StreamBuilder<List<OrderedProduct>>(
            stream: OrderFunctions.readOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'somthing went wrong ${snapshot.error}',
                  style: TextStyle(color: Colors.white),
                ));
              } else if (snapshot.hasData) {
                final products = snapshot.data;
                if (products == null || products.isEmpty) {
                  return Center(
                      child: Container(
                          decoration: BoxDecoration(
                    // borderRadius:BorderRadius(Radius.circular(20)) ,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://shop.millenniumbooksource.com/static/images/cart1.png')),
                  )));
                } else if (products.isNotEmpty) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext, index) => OrderedItems(
                      orderedProduct: products[index],
                    ),
                    itemCount: products.length,
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
          ),
        ],
      ),
    );
  }
}
