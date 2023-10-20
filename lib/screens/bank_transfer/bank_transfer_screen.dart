import 'package:flutter/material.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({super.key});

  static const String routeName = '/bank_transfer';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const BankTransferScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Transfer'),
      ),
    );
  }
}
