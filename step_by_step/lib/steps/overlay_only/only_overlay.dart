import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnlyOverlay extends StatefulWidget {
  final Widget child;

  const OnlyOverlay({
    required this.child,
    super.key,
  });

  @override
  State<OnlyOverlay> createState() => OnlyOverlayState();
}

class OnlyOverlayState extends State<OnlyOverlay> {
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void showOverlay() {
    final overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => hideOverlay(),
        child: Container(
          color: Colors.teal,
        ),
      ),
    );

    overlayState?.insert(overlayEntry!);
  }

  void hideOverlay() {
    overlayEntry?.remove();
  }
}
