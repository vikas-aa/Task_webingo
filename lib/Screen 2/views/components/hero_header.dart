import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.greeting,
    required this.height,
  });

  final String imageUrl;
  final String title;
  final String greeting;
  final double height;

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth < 600;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isSmallScreen ? 8 : 12, 
        isSmallScreen ? 6 : 8, 
        isSmallScreen ? 8 : 12, 
        0
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isSmallScreen ? 20 : 28),
        child: SizedBox(
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.error_outline, color: Colors.grey),
                  );
                },
              ),

              // Overlay
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.16),
                        Colors.black.withOpacity(0.46),
                      ],
                    ),
                  ),
                ),
              ),

              // Top row
              Positioned(
                top: topPad + (isSmallScreen ? 4 : 6),
                left: isSmallScreen ? 10 : 14,
                right: isSmallScreen ? 10 : 14,
                child: Row(
                  children: [
                    // Norway text instead of back arrow
                    TitleChip(text: title, isSmallScreen: isSmallScreen),

                    const Spacer(),

                    CircleGlass(
                      diameter: isSmallScreen ? 28 : 32,
                      child: Icon(
                        Icons.person_outline, 
                        size: isSmallScreen ? 16 : 18, 
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),

              // Greeting + search pill
              Positioned(
                left: isSmallScreen ? 14 : 18,
                right: isSmallScreen ? 14 : 18,
                bottom: isSmallScreen ? 10 : 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 16 : isMediumScreen ? 18 : 20,
                        height: 1.12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: isSmallScreen ? 8 : 12),
                    SearchPill(isSmallScreen: isSmallScreen, isMediumScreen: isMediumScreen),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleChip extends StatelessWidget {
  const TitleChip({super.key, required this.text, required this.isSmallScreen});
  final String text;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(isSmallScreen ? 14 : 18),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 8 : 10, 
          vertical: isSmallScreen ? 4 : 5
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on_outlined, 
              color: Colors.white, 
              size: isSmallScreen ? 12 : 14
            ),
            SizedBox(width: isSmallScreen ? 4 : 6),
            Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: isSmallScreen ? 11 : 12.5,
                letterSpacing: -0.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class CircleGlass extends StatelessWidget {
  const CircleGlass({super.key, required this.child, this.diameter = 34});
  final Widget child;
  final double diameter;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

class SearchPill extends StatelessWidget {
  const SearchPill({super.key, required this.isSmallScreen, required this.isMediumScreen});
  final bool isSmallScreen;
  final bool isMediumScreen;

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.inter(
      color: Colors.white.withOpacity(0.95),
      fontSize: isSmallScreen ? 12 : isMediumScreen ? 13 : 14,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.1,
    );
    
    final subStyle = GoogleFonts.inter(
      color: Colors.white.withOpacity(0.85),
      fontSize: isSmallScreen ? 10 : 12,
    );

    return Material(
      color: Colors.white.withOpacity(0.16),
      borderRadius: BorderRadius.circular(isSmallScreen ? 20 : 24),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 8 : 12, 
          vertical: isSmallScreen ? 6 : 8
        ),
        child: Row(
          children: [
            CircleGlass(
              diameter: isSmallScreen ? 30 : 34,
              child: Icon(
                Icons.search, 
                size: isSmallScreen ? 14 : 16, 
                color: Colors.white
              ),
            ),
            SizedBox(width: isSmallScreen ? 8 : 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search places', 
                    style: titleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: isSmallScreen ? 1 : 2),
                  Text(
                    'Date range  •  Number of guests', 
                    style: subStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              width: isSmallScreen ? 30 : 34,
              height: isSmallScreen ? 30 : 34,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward, 
                color: Colors.black, 
                size: isSmallScreen ? 14 : 16
              ),
            )
          ],
        ),
      ),
    );
  }
}