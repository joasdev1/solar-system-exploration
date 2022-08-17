import 'package:flutter/cupertino.dart';

import '../models/planet.dart';

const planetData = [
  Planet(
    id: "1",
    name: "Mercury",
    description:
        "The smallest planet in our solar system and nearest to the Sun, Mercury is only slightly larger than Earth's Moon.",
    boxShadow: Color.fromARGB(255, 139, 90, 61),
    colors: [Color(0xffCE7744), Color(0xffDEA079)],
    image: "assets/images/planets/mercury.png",
    imageGallery: [],
  ),
  Planet(
    id: "2",
    name: "Venus",
    description:
        "Venus is the second planet from the Sun and is Earth's closest planetary neighbor. It's one of the four inner, terrestrial (or rocky) planets, and it's often called Earth's twin because it's similar in size and density. ",
    boxShadow: Color.fromARGB(255, 255, 110, 82),
    colors: [Color.fromARGB(255, 255, 151, 103), Color.fromARGB(255, 248, 195, 125)],
    image: "assets/images/planets/venus.png",
    imageGallery: [],
  ),
  Planet(
    id: "3",
    name: "Earth",
    description:
        "Our home planet is the third planet from the Sun, and the only place we know of so far thats inhabited by living things.",
    boxShadow: Color.fromARGB(255, 147, 247, 190),
    colors: [Color(0xff19C5EB), Color(0xff9BEDB1)],
    image: "assets/images/planets/earth.png",
    imageGallery: [
      "assets/images/gallery/earth/e1.png",
      "assets/images/gallery/earth/e2.png",
      "assets/images/gallery/earth/e3.png"
    ],
  ),
  Planet(
    id: "4",
    name: "Mars",
    description:
        "Mars is the fourth planet from the Sun – a dusty, cold, desert world with a very thin atmosphere. Mars is also a dynamic planet with seasons, polar ice caps, canyons, extinct volcanoes, and evidence that it was even more active in the past.",
    boxShadow: Color(0xffEC2C22),
    colors: [Color(0xffF48535), Color(0xffF4A435)],
    image: "assets/images/planets/mars.png",
    imageGallery: [],
  ),
  Planet(
    id: "5",
    name: "Jupiter",
    description:
        "Fifth in line from the Sun, Jupiter is, by far, the largest planet in the solar system – more than twice as massive as all the other planets combined.",
    boxShadow: Color(0xffA4776A),
    colors: [Color(0xffDD7252), Color(0xffF2BD89)],
    image: "assets/images/planets/jupiter.png",
    imageGallery: [],
  ),
  Planet(
    id: "6",
    name: "Saturn",
    description: "Saturn is the sixth planet from the Sun and the second-largest planet in our solar system.",
    boxShadow: Color(0xffFFDFB0),
    colors: [Color(0xffD26D37), Color(0xffDF9974)],
    image: "assets/images/planets/saturn.png",
    imageGallery: [],
  ),
  Planet(
    id: "7",
    name: "Uranus",
    description:
        "Uranus is the seventh planet from the Sun, and has the third-largest diameter in our solar system. It was the first planet found with the aid of a telescope, Uranus was discovered in 1781 by astronomer William Herschel, although he originally thought it was either a comet or a star.",
    boxShadow: Color.fromARGB(255, 210, 244, 250),
    colors: [Color(0xff06A1CC), Color(0xff18C4DB)],
    image: "assets/images/planets/uranus.png",
    imageGallery: [],
  ),
  Planet(
    id: "8",
    name: "Neptune",
    description:
        "Dark, cold, and whipped by supersonic winds, ice giant Neptune is the eighth and most distant planet in our solar system.",
    boxShadow: Color.fromARGB(255, 2, 103, 180),
    colors: [Color(0xff0073CD), Color.fromARGB(255, 6, 131, 233)],
    image: 'assets/images/planets/neptune.png',
    imageGallery: [],
  ),
];
