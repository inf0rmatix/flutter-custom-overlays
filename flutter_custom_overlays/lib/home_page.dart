import 'package:flutter/material.dart';
import 'package:flutter_custom_overlays/widgets/basic_card.dart';
import 'package:flutter_custom_overlays/widgets/tutorial_card.dart';
import 'package:flutter_custom_overlays/widgets/tutorial_indicator_overlay.dart';
import 'package:flutter_portal/flutter_portal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isCardTutorialVisible = false;
  var isCardActionTutorialVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Overlays'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showTutorial,
        child: const Icon(Icons.help_rounded),
      ),
      body: Portal(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  const TutorialCard(),
                  PortalTarget(
                    anchor: const Aligned(
                      follower: Alignment.center,
                      target: Alignment.center,
                      heightFactor: 1,
                      widthFactor: 1,
                    ),
                    visible: isCardTutorialVisible,
                    portalFollower: const TutorialIndicatorOverlay(),
                    child: BasicCard(
                      title: 'quo dolor et',
                      subtitle: 'Photo by Anna Shvets @ Pexels.com',
                      imageName: 'assets/images/pexels-photo-4588014.jpeg',
                      isTutorialIndicatorVisible: isCardActionTutorialVisible,
                    ),
                  ),
                  const BasicCard(
                    title: 'qui voluptas est',
                    subtitle: 'Photo by Anna Shvets @ Pexels.com',
                    imageName: 'assets/images/pexels-photo-4587979.jpeg',
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
      ),
    );
  }

  Future<void> showTutorial() async {
    setState(() {
      isCardTutorialVisible = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isCardTutorialVisible = false;
      isCardActionTutorialVisible = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isCardActionTutorialVisible = false;
    });
  }
}
