part of 'flutter_p2p_plus.dart';

class WiFiDirectBroadcastReceiver {
  static const _channelBase = FlutterP2pPlus.channelBase;

  static const EventChannel _stateChangeChannel = EventChannel("$_channelBase/bc/state-change");

  static const EventChannel _peersChangeChannel = EventChannel("$_channelBase/bc/peers-change");

  static const EventChannel _connectionChangeChannel = EventChannel("$_channelBase/bc/connection-change");

  static const EventChannel _thisDeviceChangeChannel = EventChannel("$_channelBase/bc/this-device-change");

  static const EventChannel _discoveryChangeChannel = EventChannel("$_channelBase/bc/discovery-change");

  static late Stream<StateChange> _stateChangeStream;
  static late Stream<WifiP2pDeviceList> _peersChangeStream;
  static late Stream<ConnectionChange> _connectionChangeStream;
  static late Stream<WifiP2pDevice> _thisDeviceChangeStream;
  static late Stream<DiscoveryStateChange> _discoveryChangeStream;

  Stream<StateChange> get stateChange {
    _stateChangeStream ??= _stateChangeChannel
          .receiveBroadcastStream()
          .map<StateChange>((src) => StateChange.fromBuffer(src));

    return _stateChangeStream;
  }

  Stream<WifiP2pDeviceList> get peersChange {
    _peersChangeStream ??= _peersChangeChannel
          .receiveBroadcastStream()
          .map<WifiP2pDeviceList>((src) => WifiP2pDeviceList.fromBuffer(src));

    return _peersChangeStream;
  }

  Stream<ConnectionChange> get connectionChange {
    _connectionChangeStream ??= _connectionChangeChannel
          .receiveBroadcastStream()
          .map<ConnectionChange>((src) => ConnectionChange.fromBuffer(src));

    return _connectionChangeStream;
  }

  Stream<WifiP2pDevice> get thisDeviceChange {
    _thisDeviceChangeStream ??= _thisDeviceChangeChannel
          .receiveBroadcastStream()
          .map<WifiP2pDevice>((src) => WifiP2pDevice.fromBuffer(src));

    return _thisDeviceChangeStream;
  }

  Stream<DiscoveryStateChange> get discoveryChange {
    _discoveryChangeStream ??= _discoveryChangeChannel
          .receiveBroadcastStream()
          .map<DiscoveryStateChange>(
              (src) => DiscoveryStateChange.fromBuffer(src));

    return _discoveryChangeStream;
  }
}