package com.example.minprom_of_omsk_signal

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.telephony.CellInfoLte
import android.telephony.CellSignalStrength
import android.telephony.TelephonyManager
import android.telephony.gsm.GsmCellLocation
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

@Suppress("DEPRECATION")
class MainActivity: FlutterActivity() {
    @RequiresApi(Build.VERSION_CODES.P)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "get_cell_data")
        channel.setMethodCallHandler { call, result ->
            when (call.method){
                "getOne" -> {
                    result.success(1);
                }
                "getGsmCellSignalStrength" -> {
                    val telephonyManager = context.getSystemService(TELEPHONY_SERVICE) as TelephonyManager
                    result.success(telephonyManager.signalStrength?.gsmSignalStrength);
                }
                "getSignalStrengthLevel" -> {
                    val telephonyManager = context.getSystemService(TELEPHONY_SERVICE) as TelephonyManager
                    result.success(telephonyManager.signalStrength?.level);
                }
                "getSignalStrengthLevel2" -> {
                    val telephonyManager = context.getSystemService(TELEPHONY_SERVICE) as TelephonyManager
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
//                        if (telephonyManager.signalStrength?.cellSignalStrengths?.get(0).dbm)
                        result.success(telephonyManager.signalStrength?.cellSignalStrengths?.get(0)?.dbm)
                    };
                    result.success(-1)
                }

                "getCDMACellSignalStrength" -> {
                    val telephonyManager = context.getSystemService(TELEPHONY_SERVICE) as TelephonyManager
                    result.success(telephonyManager.signalStrength?.cdmaDbm);
                }
                "getEVDOCellSignalStrength" -> {
                    val telephonyManager = context.getSystemService(TELEPHONY_SERVICE) as TelephonyManager
                    result.success(telephonyManager.signalStrength?.evdoDbm);
                }
                "getLTESignalStrength" -> {
                    val telephonyManager = context.getSystemService(TELEPHONY_SERVICE) as TelephonyManager
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                        if (telephonyManager.allCellInfo.size > 0) result.success(telephonyManager.allCellInfo[0].cellSignalStrength.dbm)
                        else result.success(-2)
                    }
                    result.success(-1)
                }
                "getGSMCellTowerId" -> {
                    val telephonyManager = context.getSystemService(TELEPHONY_SERVICE) as TelephonyManager
                    if (
                        ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED
                    ) {
                        if (telephonyManager.cellLocation != null) {
                            val loc: GsmCellLocation = telephonyManager.cellLocation as GsmCellLocation
                            result.success(loc.cid)
                        }
                        else result.success(-2)
                    }
                    else result.success(-1)
                    
                }
            }
        }
    }
}