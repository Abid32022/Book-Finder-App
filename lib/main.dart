import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_qurbani/config/all_providers.dart';
import 'package:my_qurbani/services/internet_conectivity_checker.dart';
import 'package:my_qurbani/utils/helper/setup_locator.dart';
import 'package:my_qurbani/utils/routing.dart';
import 'package:my_qurbani/views/custom_widgets/no_internet_screen.dart';
import 'package:my_qurbani/views/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
@pragma('vm:entry-point')

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    MultiProvider(
      providers: AppAllProviders.appAllProviders,
      child:  MyApp(),
    ),
  );
}


class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late ConnectivityService _connectivityService;
  bool _hasInternet = true;

  @override
  void initState() {
    super.initState();
    _connectivityService = ConnectivityService();
    _connectivityService.connectivityStream.listen((hasInternet) {
      setState(() {
        _hasInternet = hasInternet;
      });
    });
  }

  @override
  void dispose() {
    _connectivityService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChangerProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: AppAllProviders.appAllProviders,
        child: Platform.isIOS ?  CupertinoApp.router(
            theme: CupertinoThemeData(
              brightness: themeProvider.themeMode == ThemeMode.dark
                  ? Brightness.dark
                  : Brightness.light,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            routerDelegate: AppRoute.router.routerDelegate,
            routeInformationProvider: AppRoute.router.routeInformationProvider,
            routeInformationParser: AppRoute.router.routeInformationParser,

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

          ):
            GetMaterialApp.router(
              themeMode:Provider.of<ThemeChangerProvider>(context).themeMode,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              routerDelegate: AppRoute.router.routerDelegate,
              routeInformationProvider: AppRoute.router.routeInformationProvider,
              routeInformationParser: AppRoute.router.routeInformationParser,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder: (context, child) {
                if (!_hasInternet) {
                  return NoInternetScreen();
                }
                return child!;
              }
              )

      ),
    );
  }
}

