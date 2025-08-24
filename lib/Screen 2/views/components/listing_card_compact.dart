import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_webingo/Screen%202/views/components/fade_in_image.dart';
import 'hero_header.dart';

class ListingCardCompact extends StatelessWidget {
  const ListingCardCompact({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.ratingText,
    required this.facts,
    required this.priceOld,
    required this.priceNew,
    required this.total,
  });

  final String imageUrl;
  final String title;
  final String ratingText;
  final String facts;
  final String priceOld;
  final String priceNew;
  final String total;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(20)),
                  child: AspectRatio(
                    aspectRatio: 10.5 / 6,
                    child: MyFadeInImage(url: imageUrl),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleGlass(
                    diameter: 32,
                    child: const Icon(Icons.favorite_border,
                        color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Rating in same row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            letterSpacing: -0.1,
                            color: const Color(0xFF111111),
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          const Icon(Icons.star_rounded,
                              size: 16, color: Color(0xFF111111)),
                          const SizedBox(width: 2),
                          Text(
                            ratingText,
                            style: GoogleFonts.inter(
                              fontSize: 12.5,
                              color: const Color(0xFF111111),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Facts aligned left
                  Text(
                    facts,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF3C3C43).withOpacity(0.7),
                    ),
                  ),

                  // Price row
                  Row(
                    children: [
                      Text(
                        priceOld,
                        style: GoogleFonts.inter(
                          decoration: TextDecoration.lineThrough,
                          color: const Color(0xFF3C3C43).withOpacity(0.6),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        priceNew,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: const Color(0xFF111111),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '•',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF3C3C43).withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        total,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: const Color(0xFF3C3C43).withOpacity(0.7),
                        ),
                      ),
                    ],
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