import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanBarcodeScreen extends StatefulWidget {
  const ScanBarcodeScreen({Key? key}) : super(key: key);

  static const String routeName = '/scan';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ScanBarcodeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  _ScanBarcodeScreenState createState() => _ScanBarcodeScreenState();
}

class _ScanBarcodeScreenState extends State<ScanBarcodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Barcode'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Text(
              'Scanned Data: ${result != null ? result!.code : "N/A"}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        // You can access the scanned data using result.code
        // For example, if the data is in JSON format, you can decode it:
        // Map<String, dynamic> decodedData = json.decode(result.code);
        // String username = decodedData['username'];
        // String userId = decodedData['userId'];
        // Do something with username and userId
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
