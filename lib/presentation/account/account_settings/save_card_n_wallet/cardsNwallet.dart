import 'package:flutter/material.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

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
          actions: []),
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
          const Card(),
          height_10,
          AddButtonWidget(
            name: 'CARD',
          ),
          height_20,
          Divider(
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
          UpiCard(),
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
        Icon(
          Icons.add,
          color: Colors.white,
        ),
        Text(
          ' ADD NEW $name ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class UpiCard extends StatelessWidget {
  const UpiCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 80,
          color: Colors.white24,
          child: Stack(
            children: [
              Row(),
              Positioned(
                left: 24,
                top: 30,
                child: Container(
                  color: Colors.white,
                  child: const Text(
                    'Makima2000@ylb                              ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: const Center(child: Text('Remove This ID')),
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 150,
          color: Colors.white24,
          child: Stack(
            children: [
              Row(),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 20,
                  width: 50,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.freepnglogos.com/uploads/visa-card-logo-9.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 45,
                child: Container(
                  color: Colors.white,
                  child: const Text(
                    'X X X X    X X X X    X X X X X    4 2 6 7 ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 90,
                child: Container(
                  color: Colors.white,
                  child: const Text(
                    '12 / 25',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: const Center(child: Text('Remove This Card')),
        ),
      ],
    );
  }
}
