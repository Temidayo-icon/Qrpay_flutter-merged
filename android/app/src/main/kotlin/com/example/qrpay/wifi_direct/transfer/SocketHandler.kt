package com.example.qrpay.wifi_direct.transfer

import com.example.qrpay.FlutterP2pPlugin
import com.example.qrpay.utility.ProtoHelper
import java.io.InputStream
import java.net.Socket

class SocketHandler(private val socket: Socket,
                    private val isHost: Boolean
) {
    private val inputStream: InputStream = socket.getInputStream()

    fun handleInput(cb: (data: ByteArray) -> Unit) {
        val buf = ByteArray(FlutterP2pPlugin.config.bufferSize)

        var readCount = 0

        val port = if (isHost) socket.localPort else (socket.port)
        while ({ readCount = inputStream.read(buf);readCount }() != -1) {
            val result = ProtoHelper.create(port, buf.take(readCount).toByteArray(), inputStream.available())
            cb(result.toByteArray())
        }
    }
}