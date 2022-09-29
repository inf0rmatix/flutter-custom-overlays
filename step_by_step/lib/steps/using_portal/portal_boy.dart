import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class PortalBoy extends StatefulWidget {
  const PortalBoy({super.key});

  @override
  State<PortalBoy> createState() => _PortalBoyState();
}

class _PortalBoyState extends State<PortalBoy> {
  var isOverlayVisible = false;

  var isTreatVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => setState(() => isTreatVisible = true),
          child: const Text('Who is a good boy?'),
        ),
        const SizedBox(height: 16.0),
        PortalTarget(
          anchor: const Aligned(
            follower: Alignment.center,
            target: Alignment.center,
          ),
          visible: isTreatVisible,
          portalFollower: _Overlay(
            onTap: () {
              setState(() {
                isOverlayVisible = false;
                isTreatVisible = true;
              });
            },
          ),
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
  final void Function() onTap;

  const _Overlay({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text('Am good boy, gib treat plz'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Treat extends StatelessWidget {
  const _Treat({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: Image.asset(
          'assets/dog-treat.png',
          width: 100,
        ),
      ),
    );
  }
}
