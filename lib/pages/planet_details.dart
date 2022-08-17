import 'package:flutter/material.dart';
import 'package:solar_system/models/planet.dart';

class PlanetDetails extends StatelessWidget {
  const PlanetDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final planet = ModalRoute.of(context)!.settings.arguments as Planet;

    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/others/Arrow Icon.png',
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: mediaQuery.size.height * 0.14,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: planet.id == "6" || planet.id == "7"
                      ? const EdgeInsets.only(left: 26, right: 26)
                      : const EdgeInsets.only(
                          bottom: 20,
                        ),
                  decoration: BoxDecoration(
                    shape: planet.id == "6" || planet.id == "7" ? BoxShape.rectangle : BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(planet.image),
                    ),
                    boxShadow: planet.id == "6" || planet.id == "7"
                        ? []
                        : [
                            BoxShadow(
                              color: planet.boxShadow,
                              blurRadius: 60.0,
                            ),
                          ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        planet.name,
                        style: Theme.of(context).textTheme.headline1,
                        // textAlign: TextAlign.justify,
                        // style: Theme.of(context).textTheme.headline1,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            planet.description,
                            style: Theme.of(context).textTheme.headline4,
                            // textAlign: TextAlign.justify,
                            // style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: mediaQuery.size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff0E6CC7),
                        Color(0xff4B0384),
                      ],
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: constraints.maxWidth * 0.2,
                            height: constraints.maxWidth * 0.2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  planet.imageGallery[0],
                                ),
                              ),
                              border: Border.all(color: const Color(0xffFFFFFF).withOpacity(0.3), width: 4),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.2,
                            height: constraints.maxWidth * 0.2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  planet.imageGallery[1],
                                ),
                              ),
                              border: Border.all(color: const Color(0xffFFFFFF).withOpacity(0.3), width: 4),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.2,
                            height: constraints.maxWidth * 0.2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  planet.imageGallery[2],
                                ),
                              ),
                              border: Border.all(color: const Color(0xffFFFFFF).withOpacity(0.3), width: 4),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: -20,
            bottom: 120,
            child: Padding(
              padding: const EdgeInsets.only(right: 26.0),
              child: Text(
                planet.id,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 250,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff020632).withOpacity(0.04),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
