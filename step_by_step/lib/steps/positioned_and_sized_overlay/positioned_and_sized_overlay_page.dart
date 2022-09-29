import 'package:flutter/material.dart';
import 'package:step_by_step/steps/positioned_and_sized_overlay/positioned_and_sized_overlay.dart';

class PositionedAndSizedOverlayPage extends StatelessWidget {
  final overlayKey = GlobalKey<PositionedAndSizedOverlayState>();

  PositionedAndSizedOverlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attached and sized overlay'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => overlayKey.currentState?.toggleOverlay(),
                child: const Text('Who is a good boy?'),
              ),
              const SizedBox(height: 16.0),
              PositionedAndSizedOverlay(
                key: overlayKey,
                overlay: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text('Am good boy, gib treat plz'),
                  ),
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    'assets/pexels-photo-4587979.jpeg',
                    width: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
