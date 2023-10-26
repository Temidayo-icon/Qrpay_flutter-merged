part of 'flutter_p2p_plus.dart';

class P2pSocket {
  final bool isHost;
  final int port;
  final Stream<SocketMessage> _inputStream;
  final Stream<SocketState> _stateStream;


  Stream<SocketMessage> get inputStream => _inputStream;
  Stream<SocketState> get stateStream => _stateStream;

  P2pSocket(this.port, this.isHost, this._inputStream, this._stateStream);

  Future<Future<bool?>> write(Uint8List data) async {
    return FlutterP2pPlus.instance.sendData(port, isHost, data);
  }

  Future<Future<bool?>> writeString(String text) {
    Uint8List bytes = Uint8List(text as int);
    return write(bytes);
  }
}