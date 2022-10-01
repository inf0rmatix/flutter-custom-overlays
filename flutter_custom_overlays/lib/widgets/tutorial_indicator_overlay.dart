import 'package:flutter/material.dart';

class TutorialIndicatorOverlay extends StatelessWidget {
  const TutorialIndicatorOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OverflowBox(
            maxHeight: constraints.biggest.height + 8,
            maxWidth: constraints.biggest.width + 8,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
