import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/services/auth.dart';
import 'package:the_movie_db/services/http.dart';
import 'package:the_movie_db/services/storage.dart';
import 'package:the_movie_db/utils/strings.dart';
import 'utils/pages.dart';
import 'utils/routes.dart';

// flutter build apk --split-per-abi
// flutter build appbundle
// flutter pub cache repair
// flutter build ios
// ./gradlew signingReport
// gradlew signingReport
// flutter pub run flutter_launcher_icons:main

Future<void> initApp() async {
  await Firebase.initializeApp();

  await Get.putAsync(() => StorageService().init());

  Get.put(HttpService());
  Get.put(AuthService());

  runApp(MyApp());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initApp();
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      popGesture: false,
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      unknownRoute: AppPages.notFound,
      navigatorObservers: <NavigatorObserver>[observer],
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Bitter",
      ),
    );
  }
}
