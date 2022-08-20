import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solar_system/pages/get_started.dart';
import 'package:solar_system/pages/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:solar_system/pages/planet_details.dart';
import './utils/routes.dart';

int? isViewed;
int? lastPlanetIndex;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  final prefs = await SharedPreferences.getInstance();

  isViewed = prefs.getInt('getStarted');
  lastPlanetIndex = prefs.getInt('lastPlanet');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Solar System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Color(0xff020632),
            fontSize: 48,
            decoration: TextDecoration.none,
          ),
          headline2: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 42,
            decoration: TextDecoration.none,
          ),
          headline3: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 18,
            decoration: TextDecoration.none,
          ),
          headline4: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Color(0xff6C6C6C),
            decoration: TextDecoration.none,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isViewed != 1 ? Routes.getStarted : Routes.home,
      routes: {
        Routes.getStarted: (context) => const GetStarted(),
        Routes.home: (context) => const Home(),
        Routes.planetDetails: (context) => const PlanetDetails(),
      },
    );
  }
}
