import 'package:flutter/material.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  static const String routeName = '/add_card';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const AddCardScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Card'),
      ),
    );
  }
}
