import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOverlay extends StatefulWidget {
  final Widget child;

  final Widget overlay;

  final BoxConstraints overlayConstraints;

  final Alignment alignment;

  final bool hideOverlayWhenLoosingFocus;

  final bool autofocus;

  final FocusOnKeyCallback? onKey;

  final bool ignorePointer;

  final Size margin;

  const CustomOverlay({
    required this.overlay,
    required this.child,
    super.key,
    this.overlayConstraints = const BoxConstraints.expand(),
    this.alignment = Alignment.topLeft,
    this.hideOverlayWhenLoosingFocus = true,
    this.autofocus = true,
    this.onKey,
    this.ignorePointer = true,
    this.margin = Size.zero,
  });

  @override
  State<CustomOverlay> createState() => CustomOverlayState();
}

class CustomOverlayState extends State<CustomOverlay> {
  static const negativeOne = -1;

  final LayerLink _layerLink = LayerLink();

  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  bool isVisible = false;

  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    hideOverlay();

    super.dispose();
  }

  bool toggleOverlay() {
    isVisible = !isVisible;

    if (!isVisible) {
      hideOverlay();
    } else {
      showOverlay();
    }

    return isVisible;
  }

  /// Shows the overlay. If the overlay is already visible, nothing will happen.
  void showOverlay() {
    if (_overlayEntry != null) {
      return;
    }

    // TODO mention theme injection in overlay since new context
    final theme = Theme.of(context);

    isVisible = true;

    final alignment = widget.alignment;

    final renderBox = context.findRenderObject() as RenderBox;

    final anchorSize = renderBox.size;

    final constraints = widget.overlayConstraints;

    final width = constraints.biggest.width.isInfinite ? anchorSize.width : constraints.biggest.width;

    final height = constraints.biggest.height.isInfinite ? anchorSize.height : constraints.biggest.height;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: width + widget.margin.width.abs(),
        height: height + widget.margin.height.abs(),
        child: IgnorePointer(
          ignoring: widget.ignorePointer,
          child: Theme(
            data: theme,
            child: CompositedTransformFollower(
              showWhenUnlinked: false,
              targetAnchor: alignment,
              link: _layerLink,
              offset: Offset(widget.margin.width / 2, widget.margin.height / 2),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                constraints: constraints,
                decoration: const BoxDecoration(
                    // TODO
                    ),
                clipBehavior: Clip.antiAlias,
                child: FocusScope(
                  autofocus: widget.autofocus,
                  onKeyEvent: _handleKeyEvent,
                  node: _focusScopeNode,
                  onFocusChange: _onFocusChange,
                  onKey: widget.onKey,
                  child: FocusTraversalGroup(
                    child: widget.overlay,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final overlayState = Overlay.of(context);

    if (overlayState == null) {
      throw FlutterError('OverlayState was null while trying to display an overlay!');
    }

    overlayState.insert(_overlayEntry!);

    if (widget.autofocus) {
      _focusScopeNode.requestFocus();
    }
  }

  /// Hides the overlay. If the overlay is not visible, nothing will happen.
  void hideOverlay() {
    isVisible = false;

    if (_overlayEntry == null) {
      return;
    }

    _overlayEntry?.remove();

    _overlayEntry = null;
  }

  KeyEventResult _handleKeyEvent(FocusNode focusNode, KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.escape || event.logicalKey == LogicalKeyboardKey.backspace) {
      hideOverlay();

      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void _onFocusChange(bool hasFocus) {
    if (!hasFocus && widget.hideOverlayWhenLoosingFocus) {
      hideOverlay();
    }
  }
}
