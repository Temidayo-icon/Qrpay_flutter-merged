import 'package:flutter/material.dart';

class IdTransferScreen extends StatelessWidget {
  const IdTransferScreen({super.key});

  static const String routeName = '/id_transfer';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const IdTransferScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Id Transfer'),
      ),
    );
  }
}
