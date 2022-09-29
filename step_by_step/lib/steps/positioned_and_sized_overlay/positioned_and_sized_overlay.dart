import 'package:flutter/material.dart';

class PositionedAndSizedOverlay extends StatefulWidget {
  final Widget child;
  final Widget overlay;

  const PositionedAndSizedOverlay({
    required this.overlay,
    required this.child,
    super.key,
  });

  @override
  State<PositionedAndSizedOverlay> createState() => PositionedAndSizedOverlayState();
}

class PositionedAndSizedOverlayState extends State<PositionedAndSizedOverlay> {
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void toggleOverlay() {
    if (_overlayEntry == null) {
      showOverlay();
    } else {
      hideOverlay();
    }
  }

  void showOverlay() {
    if (_overlayEntry != null) {
      return;
    }

    final overlay = Overlay.of(context);

    final renderbox = context.findRenderObject() as RenderBox;

    final size = renderbox.size;

    final position = renderbox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: position.dy,
        left: position.dx,
        width: size.width,
        height: size.height,
        child: Material(
          type: MaterialType.transparency,
          child: widget.overlay,
        ),
      ),
    );

    overlay?.insert(_overlayEntry!);
  }

  void hideOverlay() {
    _overlayEntry?.remove();

    _overlayEntry = null;
  }
}
