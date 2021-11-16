import 'package:aroma_test_app/screens/launch_screen.dart';
import 'package:aroma_test_app/screens/main_screen.dart';
import 'package:aroma_test_app/screens/notifications_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/notifications_screen': (context) => const NotificationsScreen(),
      },
      initialRoute: '/launch_screen',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'),
        Locale('en'),
      ],
      locale: Locale('ar'),
    );
  }
}
