package com.example.qrpay.wifi_direct.transfer

import com.example.qrpay.StreamHandler
import java.net.InetSocketAddress
import java.net.Socket

class Client(private val address: String,
             val port: Int,
             inputStreamHandler: StreamHandler,
             private val timeout: Int
) : SocketTask(inputStreamHandler) {

    private lateinit var socketHandler: SocketHandler

    init {
        socket = Socket()
        socket.bind(null)
    }

    override fun doInBackground(vararg params: Void?): Boolean {
        try {
            val socketAddress = InetSocketAddress(address, port)
            socket.connect(socketAddress, timeout)
            socketHandler = SocketHandler(socket, false)
            socketHandler.handleInput { data -> publishProgress(data) }
        } catch (e: Exception) {
            e.printStackTrace()
            return false
        }
        return true
    }

}