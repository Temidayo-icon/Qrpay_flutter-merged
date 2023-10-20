import 'package:flutter/material.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  static const String routeName = '/add_money';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const AddMoneyScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Money'),
      ),
    );
  }
}
