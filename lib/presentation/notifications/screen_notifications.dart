import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/notifications/widgets/notification_tile_widget.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';

class ScreenNotifications extends StatelessWidget {
  const ScreenNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            title: 'Notifications',
            isSearch: true,
            count: 1,
          ),
          height_10,
          NotificationTileWidget(
            isOpened: true,
            title: 'Your order has been placed',
            sub: 'your order for razer viper mini wireless has been placed',
          ),
          const Divider(
            color: Colors.black,
            height: 2,
          ),
          NotificationTileWidget(
            isOpened: false,
            title: 'Your order has been placed',
            sub: 'your order for razer viper mini wireless has been placed',
          ),
        ],
      ),
    );
  }
}
