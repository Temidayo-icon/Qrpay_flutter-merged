import 'package:flutter/material.dart';


class GenBarcodeScreen extends StatefulWidget {
  const GenBarcodeScreen({Key? key});

  static const String routeName = '/generateBarcode';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const GenBarcodeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<GenBarcodeScreen> createState() => _GenBarcodeScreenState();
  
}

class _GenBarcodeScreenState extends State<GenBarcodeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  
}