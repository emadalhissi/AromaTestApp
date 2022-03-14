import 'package:aroma_test_app/DB/db_provider.dart';
import 'package:aroma_test_app/Providers/lang_provider.dart';
import 'package:aroma_test_app/Providers/splash_provider.dart';
import 'package:aroma_test_app/screens/auth/login_screen.dart';
import 'package:aroma_test_app/screens/intro_screen.dart';
import 'package:aroma_test_app/screens/launch_screen.dart';
import 'package:aroma_test_app/screens/main_screen.dart';
import 'package:aroma_test_app/screens/notifications_screen.dart';
import 'package:aroma_test_app/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().initSharedPreferences();
  await DBProvider().initDatabase();
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
    return RestartWidget(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LangProvider>(
            create: (context) => LangProvider(),
          ),
          ChangeNotifierProvider<SplashProvider>(
            create: (context) => SplashProvider(),
          ),
        ],
        child: const MyMaterialApp(),
      ),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/intro_screen': (context) => const IntroScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/notifications_screen': (context) => const NotificationsScreen(),
      },
      initialRoute: '/launch_screen',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      locale: Locale(Provider.of<LangProvider>(context).lang),
    );
  }
}

// FOR RESTARTING APP
// CALL IT FROM ANYWHERE USING => RestartWidget.restartApp(context)

class RestartWidget extends StatefulWidget {
  const RestartWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
