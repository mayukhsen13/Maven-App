import 'package:otg_learning/ui/pages/login.dart';
import 'package:otg_learning/ui/pages/splash.dart';

import './theme/theme.dart';

import './ui/layouts/MainLayout.dart';
import './ui/pages/undefinedScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: kLightTheme,
      child: CupertinoApp(
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        onUnknownRoute: (settings) => CupertinoPageRoute(
            builder: (context) => UndefinedScreen(
                  name: settings.name,
                )),
        // theme: Provider.of<ThemeModel>(context).currentTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (BuildContext ctx) {
            return SplashScreen();
          },
          '/main': (BuildContext ctx) {
            return MainLayout();
          },
          '/login': (BuildContext ctx) {
            return LoginPage();
          }
        },
      ),
    );
  }
}
