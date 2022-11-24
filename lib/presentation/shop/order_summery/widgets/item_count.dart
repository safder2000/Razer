import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/buying/buying_bloc.dart';
import '../../../../core/constents.dart';

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
            BlocBuilder<BuyingBloc, BuyingState>(
              builder: (context, state) {
                return countTile(
                    lang: '${state.buyingItem.orderQuantity}',
                    isSelected: true);
              },
            ),
            width_20,
            Column(
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<BuyingBloc>(context).add(Increment());
                  },
                  child: Container(
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
                ),
                height_5,
                height_5,
                InkWell(
                  onTap: () {
                    BlocProvider.of<BuyingBloc>(context).add(Decrement());
                  },
                  child: Container(
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
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}
