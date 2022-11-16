import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
  }) : super(key: key);

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
                      image: const DecorationImage(
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
              GestureDetector(
                onTap: () {
                  itemCount(context);
                },
                child: Container(
                  height: 30,
                  width: 73,
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: razergreen),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(children: [
                    const Text('  Qty: 1'),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: razergreen,
                    )
                  ]),
                ),
              ),
              const Spacer(),
              const Text(
                'Devilvery by Sun Nov 6',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              width_10,
              width_10,
            ],
          ),
          const Spacer(),
          Row(
            children: [
              CustomButton(
                text: 'Save for later',
              ),
              CustomButton(
                text: 'Remove',
              ),
              CustomButton(
                text: 'Buy this now',
              ),
            ],
          ),
        ],
      ),
    );
  }

  itemCount(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text(
        "Cancel",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "Save",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          height_20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              countTile(lang: '1', isSelected: true),
              width_20,
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white70),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  height_5,
                  height_5,
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white70),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          height_10,
        ],
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Row countTile({required String lang, bool isSelected = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        width_10,
        Container(
          height: 70,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white70),
          ),
          child: Center(
            child: Text(
              lang,
              style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
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
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
