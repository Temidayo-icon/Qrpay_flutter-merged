import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrpay/config/app_router.dart';
import 'package:qrpay/config/theme.dart';
import 'package:qrpay/screens/login/login_screen.dart';
import 'package:qrpay/screens/screens.dart';
import 'package:qrpay/screens/splash/splash_screen.dart';
import 'package:qrpay/screens/add_card/add_card_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AddCardScreen.routeName,
    );
  }
}




