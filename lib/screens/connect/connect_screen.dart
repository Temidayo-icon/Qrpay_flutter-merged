import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_p2p_plus/flutter_p2p_plus.dart';
import 'package:flutter_p2p_plus/protos/protos.pb.dart';
import 'package:permission_handler/permission_handler.dart';

import '../scan_qr/scanqr.dart';



class Packet {
  String? data;
  int? timestamp;

  Packet({this.data, this.timestamp});

  Packet.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['timestamp'] = timestamp;
    return data;
  }
}



class ConnectScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  const ConnectScreen({super.key});

  static const String routeName = '/connect';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ConnectScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Screen'),
      ),
    );
  }
}
class _MyAppState extends State<ConnectScreen> with WidgetsBindingObserver {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _deviceAddress = "";
  var _isConnected = false;
  var _isHost = false;
  var _isOpen = false;
  var _socketClientConnected = false;
  String _sendText = "";
  String _rcvText = "";

  P2pSocket? _socket;
  WifiP2pDevice? _wifiP2pDevice;
  List<WifiP2pDevice> devices = [];
  final List<StreamSubscription> _subscriptions = [];
  final TextEditingController _textEditingController = TextEditingController();
  final FlutterP2pPlus _flutterP2pPlus = FlutterP2pPlus();
  StreamSubscription? _socketInputStreamSubscription;
  StreamSubscription? _socketStateStreamSubscription;


