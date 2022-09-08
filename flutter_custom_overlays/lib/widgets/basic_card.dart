import 'package:flutter/material.dart';
import 'package:flutter_custom_overlays/widgets/custom_overlay.dart';

class BasicCard extends StatelessWidget {
  final String imageName;

  final String title;

  final String subtitle;

  final GlobalKey<CustomOverlayState>? buttonOverlayKey;

  const BasicCard({
    required this.imageName,
    required this.title,
    required this.subtitle,
    this.buttonOverlayKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.asset(
              imageName,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'Nesciunt suscipit qui ab eaque quod sint qui quia eaque. Nihil et sint voluptas. Aut dolor molestiae praesentium corporis explicabo. Voluptas veniam voluptas aspernatur. Fugit qui harum consequatur alias.'),
            ),
            CustomOverlay(
              key: buttonOverlayKey,
              overlay: Container(color: Colors.black12),
              child: ButtonBar(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_rounded),
                    label: const Text('Edit'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.sentiment_satisfied_rounded),
                    label: const Text('Vote'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
