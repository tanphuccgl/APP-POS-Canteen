import 'package:bot_toast/bot_toast.dart';
import 'package:canteen/src/config/constants/constants.dart';
import 'package:canteen/src/features/account/cubit/account_bloc.dart';
import 'package:canteen/src/localization/localization_utils.dart';
import 'package:canteen/src/router/app_router.dart';
import 'package:canteen/src/router/coordinator.dart';
import 'package:canteen/src/router/route_observer.dart';
import 'package:canteen/src/router/router_name.dart';
import 'package:canteen/src/services/user_prefs.dart';
import 'package:canteen/src/theme/themes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return BlocProvider(
      create: (_) => GetIt.I<AccountBloc>(),
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: XCoordinator.navigatorKey,
            initialRoute: UserPrefs().hasViewedOnboarding
                ? XRouterName.splash
                : XRouterName.onboard,
            onGenerateRoute: XAppRoute.onGenerateRoute,
            navigatorObservers: [XRouteObserver()],
            builder: (context, child) {
              child = DevicePreview.appBuilder(context, child);
              child = botToastBuilder(context, child);

              return child;
            },
            onGenerateTitle: (BuildContext context) =>
                S.of(context).common_appTitle,
            theme: XTheme.light(),
            darkTheme: XTheme.dark(),
            themeMode: ThemeMode.light,
            locale: Constants.turnOnDevicePreview
                ? DevicePreview.locale(context)
                : null,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', '')],
            debugShowCheckedModeBanner: false,
          );
        },
        designSize: const Size(360, 844),
        useInheritedMediaQuery: true,
      ),
    );
  }
}
