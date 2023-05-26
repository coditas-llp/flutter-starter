import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'core/color_and_theme/app_theme.dart';
import 'core/local_notifications//notification_utils.dart';
import 'core/multilingual/app_locale.dart';
import 'core/screen_responsiveness/sr_utils.dart';
import 'injection_container.dart';
import 'rout_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //dependency injection
  await init();
  //local notification
  NotificationUtils().init();
//init responsiveness

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('km', AppLocale.KM),
        const MapLocale('ja', AppLocale.JA),
      ],
      initLanguageCode: 'en',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;

    super.initState();
  }

  // the setState function here is a must to add
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  //autoroute
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //sizes as per screen orientation
    sRInit(context);
    final MediaQueryData data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaleFactor: ScreenUtil().textScale),
      child: MaterialApp.router(
        ///for localisation
        supportedLocales: localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,

        ///for auto route
        routerConfig: _appRouter.config(),
        title: 'Flutter Demo',
        theme: appTheme,
      ),
    );
  }
}
