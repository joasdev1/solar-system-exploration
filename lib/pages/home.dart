import 'package:flutter/material.dart';
import 'package:solar_system/components/navigation_drawer.dart';
import '../utils/colors.dart' as color;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return Container(
            margin: const EdgeInsets.only(left: 20),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Image.asset('assets/images/others/Hamburger_icon.png'),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          );
        }),
        actions: [
          Image.asset(
            'assets/images/others/Avatar.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 20),
        ],
      ),
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
    );
  }
}
