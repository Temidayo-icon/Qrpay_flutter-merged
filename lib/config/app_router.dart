import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrpay/screens/connect/connect_screen.dart';
import 'package:qrpay/screens/loading/load1_screen.dart';
import 'package:qrpay/screens/loading/load2_screen.dart';
import 'package:qrpay/screens/loading/load3_screen.dart';
import 'package:qrpay/screens/loading/load4_screen.dart';
import 'package:qrpay/screens/home/home_screen.dart';
import 'package:qrpay/screens/login/login_screen.dart';
import 'package:qrpay/screens/scan_qr/scanqr.dart';
import 'package:qrpay/screens/signup/signup_screen.dart';
import 'package:qrpay/screens/splash/splash_screen.dart';
import 'package:qrpay/screens/add_card/add_card_screen.dart';
import 'package:qrpay/screens/add_money/add_money_screen.dart';
import 'package:qrpay/screens/bank_transfer/bank_transfer_screen.dart';
import 'package:qrpay/screens/id_transfer/id_transfer_screen.dart';
import 'package:qrpay/screens/profile/profile_screen.dart';
import 'package:qrpay/screens/frame/frame_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch(settings.name){
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case Load1Screen.routeName:
        return Load1Screen.route();
      case Load2Screen.routeName:
        return Load2Screen.route();
      case Load3Screen.routeName:
        return Load3Screen.route();
      case Load4Screen.routeName:
        return Load4Screen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case AddCardScreen.routeName:
        return AddCardScreen.route();
      case AddMoneyScreen.routeName:
        return AddMoneyScreen.route();
      case BankTransferScreen.routeName:
        return BankTransferScreen.route();
      case IdTransferScreen.routeName:
        return IdTransferScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case FrameScreen.routeName:
        return FrameScreen.route();
      case ConnectScreen.routeName:
        return ConnectScreen.route();
      case ScanBarcodeScreen.routeName:
        return ScanBarcodeScreen.route();


        break;
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('error'),),),
      settings: RouteSettings(name: '/error'),
    );
  }

}