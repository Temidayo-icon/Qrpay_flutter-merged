package com.example.qrpay.wifi_direct.transfer

import com.example.qrpay.StreamHandler
import java.net.ServerSocket

class Host(val serverSocket: ServerSocket,
           inputStreamHandler: StreamHandler
) : SocketTask(inputStreamHandler) {

    private lateinit var handler: SocketHandler

    override fun doInBackground(vararg params: Void?): Boolean {

        try {
            socket = serverSocket.accept()
            handler = SocketHandler(socket, true)
            handler.handleInput { data -> publishProgress(data) }
        } catch (e: Exception) {
            e.printStackTrace()
            return false
        }

        return true
    }

}