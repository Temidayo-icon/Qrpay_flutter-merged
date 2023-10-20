part of 'flutter_p2p.dart';

class SocketMaster {
  static const _channelBase = FlutterP2p.channelBase;

  final _socketReadChannel = const EventChannel("$_channelBase/socket/read");

  Map<int, P2pSocket> sockets = {};

 late Stream<SocketMessage> _readStream;

  SocketMaster() {
    _readStream = _socketReadChannel.receiveBroadcastStream().map((a) {
      try {
        return SocketMessage.fromBuffer(a);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
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