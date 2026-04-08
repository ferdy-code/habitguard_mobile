import 'package:flutter/services.dart';

class AppUsageInfo {
  final String packageName;
  final String appName;
  final int usageMinutes;
  final String category;
  final DateTime date;

  const AppUsageInfo({
    required this.packageName,
    required this.appName,
    required this.usageMinutes,
    required this.category,
    required this.date,
  });

  @override
  String toString() =>
      'AppUsageInfo($appName: ${usageMinutes}m, $category)';
}

class ScreenTimeService {
  static const _channel = MethodChannel('com.habitguard/screen_time');

  Future<bool> hasPermission() async {
    final result = await _channel.invokeMethod<bool>('hasPermission');
    return result ?? false;
  }

  Future<void> requestPermission() async {
    await _channel.invokeMethod<void>('requestPermission');
  }

  Future<List<AppUsageInfo>> getUsageStats(DateTime start, DateTime end) async {
    final result = await _channel.invokeMethod<List<dynamic>>(
      'getUsageStats',
      {
        'startTime': start.millisecondsSinceEpoch,
        'endTime': end.millisecondsSinceEpoch,
      },
    );

    if (result == null) return [];

    return result.map((item) {
      final map = Map<String, dynamic>.from(item as Map);
      final pkg = map['packageName'] as String;
      return AppUsageInfo(
        packageName: pkg,
        appName: map['appName'] as String? ?? pkg.split('.').last,
        usageMinutes: (map['usageMinutes'] as num).toInt(),
        category: mapCategory(pkg),
        date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      );
    }).toList();
  }

  static String mapCategory(String packageName) {
    final pkg = packageName.toLowerCase();

    const categories = <String, List<String>>{
      'Sosial Media': [
        'instagram', 'facebook', 'twitter', 'tiktok', 'snapchat',
        'linkedin', 'pinterest', 'tumblr', 'reddit', 'threads',
        'com.zhiliaoapp.musically', 'com.ss.android.ugc',
      ],
      'Pesan': [
        'whatsapp', 'telegram', 'signal', 'messenger', 'viber',
        'line', 'wechat', 'discord', 'slack', 'kakaotalk',
      ],
      'Video': [
        'youtube', 'netflix', 'primevideo', 'disneyplus', 'hbomax',
        'viu', 'vidio', 'wetv', 'iqiyi', 'twitch', 'bilibili',
      ],
      'Musik': [
        'spotify', 'music', 'joox', 'resso', 'deezer',
        'soundcloud', 'tidal', 'pandora',
      ],
      'Game': [
        'game', 'games', 'supercell', 'mihoyo', 'garena',
        'roblox', 'minecraft', 'pubg', 'mobilelegends',
        'com.activision', 'com.ea.', 'com.king.',
      ],
      'Produktivitas': [
        'docs.editors', 'sheets', 'slides', 'notion', 'todoist',
        'trello', 'asana', 'evernote', 'onenote', 'obsidian',
        'microsoft.office', 'google.android.apps.docs',
      ],
      'Pendidikan': [
        'duolingo', 'coursera', 'udemy', 'skillshare', 'edx',
        'quizlet', 'brainly', 'ruangguru', 'zenius',
      ],
      'Berita': [
        'news', 'detik', 'kompas', 'liputan6', 'cnnindonesia',
        'tribun', 'kumparan', 'flipboard',
      ],
      'Belanja': [
        'shopee', 'tokopedia', 'lazada', 'bukalapak', 'blibli',
        'amazon', 'alibaba', 'zalora',
      ],
      'Keuangan': [
        'gopay', 'ovo', 'dana', 'shopeepay', 'banking',
        'bank', 'bibit', 'bareksa', 'stockbit', 'ajaib',
      ],
      'Browser': [
        'chrome', 'browser', 'firefox', 'opera', 'brave', 'edge', 'safari',
      ],
      'Sistem': [
        'launcher', 'systemui', 'settings', 'inputmethod', 'keyboard',
        'android.vending', 'permissioncontroller',
      ],
    };

    for (final entry in categories.entries) {
      if (_matchAny(pkg, entry.value)) {
        return entry.key;
      }
    }

    return 'Lainnya';
  }

  static bool _matchAny(String pkg, List<String> keywords) =>
      keywords.any((k) => pkg.contains(k));
}
