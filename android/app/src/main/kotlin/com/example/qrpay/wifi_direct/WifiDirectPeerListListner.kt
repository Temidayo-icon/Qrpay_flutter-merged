package com.example.qrpay.wifi_direct

import android.net.wifi.p2p.WifiP2pDevice
import android.net.wifi.p2p.WifiP2pDeviceList
import android.net.wifi.p2p.WifiP2pManager
import android.util.Log
import com.example.qrpay.utility.ProtoHelper
import io.flutter.plugin.common.EventChannel

class WiFiDirectPeerListListener(private val peersChangedSink: EventChannel.EventSink?
) : WifiP2pManager.PeerListListener {
    companion object {
        const val TAG = "Flutter P2P"
    }

    private val peers = mutableListOf<WifiP2pDevice>()

    override fun onPeersAvailable(peerList: WifiP2pDeviceList) {
        val refreshedPeers = peerList.deviceList
        if ( refreshedPeers != peers) {
            peers.clear()

            if (refreshedPeers != null) {
                peers.addAll(refreshedPeers)
            }

            peersChangedSink?.success(ProtoHelper.create(peers).toByteArray())
        }

        if (peers.isEmpty()) {
            Log.d(TAG, "No devices found")
            return
        }
    }

}