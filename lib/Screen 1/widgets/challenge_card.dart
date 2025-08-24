import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeCard extends StatelessWidget {
  final bool isCompact;
  const ChallengeCard({required this.isCompact, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFFBDA9FF),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Stack(
        children: [
         
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Daily" alag row me aur "challenge" alag row me
                Text(
                  'Daily',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0E0E12),
                  ),
                ),
                Text(
                  'challenge',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0E0E12),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Do your plan before 09:00 AM',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3A305C),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    AvatarCircle(
                        imageUrl: "https://randomuser.me/api/portraits/women/68.jpg"),
                    Transform.translate(
                      offset: const Offset(-10, 0),
                      child: AvatarCircle(
                          imageUrl:
                              "https://randomuser.me/api/portraits/men/52.jpg"),
                    ),
                    Transform.translate(
                      offset: const Offset(-20, 0),
                      child: AvatarCircle(
                          imageUrl:
                              "https://randomuser.me/api/portraits/women/47.jpg"),
                    ),
                    Transform.translate(
                      offset: const Offset(-30, 0),
                      child: const MoreCircle(label: '+4'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Avatar with image (circular with border)
class AvatarCircle extends StatelessWidget {
  final String imageUrl;
  const AvatarCircle({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MoreCircle extends StatelessWidget {
  final String label;
  const MoreCircle({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF6C56D9),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// /// Decorative rings resembling the screenshot's 3D donuts
// class RingsArt extends StatelessWidget {
//   final double size;
//   const RingsArt({required this.size, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size + 30,
//       height: size,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: const [
//           Donut(offset: Offset(80, 18), outer: Color(0xFF3C4653), inner: Color(0xFF20242B)),
//           Donut(offset: Offset(40, 6), outer: Color(0xFFD9C8FF), inner: Color(0xFF9E8ED8)),
//           Donut(offset: Offset(128, -2), outer: Color(0xFFFFA300), inner: Color(0xFFDE7F00)),
//           Donut(offset: Offset(114, 54), outer: Color(0xFF6F7A85), inner: Color(0xFF4E565F)),
//           Donut(offset: Offset(144, 74), outer: Color(0xFFFFEB67), inner: Color(0xFFE5C631)),
//         ],
//       ),
//     );
//   }
// }

// class Donut extends StatelessWidget {
//   final Offset offset;
//   final Color outer;
//   final Color inner;
//   const Donut({required this.offset, required this.outer, required this.inner, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: offset.dx,
//       top: offset.dy,
//       child: CustomPaint(
//         painter: DonutPainter(outer, inner),
//         size: const Size(54, 54),
//       ),
//     );
//   }
// }

class DonutPainter extends CustomPainter {
  final Color outer;
  final Color inner;
  DonutPainter(this.outer, this.inner);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final outerPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [outer.withOpacity(0.95), outer.withOpacity(0.6)],
      ).createShader(rect);
    final innerPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [inner.withOpacity(0.95), inner.withOpacity(0.6)],
      ).createShader(rect);

    final center = rect.center;
    final rOuter = size.width * 0.48;
    final rInner = size.width * 0.23;

    // Shadow
    canvas.drawCircle(center.translate(2, 2), rOuter + 2,
        Paint()..color = Colors.black.withOpacity(0.15)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6));

    // Outer ring
    canvas.drawCircle(center, rOuter, outerPaint);

    // Punch hole
    canvas.drawCircle(center, rInner, Paint()..blendMode = BlendMode.clear);

    // Rim
    canvas.saveLayer(rect, Paint());
    canvas.drawCircle(center, rInner, innerPaint..blendMode = BlendMode.srcATop);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant DonutPainter oldDelegate) => false;
}
