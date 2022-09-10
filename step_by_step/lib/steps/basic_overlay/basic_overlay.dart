import 'package:flutter/material.dart';

class BasicOverlay extends StatefulWidget {
  final Widget child;

  final Widget overlay;

  const BasicOverlay({
    required this.child,
    required this.overlay,
    super.key,
  });

  @override
  State<BasicOverlay> createState() => BasicOverlayState();
}

class BasicOverlayState extends State<BasicOverlay> {
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
    // prevent the overlay from being inserted multiple times
    if (_overlayEntry != null) {
      return;
    }

    // Get the theme from the current context
    final theme = Theme.of(context);

    _overlayEntry = OverlayEntry(
      // If not using a positioned widget, the overlay will simply stretch out across the whole viewport (window)
      builder: (context) => Positioned(
        top: 250,
        left: 275,
        right: 275,
        // In the overlays' context, there will be no theme, so we have to pass it in ourself
        child: Theme(
          data: theme,
          // When using Material Design, there needs to be a material underneath
          // for many of the material widgets to be able to render correctly
          child: Material(
            // making the material itself transparent to be able to see through
            // the overlay widget passed in might still cover the space if it wants to
            color: Colors.transparent,
            child: widget.overlay,
          ),
        ),
      ),
    );

    final overlayState = Overlay.of(context);

    if (overlayState == null) {
      throw FlutterError('OverlayState was null while trying to display an overlay!');
    }

    overlayState.insert(_overlayEntry!);
  }

  void hideOverlay() {
    _overlayEntry?.remove();

    _overlayEntry = null;
  }
}
