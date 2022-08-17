import 'package:flutter/material.dart';

class Planet {
  final String id;
  final String name;
  final String image;
  final List<String> imageGallery;
  final String description;
  final Color boxShadow;
  final List<Color> colors;

  const Planet({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.imageGallery,
    required this.boxShadow,
    required this.colors,
  });
}
