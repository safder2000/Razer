import 'package:flutter/material.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/account/account_settings/save_card_n_wallet/widgets/card_widget.dart';
import 'package:razer/presentation/account/account_settings/save_card_n_wallet/widgets/upi_card_widget.dart';

class CardsNWallet extends StatelessWidget {
  const CardsNWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'My Cards & Wallet',
          style: TextStyle(color: justgreen),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            color: razergreen,
          ),
          height_20,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              width_10,
              const Text(
                'Saved Cards',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          height_20,
          CardWidget(),
          height_10,
          AddButtonWidget(
            name: 'CARD',
          ),
          height_20,
          const Divider(
            color: Colors.white60,
          ),
          height_20,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              width_10,
              const Text(
                'Saved UPIs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          height_10,
          const UpiCard(),
          height_10,
          AddButtonWidget(
            name: 'UPI',
          ),
        ],
      ),
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  AddButtonWidget({
    required this.name,
    Key? key,
  }) : super(key: key);
  String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        width_10,
        const Icon(
          Icons.add,
          color: Colors.white,
        ),
        Text(
          ' ADD NEW $name ',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
