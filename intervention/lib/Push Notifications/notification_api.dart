
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static get flutterLocalNotificationsPlugin => null;

  static Future<NotificationDetails> _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future init({bool initScheduled = false}) async {
    tz.initializeTimeZones();
    //this method is new 
    // Future<void> requestPermissions() async {
    //   if (Platform.isIOS || Platform.isMacOS) {
    //     await flutterLocalNotificationsPlugin
    //         .resolvePlatformSpecificImplementation<
    //             IOSFlutterLocalNotificationsPlugin>()
    //         ?.requestPermissions(
    //           alert: true,
    //           badge: true,
    //           sound: true,
    //         );
    //     await flutterLocalNotificationsPlugin
    //         .resolvePlatformSpecificImplementation<
    //             MacOSFlutterLocalNotificationsPlugin>()
    //         ?.requestPermissions(
    //           alert: true,
    //           badge: true,
    //           sound: true,
    //         );
    //   } else if (Platform.isAndroid) {
    //     final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
    //         flutterLocalNotificationsPlugin
    //             .resolvePlatformSpecificImplementation<
    //                 AndroidFlutterLocalNotificationsPlugin>();

    //     final bool? granted = await androidImplementation?.requestPermission();
    //     userReference.set({'pushNotificationsEnabled ': granted});
    //   }
    // }
    // requestPermissions();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings(
    );
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) async {
        onNotifications.add(payload.toString());
      },
    );
    if (initScheduled) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await (_notificationDetails()),
          payload: payload);

  static Future showScheduledNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
    required Time scheduledTime,
  }) async {
    _notifications.zonedSchedule(
      id,
      title,
      body,
      _scheduleDaily(scheduledTime),
      await (_notificationDetails()),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    return scheduledDate.isBefore(now)
        ? scheduledDate.add(const Duration(days: 1))
        : scheduledDate;
  }
}
