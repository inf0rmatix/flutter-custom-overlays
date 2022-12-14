import 'package:flutter/material.dart';
import 'package:step_by_step/steps/complete_overlay/complete_overlay.dart';

class GoodBoy extends StatelessWidget {
  final questionOverlayKey = GlobalKey<CompleteOverlayState>();
  final treatOverlayKey = GlobalKey<CompleteOverlayState>();

  GoodBoy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => questionOverlayKey.currentState?.toggleOverlay(),
          child: const Text('Who is a good boy?'),
        ),
        const SizedBox(height: 16.0),
        CompleteOverlay(
          key: questionOverlayKey,
          offset: const Offset(16, -48),
          overlay: _Overlay(
            onTap: () {
              questionOverlayKey.currentState?.hideOverlay();
              treatOverlayKey.currentState?.showOverlay();
            },
          ),
          child: CompleteOverlay(
            key: treatOverlayKey,
            overlay: _Treat(
              onTap: () => treatOverlayKey.currentState?.hideOverlay(),
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
        ),
      ],
    );
  }
}

class _Overlay extends StatelessWidget {
  final void Function() onTap;

  const _Overlay({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text('Am good boy, gib treat plz\n\nTap to give a treat to this goodest of boys.'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Treat extends StatelessWidget {
  final void Function() onTap;

  const _Treat({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          'assets/dog-treat.png',
          width: 100,
        ),
      ),
    );
  }
}
