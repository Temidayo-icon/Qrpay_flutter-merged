part of 'flutter_p2p_plus.dart';

class P2pSocket {
  final bool isHost;
  final int port;
  final Stream<SocketState> _stateStream;
  final Stream<SocketMessage> _inputStream;


  Stream<SocketState>   get stateStream => _stateStream;
  Stream<SocketMessage> get inputStream => _inputStream;


  P2pSocket(this.port, this.isHost, this._inputStream, this._stateStream);

  Future<Future<bool?>> write(Uint8List data) async {
    return FlutterP2pPlus.instance.sendData(port, isHost, data);
  }

  Future<Future<bool?>> writeString(String text) {
    return write(utf8.encode(text) as Uint8List);
  }
}