import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/notifications/notification_functions.dart';
import 'package:razer/model/notification.dart';
import 'package:razer/presentation/notifications/widgets/notification_tile_widget.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';

class ScreenNotifications extends StatelessWidget {
  const ScreenNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: justgreen, fontWeight: FontWeight.bold),
        ),
        backgroundColor: justBlack,
      ),
      body: StreamBuilder<List<NotificationModel>>(
        stream: readNotifications(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'somthing went wrong ${snapshot.error}',
              style: TextStyle(color: Colors.white),
            ));
          } else if (snapshot.hasData) {
            final _notification = snapshot.data;
            if (_notification == null || _notification.isEmpty) {
              return Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    // borderRadius:BorderRadius(Radius.circular(20)) ,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://assets8.lottiefiles.com/packages/lf20_3EMIt2.json')),
                  ),
                  child: Column(
                    children: [
                      Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_3EMIt2.json'),
                      height_20,
                      Text('This is the only animated free gif i got .. \n'),
                    ],
                  ),
                ),
              );
            } else if (_notification.isNotEmpty) {
              return ListView.separated(
                itemBuilder: (BuildContext, index) => GestureDetector(
                  onTap: () {
                    readNotification(
                      context,
                      _notification[index].title,
                      _notification[index].subtitle,
                      _notification[index].id,
                    );
                  },
                  child: NotificationTileWidget(
                    isOpened: !_notification[index].isReaded,
                    title: _notification[index].title,
                    sub: _notification[index].subtitle,
                    time: _notification[index].id,
                  ),
                ),
                itemCount: _notification.length,
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
    );
  }

  readNotification(
    BuildContext context,
    String title,
    String discription,
    String id,
  ) {
    // set up the buttons

    Widget deleteButton = TextButton(
      child: const Text(
        "Delete",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        deleteNotification(id: id);
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "OK",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        notificationOpened(id: id);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Color.fromARGB(255, 62, 62, 62),
      content: Text(
        discription,
        style: TextStyle(color: Color.fromARGB(255, 227, 227, 227)),
      ),
      actions: [
        deleteButton,
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
}