  @override
  void initState() {
    super.initState();
    _register();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _socketInputStreamSubscription?.cancel();
    _socketStateStreamSubscription?.cancel();
    FlutterP2pPlus.removeGroup();
    for (var element in _subscriptions) {
      element.cancel();
    }
    if (_isConnected) {
      if (_wifiP2pDevice != null) {
        FlutterP2pPlus.cancelConnect(_wifiP2pDevice!);
      }
    }
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _register();
    } else if (state == AppLifecycleState.paused) {
      _unregister();
    }
  }

  void _register() async {
    await Permission.location.request();

    if (!await _checkPermission()) {
      return;
    }
    _subscriptions.add(FlutterP2pPlus.wifiEvents.stateChange!.listen((change) {
      debugPrint("stateChange: ${change.isEnabled}");
    }));

    _subscriptions.add(FlutterP2pPlus.wifiEvents.connectionChange!.listen((change) {
      setState(() {
        _isConnected = change.networkInfo.isConnected;
        _isHost = change.wifiP2pInfo.isGroupOwner;
        _deviceAddress = change.wifiP2pInfo.groupOwnerAddress;
      });
      debugPrint("connectionChange: ${change.wifiP2pInfo.isGroupOwner}, Connected: ${change.networkInfo.isConnected}");
    }));

    _subscriptions.add(FlutterP2pPlus.wifiEvents.thisDeviceChange!.listen((change) {
      debugPrint(
          "deviceChange: ${change.deviceName} / ${change.deviceAddress} / ${change.primaryDeviceType} / ${change.secondaryDeviceType} ${change.isGroupOwner ? 'GO' : '-GO'}");
    }));

    _subscriptions.add(FlutterP2pPlus.wifiEvents.discoveryChange!.listen((change) {
      debugPrint("discoveryStateChange: ${change.isDiscovering}");
    }));

    _subscriptions.add(FlutterP2pPlus.wifiEvents.peersChange!.listen((change) {
      debugPrint("peersChange: ${change.devices.length}");
      for (var device in change.devices) {
        debugPrint("device: ${device.deviceName} / ${device.deviceAddress}");
      }

      setState(() {
        devices = change.devices;
      });
    }));

    FlutterP2pPlus.register();
  }

  void _unregister() {
    _socketInputStreamSubscription?.cancel();
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    FlutterP2pPlus.unregister();
  }

  void _openPortAndAccept(int port) async {
    if (!_isOpen) {
      var socket = await FlutterP2pPlus.openHostPort(port);
      setState(() {
        _socket = socket;
      });

      var buffer = "";
      socket?.inputStream.listen((data) {
        var msg = String.fromCharCodes(data.data);
        buffer += msg;
        if (data.dataAvailable == 0) {
          snackBar("Data Received from ${_isHost ? "Client" : "Host"}: $buffer");
          socket.writeString("Successfully received: $buffer");
          buffer = "";
        }
      });

      debugPrint("_openPort done");
      _isOpen = await FlutterP2pPlus.acceptPort(port) ?? false;
      debugPrint("_accept done: $_isOpen");
    }
  }

  _connectToPort(int port) async {
    var socket = await FlutterP2pPlus.connectToHost(
      _deviceAddress,
      port,
      timeout: 100000,
    );

    setState(() {
      _socketClientConnected = true;
      _socket = socket;
    });
    await _socketInputStreamSubscription?.cancel();
    _socketInputStreamSubscription = null;
    await _socketStateStreamSubscription?.cancel();
    _socketStateStreamSubscription = null;

    _socketInputStreamSubscription ??= _socket?.inputStream.listen((data) {
      var msg = utf8.decode(data.data);
      setState(() {
        _rcvText += "$msg \n";
      });
      // snackBar("Received from ${_isHost ? "Host" : "Client"} $msg");
    });



    /*_socketStateStreamSubscription ??= _socket?.stateStream.listen((event) {
      debugPrint("[Listen] Socket State: $event");
      setState(() {
        _socketClientConnected = false;
      });
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Text("Socket Host Disconnected"),
          ));
    })*/

    debugPrint("_connectToPort done");

    // If the connection is successful, navigate to the ScanBarcodeScreen
    if (_socketClientConnected && _isHost) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScanBarcodeScreen()),
      );
    }
    else {
      // Navigate to the "GenerateBarcodeScreen" when you are the client
      Navigator.pushNamed(context, '/generateBarcode');
    }
    debugPrint("_connectToPort done");
  }
  Future<bool?> _socketDisconnect() async {
    bool result = false;
    if (_isHost) {
      await FlutterP2pPlus.closeHostPort(8000);
    } else {
      await FlutterP2pPlus.disconnectFromHost(8000);
    }
    _socketInputStreamSubscription?.cancel();
    _socketInputStreamSubscription = null;
    setState(() {
      _socketClientConnected = false;
    });
    // if (_wifiP2pDevice != null) {
    //   result = await FlutterP2pPlus.cancelConnect(_wifiP2pDevice!) ?? false;
    // }

    return result;
  }
  Future<bool?> _teardown() async {
    bool? result = await FlutterP2pPlus.removeGroup();
    _unregister();
    _socket = null;
    if ((result ?? false)) _isOpen = false;
    return result;
  }


  Future<bool> _checkPermission() async {
    // if (!await FlutterP2pPlus?.isLocationPermissionGranted()) {
    //   await FlutterP2pPlus.requestLocationPermission();
    //   return false;
    // }
    if (await Permission.location.status.isDenied) {
      return false;
    }
    return true;
  }

  Future<bool?> _disconnect() async {
    bool? result = await FlutterP2pPlus.removeGroup();
    _unregister();
    _socket = null;
    if ((result ?? false)) _isOpen = false;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Plugin example app 2'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Text("Registration"),
              subtitle: Text("P2P Registration"),
              onTap: () async {
                await FlutterP2pPlus.register();
              },
            ),
            ListTile(
              title: const Text("Connection State"),
              subtitle: Text(_isConnected ? "Connected: ${_isHost ? "Host" : "Client"}" : "Disconnected"),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Controller",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text("Discover Devices"),
                      onTap: () async {
                        if (!_isConnected) {
                          await FlutterP2pPlus.discoverDevices();
                        } else {
                          return;
                        }
                      },
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text("Stop Discover Devices"),
                      onTap: () async {
                        FlutterP2pPlus.stopDiscoverDevices();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Open and accept data from port 8000"),
              subtitle: _isConnected ? const Text("Active") : const Text("Disable"),
              onTap: _isConnected && _isHost ? () => _openPortAndAccept(8000) : null,
            ),
            const Divider(),
            ListTile(
              title: const Text("Connect to port 8000"),
              subtitle: const Text("This is able to only Client"),
              onTap: _isConnected && !_isHost ? () => _connectToPort(8000) : null,
            ),
            const Divider(),
            ListTile(
              title: const Text("Send hello world"),
              onTap: _isConnected ? () async => await _socket?.writeString("Hello World") : null,
            ),
            const Divider(),
            ListTile(
              title: const Text("Disconnect"),
              onTap: _isConnected ? () async => await _disconnect() : null,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Device List",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Expanded(
              child: ListView(
                children: devices.map((d) {
                  return ListTile(
                    title: Text(d.deviceName),
                    subtitle: Text(d.deviceAddress),
                    onTap: () async {
                      debugPrint("${_isConnected ? "Disconnect" : "Connect"} to device: $_deviceAddress");
                      if (_isConnected) {
                        await FlutterP2pPlus.cancelConnect(d);
                      } else {
                        var result = (await FlutterP2pPlus.connect(d) ?? false);
                        print("[connect] reault: $result");
                        if (result) {
                          _isConnected = true;
                        }
                        setState(() {});
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  snackBar(String text) {
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
