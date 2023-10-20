package com.example.qrpay.wifi_direct.transfer

import android.os.AsyncTask
import com.example.qrpay.StreamHandler
import java.net.Socket

abstract class SocketTask(private val inputStreamHandler: StreamHandler) : AsyncTask<Void, ByteArray, Boolean>() {

    lateinit var socket: Socket

    override fun onProgressUpdate(vararg values: ByteArray?) {
        inputStreamHandler.sink?.success(values[0])
    }

    fun writeToOutput(bytes: ByteArray): Boolean {
        try {
            val task = WriteDataToStreamTask(socket.getOutputStream(), bytes)
            task.executeOnExecutor(THREAD_POOL_EXECUTOR)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return true
    }
}