import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:scaffold/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

///preference setting for the notification
const showNotificationPref = "showNotificationPref";
const playSoundPref = "playSoundPref";

const int insistentFlag = 4;
final Int64List vibrationPattern = Int64List.fromList([0, 1000, 5000, 2000]);
// final Int64List vibrationPattern = Int64List(4);
// vibrationPattern[0] = 0;
// vibrationPattern[1] = 1000;
// vibrationPattern[2] = 5000;
// vibrationPattern[3] = 2000;

const String iconName = "finallogo"; //"app_logo_bbg";
/// Notification
/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel eventsChannel = const AndroidNotificationChannel(
  'events_notification', // id
  'Events Notification', // title
  description: 'This channel is used to show notification for the Events.',
// description
  importance: Importance.defaultImportance,
);

getAndroidDetails(AndroidNotificationChannel channel) =>
    AndroidNotificationDetails(
      channel.id, channel.name,
      channelDescription: channel.description,
      icon: iconName,
      playSound: getIt<SharedPreferences>().getBool(playSoundPref) ?? true,
      // sound: AndroidNotificationSound.,
      largeIcon: const DrawableResourceAndroidBitmap(iconName),
      importance: Importance.max,
      priority: Priority.high,
      // fullScreenIntent: true,
      // channelShowBadge: true,
      // when: 1,
      vibrationPattern: vibrationPattern,
      enableLights: true,
      // color: const Color.fromARGB(255, 255, 0, 0),
      ticker: 'ticker',
      // additionalFlags: Int32List.fromList(<int>[insistentFlag])
    );

getSimpleNotificationAndroidDetails(AndroidNotificationChannel channel) =>
    AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      // TODO add a proper drawable resource to android, for now using
      //      one that already exists in example app.
      icon: iconName,
    );

DarwinNotificationDetails getDarwinNotificationDetails() =>
    const DarwinNotificationDetails(
        // attachments: <DarwinNotificationAttachment>[
        // DarwinNotificationAttachment(
        // bigPicturePath,
        // hideThumbnail: hideThumbnail,
        // )]
        );
