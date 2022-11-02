import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/presentation/account/Orders/widgets/ordered_item_widgets.dart';

class ScreenOrders extends StatelessWidget {
  const ScreenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Orders (1)',
          style: TextStyle(color: justgreen),
        ),
      ),
      body: Column(children: [
        Divider(
          color: razergreen,
        ),
        OrderedItems(),
        const Divider(
          height: 8,
        ),
        OrderedItems(
          isCanceled: true,
        ),
      ]),
    );
  }
}
