import 'package:flutter/material.dart';
import 'package:solar_system/components/swipe_button.dart';
import 'package:solar_system/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/colors.dart' as color;

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  bool isFinished = false;

  _getStarted() async {
    int isViewed = 1;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('getStarted', isViewed);
  }

  void _toHome() {
    Navigator.of(context).pushReplacementNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                color.Colors.purple,
                color.Colors.darkBlue,
                color.Colors.blue,
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/images/others/Signal.png',
        ),
        Positioned(
          top: 32,
          left: 18,
          child: Image.asset(
            'assets/images/others/Satelite.png',
          ),
        ),
        Align(
          child: Image.asset(
            'assets/images/others/Starts.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 0,
          top: 200,
          // bottom: 500,
          child: Image.asset(
            'assets/images/others/Moon.png',
          ),
        ),
        Positioned(
          left: 20,
          bottom: 280,
          child: Image.asset(
            'assets/images/others/Comet.png',
            width: 66,
            height: 44,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            'assets/images/others/Astronaut.png',
            height: 264.5,
            filterQuality: FilterQuality.high,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Explore\nThe Universe',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 12,
              ),
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: SwipeButton(
                  text: 'Get Started',
                  onTap: () async {
                    await _getStarted();
                    _toHome();
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
