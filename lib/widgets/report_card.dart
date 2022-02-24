import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    required this.title,
    required this.child,
    required this.imagePath,
    required this.onTap,
    this.subtitle = 'Tap here for more details',
    this.height = 120,
    this.opacity = 0.3,
    Key? key,
  }) : super(key: key);
  final double height;
  final String title;
  final Widget child;
  final String imagePath;
  final String subtitle;
  final double opacity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 4),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.9),
                    Theme.of(context).colorScheme.primary,
                  ],
                  // colors: [
                  //   Colors.lightBlue,
                  //   Colors.blue,
                  //   Colors.blueAccent,
                  // ],
                ),
              ),
            ),
            Positioned(
              right: 4,
              top: 8,
              bottom: 4,
              child: Opacity(
                opacity: opacity,
                child: Image.asset(imagePath),
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  const Spacer(),
                  child,
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white54),
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
