package com.habitguard.habitguard_mobile

import android.app.AppOpsManager
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Process
import android.provider.Settings
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ScreenTimePlugin(private val context: Context) : MethodChannel.MethodCallHandler {

    companion object {
        private const val CHANNEL = "com.habitguard/screen_time"

        fun registerWith(flutterEngine: FlutterEngine, context: Context) {
            val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            channel.setMethodCallHandler(ScreenTimePlugin(context))
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "hasPermission" -> result.success(hasUsagePermission())
            "requestPermission" -> {
                val intent = Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS)
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
                result.success(null)
            }
            "getUsageStats" -> {
                val startTime = call.argument<Long>("startTime")
                val endTime = call.argument<Long>("endTime")
                if (startTime == null || endTime == null) {
                    result.error("INVALID_ARGS", "startTime and endTime required", null)
                    return
                }
                if (!hasUsagePermission()) {
                    result.error("NO_PERMISSION", "PACKAGE_USAGE_STATS not granted", null)
                    return
                }
                val stats = queryUsageStats(startTime, endTime)
                result.success(stats)
            }
            else -> result.notImplemented()
        }
    }

    private fun hasUsagePermission(): Boolean {
        val appOps = context.getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val mode = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            appOps.unsafeCheckOpNoThrow(
                AppOpsManager.OPSTR_GET_USAGE_STATS,
                Process.myUid(),
                context.packageName
            )
        } else {
            @Suppress("DEPRECATION")
            appOps.checkOpNoThrow(
                AppOpsManager.OPSTR_GET_USAGE_STATS,
                Process.myUid(),
                context.packageName
            )
        }
        return mode == AppOpsManager.MODE_ALLOWED
    }

    private fun queryUsageStats(startTime: Long, endTime: Long): List<Map<String, Any?>> {
        val usm = context.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val stats = usm.queryUsageStats(UsageStatsManager.INTERVAL_DAILY, startTime, endTime)

        val pm = context.packageManager
        val results = mutableListOf<Map<String, Any?>>()

        for (s in stats) {
            if (s.totalTimeInForeground <= 0) continue

            val appName = try {
                val appInfo = pm.getApplicationInfo(s.packageName, 0)
                pm.getApplicationLabel(appInfo).toString()
            } catch (e: PackageManager.NameNotFoundException) {
                s.packageName.substringAfterLast(".")
            }

            val usageMinutes = s.totalTimeInForeground / 60000

            results.add(
                mapOf(
                    "packageName" to s.packageName,
                    "appName" to appName,
                    "usageMinutes" to usageMinutes,
                    "date" to s.firstTimeStamp
                )
            )
        }

        // Sort descending by usage
        results.sortByDescending { (it["usageMinutes"] as Long) }
        return results
    }
}
