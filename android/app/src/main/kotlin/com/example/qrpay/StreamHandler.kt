package com.example.qrpay

import io.flutter.plugin.common.EventChannel

class StreamHandler : EventChannel.StreamHandler {

    companion object {
        internal fun createForChannel(channel: EventChannel): StreamHandler {
            val handler = StreamHandler()
            handler.channel = channel
            channel.setStreamHandler(handler)
            return handler
        }
    }

    var channel: EventChannel? = null
    var sink: EventChannel.EventSink? = null

    override fun onListen(o: Any?, eventSink: EventChannel.EventSink?) {
        sink = eventSink
    }

    override fun onCancel(o: Any?) {
        sink = null
    }
}