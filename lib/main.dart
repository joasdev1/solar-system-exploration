import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solar_system/pages/get_started.dart';
import 'package:solar_system/pages/home.dart';
import 'package:device_preview/device_preview.dart';
import './utils/routes.dart';

int? isViewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  isViewed = prefs.getInt('getStarted');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solar System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
            headline1: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 42,
          decoration: TextDecoration.none,
        )),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isViewed != 1 ? Routes.getStarted : Routes.home,
      routes: {
        Routes.getStarted: (context) => const GetStarted(),
        Routes.home: (context) => const Home(),
      },
    );
  }
}
