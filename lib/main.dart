import 'package:flutter/material.dart';
import 'core/color_and_theme/app_theme.dart';
import 'core/local_notifications//notification_utils.dart';
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

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
        //for auto route
        routerConfig: _appRouter.config(),
        title: 'Flutter Demo',
        theme: appTheme,
      ),
    );
  }
}
