import 'package:flutter/material.dart';
import 'package:step_by_step/steps/overlay_only/only_overlay.dart';

class OverlayOnlyPage extends StatelessWidget {
  final overlayKey = GlobalKey<OnlyOverlayState>();

  OverlayOnlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implementing a basic overlay'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => overlayKey.currentState?.showOverlay(),
        child: const Icon(Icons.visibility),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: OnlyOverlay(
            key: overlayKey,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
