import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:step_by_step/steps/using_portal/portal_boy.dart';

class CompleteOverlayPage extends StatelessWidget {
  const CompleteOverlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giving good boys a treat'),
      ),
      body: Portal(
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 16),
          itemCount: 42,
          itemBuilder: (context, index) => const PortalBoy(),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
    );
  }
}
