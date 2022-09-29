import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class PortalBoy extends StatefulWidget {
  const PortalBoy({super.key});

  @override
  State<PortalBoy> createState() => _PortalBoyState();
}

class _PortalBoyState extends State<PortalBoy> {
  var isOverlayVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => setState(() => isOverlayVisible = !isOverlayVisible),
          child: const Text('Who is a good boy?'),
        ),
        const SizedBox(height: 16.0),
        PortalTarget(
          anchor: const Aligned(
            follower: Alignment.center,
            target: Alignment.center,
            widthFactor: 1,
            heightFactor: 1,
          ),
          visible: isOverlayVisible,
          portalFollower: const _Overlay(),
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
      ],
    );
  }
}

class _Overlay extends StatelessWidget {
  const _Overlay();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: const Center(
              child: Text('Am good boy, gib treat plz'),
            ),
          ),
        ),
      ),
    );
  }
}
