package com.example.qrpay.wifi_direct.transfer

import android.os.AsyncTask
import java.io.OutputStream

class WriteDataToStreamTask(private val stream: OutputStream,
                            private val bytes: ByteArray
) : AsyncTask<Void, Void, Boolean>() {

    override fun doInBackground(vararg params: Void?): Boolean {
        stream.write(bytes)
        stream.flush()
        return true
    }

}