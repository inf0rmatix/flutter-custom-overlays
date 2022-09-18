import 'package:flutter/material.dart';

class CompleteOverlay extends StatefulWidget {
  final Widget child;

  final Widget overlay;

  /// Added onto the child's size for the overlay constraints.
  /// Positive values expand the size, negative values shrink the size
  /// Always applied equally horizontal and vertical
  final Offset offset;

  const CompleteOverlay({
    required this.child,
    required this.overlay,
    this.offset = Offset.zero,
    super.key,
  });

  @override
  State<CompleteOverlay> createState() => CompleteOverlayState();
}

class CompleteOverlayState extends State<CompleteOverlay> {
  OverlayEntry? _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    // we need to make sure that the overlay is removed once this widget gets disposed
    hideOverlay();

    super.dispose();
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

    // getting the size of the overlaid widget
    final renderBox = context.findRenderObject() as RenderBox;

    final anchorSize = renderBox.size;

    _overlayEntry = OverlayEntry(
      // If not using a positioned widget, the overlay-entry will simply stretch out across the whole size of the overlay.
      // By default, there is only one overlay supplied by the navigator, which's size is the whole viewport (window)
      builder: (context) => Positioned(
        width: anchorSize.width + widget.offset.dx,
        height: anchorSize.height + widget.offset.dy,
        child: CompositedTransformFollower(
          // This parameter should be set to false,
          // otherwise the overlay-entry would still be visible for a few frames before dispose gets called.
          // Since the widget it is linked to is no longer visible, it will move to the top left corner
          showWhenUnlinked: false,
          // Connects the widget's position to the overlaid child
          link: _layerLink,
          // equally distribute the size offset, negate the values to move outside the linked widgets position and vice versa
          offset: Offset(
            -widget.offset.dx / 2,
            -widget.offset.dy / 2,
          ),
          child: Material(
            // important to prevent the material from absorbing any gestures and taps
            type: MaterialType.transparency,
            // Making the material itself transparent to be able to see through,
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
