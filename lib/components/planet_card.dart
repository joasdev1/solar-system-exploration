import 'package:flutter/material.dart';
import 'package:solar_system/models/planet.dart';

class PlanetCard extends StatelessWidget {
  final double width;
  final double height;
  final Planet planet;

  const PlanetCard({required this.width, required this.height, required this.planet, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0),
      ),
      shadowColor: const Color(0xff151056),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              right: -2,
              top: 120,
              child: Text(
                planet.id,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 200,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff020632).withOpacity(0.04),
                ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planet.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffF48635),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(-4, 0),
                          blurRadius: 15,
                          color: const Color(0xffC1580B).withOpacity(0.4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/others/arrow-right.png',
                    ),
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
