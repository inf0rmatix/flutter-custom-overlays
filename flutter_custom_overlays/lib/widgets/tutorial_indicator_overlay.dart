import 'package:flutter/material.dart';

class TutorialIndicatorOverlay extends StatelessWidget {
  const TutorialIndicatorOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
