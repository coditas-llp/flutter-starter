import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../injection_container.dart';
import 'notification_config.dart';
import 'notification_model.dart';

int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
/// only for the IOS
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

/// for other platforms
final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

const String portName = 'notification_send_port';

String? selectedNotificationPayload;

class NotificationUtils {
  static void dispose() {
    ///
    /// call when notification streams are no longer needed
    ///
    didReceiveLocalNotificationStream.close();
    selectNotificationStream.close();
    // super.dispose();
  }

  /// Initialisation of the local notification
  init() async {
    ///
    ///call this method in the main
    ///
    ///this will check if the app is launched from the notification and
    ///also set the platform specific settings required before firing any notification
    ///
    await _configureLocalTimeZone();
    checkIfAppLaunchFromNotification();
    setNotificationSetting();
  }

  initState(BuildContext context) {
    ///
    ///call in the init state of first screen
    ///
    ///this checks the permissions required to show the notification
    ///and configure the events of notification when app is in foreground
    _isAndroidPermissionGranted();
    requestPermissions();

    ///only for ios
    _configureDidReceiveLocalNotificationSubject(context);

    ///for all other platforms
    _configureSelectNotificationSubject();
  }

  checkIfAppLaunchFromNotification() async {
    ///
    ///get the notification info to check if the application launched by notification on clicked
    ///
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        !kIsWeb && Platform.isLinux
            ? null
            : await flutterLocalNotificationsPlugin
                .getNotificationAppLaunchDetails();
    String initialRoute = "HomePage";
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload =
          notificationAppLaunchDetails!.notificationResponse?.payload;
      //           value: notificationAppLaunchDetails!
      //           .notificationResponse?.id;
      //           notificationAppLaunchDetails!
      //           .notificationResponse?.actionId;
      //           notificationAppLaunchDetails!
      //           .notificationResponse?.input;
      ///get payload and set the screen if application launched from the notification
      if (selectedNotificationPayload != null) {
        initialRoute =
            getRouteFromNotificationPayload(selectedNotificationPayload!);
      }
    }
  }

  setNotificationSetting() async {
    ///
    ///set the platform specific settings for the flutter notification lib
    ///initialize the notification settings for each platform
    ///
    /// ANDROID
    ///
    const AndroidInitializationSettings initializationSettingsAndroid =
        //don't add extension of icon and icon must be in drawable folder
        AndroidInitializationSettings('flutter');

    ///
    /// IOS
    ///
    final List<DarwinNotificationCategory> darwinNotificationCategories =
        <DarwinNotificationCategory>[
      DarwinNotificationCategory(
        darwinNotificationCategoryText,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.text(
            'text_1',
            'Action 1',
            buttonTitle: 'Send',
            placeholder: 'Placeholder',
          ),
        ],
      ),
      DarwinNotificationCategory(
        darwinNotificationCategoryPlain,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.plain(urlLaunchActionId, 'Action 1'),
          DarwinNotificationAction.plain(
            'id_2',
            'Action 2 (destructive)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.destructive,
            },
          ),
          DarwinNotificationAction.plain(
            navigationActionId,
            'Action 3 (foreground)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.foreground,
            },
          ),
          DarwinNotificationAction.plain(
            'id_4',
            'Action 4 (auth required)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.authenticationRequired,
            },
          ),
        ],
        options: <DarwinNotificationCategoryOption>{
          DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
        },
      )
    ];

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        didReceiveLocalNotificationStream.add(
          ReceivedNotification(
            id: id,
            title: title,
            body: body,
            payload: payload,
          ),
        );
      },
      notificationCategories: darwinNotificationCategories,
    );

    ///
    /// LINUX
    ///
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(
      defaultActionName: 'Open notification',
      defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );

    ///
    /// initialize the global object of the notification
    ///
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            selectNotificationStream.add(notificationResponse.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            if (notificationResponse.actionId == navigationActionId) {
              selectNotificationStream.add(notificationResponse.payload);
            }
            break;
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(
      NotificationResponse notificationResponse) {
    // ignore: avoid_print
    print('notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with'
        ' payload: ${notificationResponse.payload}');
    if (notificationResponse.input?.isNotEmpty ?? false) {
      // ignore: avoid_print
      print(
          'notification action tapped with input: ${notificationResponse.input}');
    }
  }

  bool androidNotificationsEnabled = false;

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;
      androidNotificationsEnabled = granted;
    }
  }

  Future<void> requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestPermission();
      androidNotificationsEnabled = granted ?? false;
    }
  }

  void _configureDidReceiveLocalNotificationSubject(BuildContext context) {
    /// this is for the ios only as IOS may not show the notification while app is foreground
    didReceiveLocalNotificationStream.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title!)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body!)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                String newRoute = getRouteFromNotificationPayload(
                    selectedNotificationPayload!);
                // await Navigator.of(context).push(
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) =>
                //         SecondPage(receivedNotification.payload),
                //   ),
                // );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String? payload) async {
      String newRoute =
          getRouteFromNotificationPayload(selectedNotificationPayload!);
      // await Navigator.of(context).push(MaterialPageRoute<void>(
      //   builder: (BuildContext context) => SecondPage(payload),
      // ));
    });
  }

  String getRouteFromNotificationPayload(String payload) {
    ///get the page name from the payload meta data
    ///fetch along with metadata to show the particular entry
    if (payload.contains("event_notification")) {
      return "EventDetails";
    } else if (payload.contains("chat_notification")) {
      return "ChatPage";
    } else {
      return "HomePage";
    }
  }

  Future<void> _configureLocalTimeZone() async {
    ///
    ///set the timezone for the scheduled notification
    ///
    if (kIsWeb || Platform.isLinux) {
      return;
    }
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  showNotification(
    int notificationId,
    String title,
    String body,
  ) {
    flutterLocalNotificationsPlugin.show(
        notificationId,
        title,
        body,
        NotificationDetails(
            android: getAndroidDetails(eventsChannel),
            iOS: getDarwinNotificationDetails()),
        payload: "");
  }

  setScheduledNotification(int notificationId, String title, String body,
      tz.TZDateTime scheduledNotificationDateTime,
      {String? payload,
      AndroidScheduleMode androidScheduleMode = AndroidScheduleMode.exact,
      required UILocalNotificationDateInterpretation absoluteTime,
      bool isSaved = false}) async {
    debugPrint(
        "$playSoundPref ${getIt<SharedPreferences>().getBool(playSoundPref)}");
//todo:check in IOS case

    NotificationDetails platformDetails = NotificationDetails(
        android: getAndroidDetails(eventsChannel),
        iOS: getDarwinNotificationDetails());

    if (getIt<SharedPreferences>().getBool(showNotificationPref) ?? true) {
      debugPrint("alert setNotification if");
      await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        title,
        body,
        scheduledNotificationDateTime,
        platformDetails,
        payload: payload,
        androidScheduleMode: androidScheduleMode,
        uiLocalNotificationDateInterpretation: absoluteTime,
        //sets recursive notification for every notification
        // matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime
      );
    }

    ///save the notification to easily reset the notification once removed
    ///but its better to set notification again from the alerts table
    ///as it gives the latest set of the notification and extra table is not needed
    // // printDebug("alert setNotification else");
    // MyNotification element = MyNotification()
    //   ..notificationId = notificationId
    //   ..text = title
    //   ..note = body
    //   ..scheduledNotificationDateTime = scheduledNotificationDateTime
    //   ..platformDetails = platformDetails
    //   ..payload = payload
    //   ..androidAllowWhileIdle = androidAllowWhileIdle
    //   ..absoluteTime = absoluteTime;
    //
    // if (!isSaved) await element.save();
  }
}
