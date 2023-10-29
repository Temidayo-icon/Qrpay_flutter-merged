import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class GenBarcodeScreen extends StatefulWidget {
  final String myQR;
  const GenBarcodeScreen(this.myQR, {super.key});


  static const String routeName = '/generateBarcode';

  Route route() {
    return MaterialPageRoute(
      builder: (_) =>  GenBarcodeScreen(myQR),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<GenBarcodeScreen> createState() => _GenBarcodeScreenState();
  
}

class _GenBarcodeScreenState extends State<GenBarcodeScreen> {
  TextEditingController dataController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool isQRCodeGenerated = false;
  String qrCodeData = '';

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('Generate QR Code'),
  ),
  body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
  children: <Widget>[
  TextField(
  controller: dataController,
  decoration: InputDecoration(labelText: 'Username'),
  ),
  TextField(
  controller: userIdController,
  decoration: InputDecoration(labelText: 'User ID'),
  ),
  TextField(
  controller: pinController,
  decoration: InputDecoration(labelText: 'PIN'),
  ),
  TextField(
  controller: amountController,
  decoration: InputDecoration(labelText: 'Amount'),
  ),
  ElevatedButton(
  onPressed: () {
  generateQRCode(qrCodeData, 200, 200);
  },
  child: Text(isQRCodeGenerated ? 'Regenerate QR Code' : 'Generate QR Code'),
  ),
  if (isQRCodeGenerated)
  Column(
  children: [
  Text('QR Code Data: $qrCodeData'),
  Image.memory(Uint8List.fromList(generateQRCode(qrCodeData, 200, 200))),
  ],
  ),
  ],
  ),
  ),
  );
  }

  generateQRCode(String qrCodeData, int i, int d) {
  final data = dataController.text;
  final userId = userIdController.text;
  final pin = pinController.text;
  final amount = amountController.text;

  // Check if all fields are filled
  if (data.isEmpty || userId.isEmpty || pin.isEmpty || amount.isEmpty) {
  // Display an error message or toast
  return;
  }

  // Concatenate user data into a single string
  final userData = {
  'username': data,
  'userId': userId,
  'amount': double.parse(amount),
  };

  // Create a JSON object with user information
  final jsonData = json.encode(userData);

  setState(() {
  qrCodeData = jsonData;
  isQRCodeGenerated = true;
  });
  }

  }