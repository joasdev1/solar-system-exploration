import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/colors.dart' as color;

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    color.Colors.purple,
                    color.Colors.blue,
                  ],
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: .6,
                  image: AssetImage(
                    'assets/images/others/Stars2.png',
                  ),
                ),
                boxShadow: [BoxShadow(blurRadius: 15)],
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Text(
                  'Solar System Exploration',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            alignment: Alignment.center,
            child: ListTile(
              leading: const Icon(
                Icons.exit_to_app_rounded,
                color: color.Colors.darkBlue,
              ),
              title: const Text('Exit'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
