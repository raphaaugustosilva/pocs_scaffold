import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocs_scaffold/presentation/ui/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runZonedGuarded(() async {
    //await _initializeFirebase();
    runApp(const App());
  }, (Object error, StackTrace stack) {
    //FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

// Future<void> _initializeFirebase() async {
//   try {
//     await Firebase.initializeApp();
//     FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
//     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
//     // ignore: empty_catches
//   } catch (e) {}
// }

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static GlobalKey<NavigatorState> navigatorKey = _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark, //Status bar default theme
        child: MaterialApp(
          title: 'POC',
          debugShowCheckedModeBanner: false,
          navigatorKey: _navigatorKey,
          home: const HomePage(),
          //initialRoute: "/",
          //navigatorObservers: [FirebaseAnalyticsObserver(analytics: AppAnalytics.instance.firebaseAnalytics)],
        ),
      ),
    );
  }
}
