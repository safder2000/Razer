import 'package:flutter/material.dart';

import 'package:razer/core/constents.dart';
import 'package:razer/presentation/account/Orders/screen_orders.dart';
import 'package:razer/presentation/account/account_settings/edit_profille/screen_edit_profle.dart';
import 'package:razer/presentation/account/account_settings/save_card_n_wallet/cardsNwallet.dart';
import 'package:razer/presentation/account/widgets/account_boxes_widget.dart';
import 'package:razer/presentation/account/widgets/account_settings_widgets.dart';
import 'package:razer/presentation/account/wishlist/screen_wishlist.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarWidget(title: 'My Account'),
          height_10,
          height_10,
          Row(
            children: [
              width_10,
              const CircleAvatar(
                radius: 51,
                backgroundColor: Colors.white60,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://staticg.sportskeeda.com/editor/2022/10/77c8d-16660870279554-1920.jpg',
                  ),
                ),
              ),
              width_10,
              width_10,
              const Text(
                'Makima',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          height_10,
          height_10,
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 10 / 3,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ScreenOrders(),
                    ),
                  );
                },
                child: AccountBoxesWidget(
                  ico: Icons.view_list_outlined,
                  title: 'Orders',
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ScreenWishlist(),
                  ),
                ),
                child: AccountBoxesWidget(
                  ico: Icons.favorite_border,
                  title: 'Wishlist',
                ),
              ),
              AccountBoxesWidget(
                ico: Icons.card_giftcard,
                title: 'Coupons',
              ),
              AccountBoxesWidget(
                ico: Icons.headphones_outlined,
                title: 'Help Center',
              ),
            ],
          ),
          height_10,
          Divider(
            color: Colors.white10,
            thickness: 8,
          ),
          height_10,
          height_10,
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Account Settings',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                height_10,
                height_10,
                height_10,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => EditProfile(),
                      ),
                    );
                  },
                  child: AccountSettingsWidgets(
                    ico: Icons.person_outline,
                    title: 'Edit Profile',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => CardsNWallet(),
                      ),
                    );
                  },
                  child: AccountSettingsWidgets(
                    ico: Icons.account_balance_wallet_outlined,
                    title: 'Saved Cards & Wallet',
                  ),
                ),
                AccountSettingsWidgets(
                  ico: Icons.location_on_outlined,
                  title: 'Saved Adresses',
                ),
                AccountSettingsWidgets(
                  ico: Icons.language_outlined,
                  title: 'Select Language',
                ),
                AccountSettingsWidgets(
                  ico: Icons.notifications_active_outlined,
                  title: 'Notification Settings',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
