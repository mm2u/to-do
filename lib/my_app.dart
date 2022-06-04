import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'helpers/colors.dart';
import 'helpers/constants.dart';

import 'configs/locator.dart';
import 'configs/routes_handler.dart';

import 'ui/splash/splash_page.dart';
import 'ui/widgets/others.dart';

import 'services/navigation_service.dart';

import 'stores/global_state.dart';

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  final _botToastBuilder = BotToastInit();

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  init() async {

  }

  @override
  Widget build(BuildContext context) {
    final app = MultiProvider(
      providers: [
        Provider<GlobalState>(create: (_) => GlobalState()),
      ],
      child: Sizer(
        builder: (cx, orientation, deviceType) {
          return MaterialApp(
            navigatorKey: locator<NavigationService>().navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: Constants.APP_NAME,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.root,
            routes: <String, WidgetBuilder>{
              Routes.root: (context) => const SplashPage(),
            },
            onGenerateRoute: Routes.router.generator,
            navigatorObservers: [
              BotToastNavigatorObserver(),
            ],
            builder: EasyLoading.init(
              builder: (context, widget) {
                widget = _botToastBuilder(context, widget);
                ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                  return getErrorWidget(context, errorDetails);
                };
                return Theme(
                  data: ThemeData(
                    primaryColor: AppColors.ORANGE,
                    canvasColor: AppColors.WHITE,
                    fontFamily: Constants.FONT_CALIBRI,
                    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.ORANGE),
                  ),
                  child: widget,
                );
              },
            ),
          );
        },
      ),
    );
    return app;
  }

}
