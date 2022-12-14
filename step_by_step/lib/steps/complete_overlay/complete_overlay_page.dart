import 'package:flutter/material.dart';
import 'package:step_by_step/steps/complete_overlay/good_boy.dart';

class CompleteOverlayPage extends StatelessWidget {
  const CompleteOverlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giving good boys a treat'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 16),
        itemCount: 42,
        itemBuilder: (context, index) => GoodBoy(),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}
