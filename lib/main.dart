import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/EditProfile/edit_profile_bloc.dart';
import 'package:razer/application/Order/order_bloc.dart';
import 'package:razer/application/address/address_bloc.dart';
import 'package:razer/application/auth/auth_bloc.dart';

import 'package:razer/application/buying/buying_bloc.dart';
import 'package:razer/application/cart/cart_bloc.dart';
import 'package:razer/application/shop/shop_bloc.dart';
import 'package:razer/presentation/auth/auth_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<ShopBloc>(
          create: (BuildContext context) => ShopBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
        BlocProvider<EditProfileBloc>(
          create: (BuildContext context) => EditProfileBloc(),
        ),
        BlocProvider<AddressBloc>(
          create: (BuildContext context) => AddressBloc(),
        ),
        BlocProvider<OrderBloc>(
          create: (BuildContext context) => OrderBloc(),
        ),
        BlocProvider<BuyingBloc>(
          create: (BuildContext context) => BuyingBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'razer',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          backgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: ScreenLogin(),
      ),
    );
  }
}
