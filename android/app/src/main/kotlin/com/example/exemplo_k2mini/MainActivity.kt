package com.example.exemplo_k2mini

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import android.os.RemoteException
import io.flutter.Log
import statuslampmanager.IStateLamp


class MainActivity: FlutterActivity() {
    private val CHANNEL = "sunmi_lamp_service"

    private var service = SunmiLampService()

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "controlLamp") {
                val lamp = call.argument<String>("lamp")
                val status = call.argument<Int>("status")
                service.controlLamp(status!!, lamp!!)
            }
            if (call.method == "controlLampForLoop") {
                val lamp = call.argument<String>("lamp")
                val status = call.argument<Int>("status")
                service.controlLampForLoop(status!!, lamp!!)
            }
            if (call.method == "closeAllLamp") {
                service.closeAllLamp()
            }
        }
        service.connectService(this)
    }
}

class SunmiLampService {
    private val con: ServiceConnection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            mService = IStateLamp.Stub.asInterface(service)
            val unused = mService
            Log.d("k2mini", "Service Connected.")
        }

        override fun onServiceDisconnected(name: ComponentName) {
            Log.d("k2mini", "Service Disconnected.")
            mService = null
            val unused = mService
        }
    }

    var mService: IStateLamp? = null

    fun connectService(ctx: Context) {
        val intent = Intent()
        intent.setPackage("com.sunmi.statuslampmanager")
        intent.action = "com.sunmi.statuslamp.service"
        ctx.startService(intent)
        ctx.bindService(intent, con, 1)
        Log.d("k2mini", "connectService")

    }

    fun dispose(ctx: Context) {
        mService?.closeAllLamp()
        ctx.unbindService(con)
    }

    @Throws(RemoteException::class)
    fun controlLampForLoop(status: Int, lamp: String?) =
            mService!!.controlLampForLoop(status, 1000, 500, lamp)


    @Throws(RemoteException::class)
    fun controlLamp(status: Int, lamp: String?) =
            mService!!.controlLamp(status, lamp)


    fun closeAllLamp() =
            mService!!.closeAllLamp()
}