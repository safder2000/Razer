import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class OrderedItems extends StatelessWidget {
  OrderedItems({
    this.isCanceled = false,
    Key? key,
  }) : super(key: key);
  bool isCanceled;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
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
                          image: AssetImage('lib/assets/catogory_console.png')),
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
                  const SizedBox(
                    width: 290,
                    child: Text(
                      'Charging Stand for Xbox Razer Limited Edition...',
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  const Text(
                    '\$ 199',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 70,
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: razergreen),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(children: [
                  Text(' Qty: 1'),
                  Icon(
                    Icons.arrow_drop_down,
                    color: razergreen,
                  )
                ]),
              ),
              Spacer(),
              isCanceled
                  ? Text(
                      'Order Canceled ',
                      style: TextStyle(color: theAmber, fontSize: 13),
                    )
                  : Text(
                      'Devilvery by Sun Nov 6',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
              width_10,
              width_10,
            ],
          ),
          Spacer(),
          Row(
            children: [
              CustomButton(
                text: 'Remove',
              ),
              CustomButton(
                text: 'Buy this again',
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
    Key? key,
  }) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(border: Border.all(color: Colors.white38)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
