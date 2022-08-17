import 'package:flutter/material.dart';
import 'package:solar_system/models/planet.dart';

class LastExplorationCard extends StatelessWidget {
  final double width;
  final double height;
  final Planet planet;

  const LastExplorationCard({
    required this.width,
    required this.height,
    required this.planet,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      shadowColor: const Color(0xff151056),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: planet.colors,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: planet.id == "6" || planet.id == "7" ? 28 : 50,
              left: 16,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: planet.id == "6" || planet.id == "7"
                      ? []
                      : [
                          BoxShadow(
                            color: planet.boxShadow,
                            blurRadius: 20.0,
                            offset: const Offset(-8, 10),
                          )
                        ],
                ),
                child: Image.asset(
                  planet.image,
                  height: 163,
                  width: 163,
                ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    planet.name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Image.asset(
                    'assets/images/others/arrow-right.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
