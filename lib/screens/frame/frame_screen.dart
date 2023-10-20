import 'package:flutter/material.dart';

class FrameScreen extends StatelessWidget {
  const FrameScreen({super.key});

  static const String routeName = '/frame';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FrameScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frame'),
      ),
    );
  }
}
