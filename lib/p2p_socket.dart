part of 'flutter_p2p.dart';

class P2pSocket {
  final bool isHost;
  final int port;
  final Stream<SocketMessage> _inputStream;

  Stream<SocketMessage> get inputStream => _inputStream;

  P2pSocket(this.port, this.isHost, this._inputStream);

  Future<bool> write(Uint8List data) async {
    return FlutterP2p.sendData(port, isHost, data);
  }

  Future<bool> writeString(String text) {
    Uint8List bytes = Uint8List(text as int);
    return write(bytes);
  }
}