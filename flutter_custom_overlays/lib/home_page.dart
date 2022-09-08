import 'package:flutter/material.dart';
import 'package:flutter_custom_overlays/widgets/basic_card.dart';
import 'package:flutter_custom_overlays/widgets/custom_overlay.dart';
import 'package:flutter_custom_overlays/widgets/tutorial_card.dart';

class HomePage extends StatelessWidget {
  final cardOverlayKey = GlobalKey<CustomOverlayState>();
  final buttonOverlayKey = GlobalKey<CustomOverlayState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Overlays'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showOverlay,
        child: const Icon(Icons.help_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                const TutorialCard(),
                BasicCard(
                  title: 'qui voluptas est',
                  subtitle: 'Photo by Anna Shvets @ Pexels.com',
                  imageName: 'assets/images/pexels-photo-4587979.jpeg',
                  buttonOverlayKey: buttonOverlayKey,
                ),
                CustomOverlay(
                  key: cardOverlayKey,
                  // alignment: Alignment.center,
                  overlay: Container(
                    color: Colors.black12,
                  ),
                  child: const BasicCard(
                    title: 'quo dolor et',
                    subtitle: 'Photo by Anna Shvets @ Pexels.com',
                    imageName: 'assets/images/pexels-photo-4588014.jpeg',
                  ),
                ),
                const BasicCard(
                  title: 'accusamus doloribus eaque',
                  subtitle: 'Photo by Anna Shvets @ Pexels.com',
                  imageName: 'assets/images/pexels-photo-4588048.jpeg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showOverlay() {
    cardOverlayKey.currentState?.showOverlay();

    Future.delayed(const Duration(seconds: 1)).then((value) {
      cardOverlayKey.currentState?.hideOverlay();
      buttonOverlayKey.currentState?.showOverlay();

      Future.delayed(const Duration(seconds: 1)).then((value) {
        buttonOverlayKey.currentState?.hideOverlay();
      });
    });
  }
}
