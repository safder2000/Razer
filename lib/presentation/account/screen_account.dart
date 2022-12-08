import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';

import 'package:razer/core/constents.dart';
import 'package:razer/functions/user_profile_functions.dart';
import 'package:razer/model/user_profile_model.dart';
import 'package:razer/presentation/account/Orders/screen_orders.dart';
import 'package:razer/presentation/account/account_settings/edit_profille/screen_edit_profle.dart';
import 'package:razer/presentation/account/account_settings/notification_settings/screen_notifications.dart';
import 'package:razer/presentation/account/account_settings/save_card_n_wallet/cardsNwallet.dart';
import 'package:razer/presentation/account/account_settings/saved_address/screen_saved_address.dart';
import 'package:razer/presentation/account/widgets/account_boxes_widget.dart';
import 'package:razer/presentation/account/widgets/account_settings_widgets.dart';
import 'package:razer/presentation/account/wishlist/screen_wishlist.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    log('${email}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My Account',
          style: TextStyle(
              color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                confirmLogout(context);
              },
              icon: Icon(Icons.logout_outlined)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            color: razergreen,
            height: 1,
          ),
          height_10,
          height_10,
          StreamBuilder<List<UserProfile>>(
              stream: readProfile(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Column(
                    children: [
                      const Text(
                        'somthing went wrong ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${snapshot.error}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ));
                } else if (snapshot.hasData) {
                  final user = snapshot.data;
                  if (user != null && user.isNotEmpty) {
                    return Row(
                      children: [
                        width_10,
                        CircleAvatar(
                          radius: 51,
                          backgroundColor: Colors.white60,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              "${user[0].profilePic}",
                            ),
                          ),
                        ),
                        width_10,
                        width_10,
                        Text(
                          user[0].name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  } else {
                    return noDataFound();
                  }
                } else {
                  return noDataFound();
                }
              }),
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
                      builder: (BuildContext context) => const ScreenOrders(),
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
                    builder: (BuildContext context) => const ScreenWishlist(),
                  ),
                ),
                child: AccountBoxesWidget(
                  ico: Icons.favorite_border,
                  title: 'Wishlist',
                ),
              ),
              // AccountBoxesWidget(
              //   ico: Icons.card_giftcard,
              //   title: 'Coupons',
              // ),
              // AccountBoxesWidget(
              //   ico: Icons.headphones_outlined,
              //   title: 'Help Center',
              // ),
            ],
          ),
          height_10,
          const Divider(
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
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute<void>(
                //         builder: (BuildContext context) => const CardsNWallet(),
                //       ),
                //     );
                //   },
                //   child: AccountSettingsWidgets(
                //     ico: Icons.account_balance_wallet_outlined,
                //     title: 'Saved Cards & Wallet',
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ScreenSavedAddress(),
                      ),
                    );
                  },
                  child: AccountSettingsWidgets(
                    ico: Icons.location_on_outlined,
                    title: 'Saved  Adresses',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectLanguage(context);
                  },
                  child: AccountSettingsWidgets(
                    ico: Icons.language_outlined,
                    title: AppLocalizations.of(context)!.language,
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute<void>(
                //         builder: (BuildContext context) =>
                //             const NotificationSettings(),
                //       ),
                //     );
                //   },
                //   child: AccountSettingsWidgets(
                //     ico: Icons.notifications_active_outlined,
                //     title: 'Notification Settings',
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row noDataFound() {
    return Row(
      children: [
        width_10,
        CircleAvatar(
          radius: 51,
          backgroundColor: Colors.white60,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://w1.pngwing.com/pngs/743/500/png-transparent-circle-silhouette-logo-user-user-profile-green-facial-expression-nose-cartoon.png",
            ),
          ),
        ),
        width_10,
        width_10,
        Text(
          'User name',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  selectLanguage(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Save"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog languageSelect = AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          languageTile(lang: 'English', isSelected: true),
          height_10,
          languageTile(lang: 'Malayalam'),
          height_10,
          GestureDetector(
              // onTap: () => ScreenAccount.of(context).setLocale(Locale.fromSubtags(languageCode: 'hi')),
              child: languageTile(lang: 'Hindi')),
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
        return languageSelect;
      },
    );
  }

  Row languageTile({required String lang, bool isSelected = false}) {
    return Row(
      children: [
        Icon(
          isSelected ? Icons.circle : Icons.circle_outlined,
          size: 18,
          color: Colors.white,
        ),
        width_10,
        Text(
          lang,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }

  confirmLogout(BuildContext context) {
    // set up the buttons

    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(
            color: razergreen, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Logout",
        style: TextStyle(
            color: razergreen, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pop(context);
        FirebaseAuth.instance.signOut();
      },
    );

    // set up the AlertDialog
    AlertDialog logoutConfirm = AlertDialog(
      elevation: 100,
      backgroundColor: Colors.black,
      title: Text(
        "Are you sure want to logout ?",
        style: TextStyle(color: Colors.white),
      ),
      // content: Text("Are you sure want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return logoutConfirm;
      },
    );
  }
}
