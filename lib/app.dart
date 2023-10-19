import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tevrozo_clone_four/my_app_theme.dart';
import 'package:tevrozo_clone_four/screens/login_screen/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const myAppTheme = MyAppTheme();

    return MaterialApp(
      title: 'TevroZo clone four',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('fr')],
      locale: const Locale('en'),
      theme: myAppTheme.toThemeData(),
      home: const LoginScreen(),
    );
  }
}
