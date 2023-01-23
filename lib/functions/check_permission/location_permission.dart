import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

requestPermission(context) async {
  var status = await Permission.location.request();
  // Map<Permission, PermissionStatus> statuses = await [
  //   Permission.location,
  // ].request();
  if (status.isRestricted) {
    showAlertDialog(context);
    requestPermission(context);
  } else if (status.isPermanentlyDenied) {
    showAlertDialog(context);
    requestPermission(context);
  } else if (status.isDenied) {
    showAlertDialog(context);
    requestPermission(context);
  } else {
    showAlertDialog(context);
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Permission Alert"),
    content: Text(
        "Some of the features provided by the app(autofill address ) requires location permission."),
    actions: [
      okButton,
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
