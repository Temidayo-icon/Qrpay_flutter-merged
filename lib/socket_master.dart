part of 'flutter_p2p_plus.dart';

class SocketMaster {
  static const _channelBase = FlutterP2pPlus.channelBase;

  final _socketReadChannel = const EventChannel("$_channelBase/socket/read");
  final _socketStateChannel = const EventChannel("$_channelBase/socket/state");

  Map<int, P2pSocket> sockets = {};

 late Stream<SocketMessage> _readStream;

  late Stream<SocketState> _stateStream;

  SocketMaster() {
    _readStream = _socketReadChannel.receiveBroadcastStream().map((a) {
      try {
        debugPrint("[Info][SocketMaster] ${SocketMessage.fromBuffer(a)}");
        return SocketMessage.fromBuffer(a);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        rethrow;
      }
    });
    _stateStream = _socketStateChannel.receiveBroadcastStream().map((a) {
      try {
        debugPrint("[Info][SocketState] ${SocketState.fromBuffer(a)}");
        return SocketState.fromBuffer(a);
      } catch (e) {
        debugPrint(e.toString());
        rethrow;
      }
    });
  }



  P2pSocket? registerSocket(int port, bool isHost) {
    if (sockets[port] == null) {
      sockets[port] = P2pSocket(
        port,
        isHost,
        _readStream.where((s) {
          return s.port == port;
        }),
        _stateStream,
      );
    }

    return sockets[port];
  }

  unregisterServerPort(int port) {
    if (sockets[port] == null) {
      throw Exception("The port $port is not registered.");
    }

    sockets.remove(port);
  }

}

