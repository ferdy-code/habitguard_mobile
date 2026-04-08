import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Shows a local notification when user opens a blocked app during focus session.
/// This is a reminder-only approach (not a hard blocker).
class FocusOverlayService {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static const _channelId = 'focus_reminder';
  static const _channelName = 'Focus Session Reminder';
  static const _notificationId = 9001;

  static Future<void> initialize() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: androidSettings);
    await _notifications.initialize(settings);
  }

  static Future<void> showBlockedAppReminder(String appName) async {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: 'Reminder saat membuka app yang diblokir',
      importance: Importance.high,
      priority: Priority.high,
      fullScreenIntent: true,
      category: AndroidNotificationCategory.reminder,
    );
    const details = NotificationDetails(android: androidDetails);

    await _notifications.show(
      _notificationId,
      'Kamu sedang fokus! 🎯',
      '$appName ada di daftar blokir. Kembali fokus yuk!',
      details,
    );
  }

  static Future<void> dismiss() async {
    await _notifications.cancel(_notificationId);
  }
}
