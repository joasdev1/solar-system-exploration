import 'package:flutter/material.dart';
import 'package:solar_system/components/sliding_up_panel.dart';
import 'package:solar_system/data/planet_data.dart';
import 'package:solar_system/models/planet.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  final Planet planet;

  const PanelWidget({required this.controller, required this.panelController, required this.planet, Key? key})
      : super(key: key);

  void tooglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open();

  Widget buildGallery() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 97,
            height: 100,
            // clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  planet.id == "3" ? planet.imageGallery[0] : planet.image,
                ),
              ),
              border: Border.all(color: const Color(0xffFFFFFF).withOpacity(0.3), width: 4),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            width: 97,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  planet.id == "3" ? planet.imageGallery[1] : planet.image,
                ),
              ),
              border: Border.all(color: const Color(0xffFFFFFF).withOpacity(0.3), width: 4),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            width: 97,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  planet.id == "3" ? planet.imageGallery[2] : planet.image,
                ),
              ),
              border: Border.all(color: const Color(0xffFFFFFF).withOpacity(0.3), width: 4),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDragHandle() {
    return GestureDetector(
      onTap: tooglePanel,
      child: Center(
        child: Container(
          width: 41,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: [
        const SizedBox(height: 12),
        buildDragHandle(),
        const SizedBox(height: 18),
        buildGallery(),
        const SizedBox(height: 36),
        Center(
          child: Text(
            'Coming Soon!',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ],
    );
  }
}
