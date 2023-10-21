import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tevrozo_clone_four/my_app_theme.dart';
import 'package:tevrozo_clone_four/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final myAppTheme = MyAppTheme(context: context);

    return MaterialApp.router(
      title: 'TevroZo clone four',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('fr')],
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: myAppTheme.toThemeData(),
      routerConfig: routes,
      // home: const LoginScreen(),
    );
  }
}
