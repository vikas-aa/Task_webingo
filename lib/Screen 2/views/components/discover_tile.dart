import 'package:flutter/material.dart';
import 'package:task_webingo/Screen%202/views/components/fade_in_image.dart';


class DiscoverTile extends StatelessWidget {
  const DiscoverTile({
    super.key,
    required this.title,
    required this.imageUrl,
    this.width = 168,
  });

  final String title;
  final String imageUrl;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: width,
        height: 132,
        child: Stack(
          fit: StackFit.expand,
          children: [
             MyFadeInImage(url: imageUrl),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(0.48),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}