import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solar_system/components/last_exploration_card.dart';
import 'package:solar_system/components/navigation_drawer.dart';
import 'package:solar_system/components/planet_card.dart';
import 'package:solar_system/data/planet_data.dart';
import 'package:solar_system/utils/routes.dart';
import 'package:solar_system/main.dart';
import '../utils/colors.dart' as color;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = "Planets";
  List<String> dropdownItems = ['Planets', 'Others'];

  int activePage = 0;
  bool selected = false;

  _savePlanetData(int index) async {
    lastPlanetIndex = index;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('lastPlanet', index);
  }

  List<Widget> indicators(cardsLength, currentIndex) {
    return List<Widget>.generate(cardsLength, (index) {
      return Container(
        margin: const EdgeInsets.all(4.0),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.white : Colors.white.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Builder(
        builder: (context) {
          return Container(
            margin: const EdgeInsets.only(left: 16),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Image.asset(
                'assets/images/others/Hamburger_icon.png',
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          );
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/images/others/Avatar.png',
          ),
        ),
        const SizedBox(width: 16),
      ],
    );

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
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(
            'assets/images/others/Stars2.png',
            scale: 0.9,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          drawer: const NavigationDrawer(),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 26,
              // right: 26,
              top: 22,
              bottom: 26,
            ),
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * 0.04,
                          child: Text(
                            'Last Exploration',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.planetDetails, arguments: planetData[lastPlanetIndex ?? 0]);
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.25,
                                padding: const EdgeInsets.only(right: 26),
                                child: LastExplorationCard(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  planet: planetData[lastPlanetIndex ?? 0],
                                ),
                              ),
                              Positioned(
                                right: 58,
                                child: SizedBox(
                                  height: constraints.maxHeight * 0.24,
                                  child: Image.asset(
                                    'assets/images/others/Astronaut2.png',

                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        SizedBox(
                          height: constraints.maxHeight * 0.04,
                          child: DropdownButton<String>(
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Image.asset(
                                'assets/images/others/chevron-down.png',
                              ),
                            ),
                            underline: const SizedBox(),
                            value: dropdownValue,
                            style: Theme.of(context).textTheme.headline3,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        Column(
                          children: [
                            Container(
                              height: constraints.maxHeight * 0.55,
                              padding: const EdgeInsets.only(right: 26),
                              child: PageView.builder(
                                itemCount: planetData.length,
                                physics: const BouncingScrollPhysics(),
                                onPageChanged: (int page) {
                                  setState(() {
                                    activePage = page;
                                    selected = !selected;
                                  });
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      Navigator.of(context)
                                          .pushNamed(Routes.planetDetails, arguments: planetData[index])
                                          .then((e) => setState(() {}));

                                      await _savePlanetData(index);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60.0),
                                      child: PlanetCard(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height,
                                        planet: planetData[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * 0.05,
                              padding: const EdgeInsets.only(right: 26, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: indicators(planetData.length, activePage),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Positioned(
                  bottom: planetData[activePage].id == "6" || planetData[activePage].id == "7" ? 120 : 170,
                  right: planetData[activePage].id == "6" || planetData[activePage].id == "7" ? 20 : 0,
                  child: Container(
                    height: planetData[activePage].id == "6" || planetData[activePage].id == "7"
                        ? MediaQuery.of(context).size.height * 0.40
                        : MediaQuery.of(context).size.height * 0.28,
                    width: planetData[activePage].id == "6" || planetData[activePage].id == "7"
                        ? MediaQuery.of(context).size.height * 0.40
                        : 241,
                    decoration: BoxDecoration(
                      shape: planetData[activePage].id == "6" || planetData[activePage].id == "7"
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          planetData[activePage].image,
                        ),
                      ),
                      boxShadow: planetData[activePage].id == "6" || planetData[activePage].id == "7"
                          ? []
                          : [
                              BoxShadow(
                                color: planetData[activePage].boxShadow,
                                blurRadius: 60.0,
                                offset: const Offset(-8, 10),
                              )
                            ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
