import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task_webingo/Screen%201/models/plan_model.dart';

class PlanCardYoga extends StatelessWidget {
  final Plan plan;
  
  const PlanCardYoga({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    // Format date for display
    final displayDate = _formatDate(plan.date);
    
    return Container(
      height: 230,
      decoration: BoxDecoration(
        color: const Color(0xFFFFC764),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(label: plan.level, color: const Color(0xFFF9E3B7)),
                const SizedBox(height: 10),
                Text(
                  plan.title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF0E0E12),
                  ),
                ),
                const SizedBox(height: 10),
                InfoLine(icon: Icons.calendar_today_rounded, text: displayDate),
                const SizedBox(height: 6),
                InfoLine(icon: Icons.access_time_filled_rounded, text: plan.time),
                const SizedBox(height: 6),
                InfoLine(icon: Icons.room_rounded, text: '${plan.room} room'),
                const Spacer(),
                // Trainer section with random image and two rows
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Trainer section row inside PlanCardYoga
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // First column: random avatar
                        RandomImageAvatar(size: 30),

                        const SizedBox(width: 6),

                        // Second column: Trainer info
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Trainer',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF694C1E),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              plan.trainer,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF0E0E12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ])
              ])
          ),
        ],
      ),
    );
  }
  
  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd MMM.').format(date);
    } catch (e) {
      return dateString;
    }
  }
}

class PlanCardBalance extends StatelessWidget {
  final Plan plan;
  
  const PlanCardBalance({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    // Format date for display
    final displayDate = _formatDate(plan.date);
    
    return Column(
      children: [
        Container(
          height: 155, // Reduced height since social icons are now outside
          decoration: BoxDecoration(
            color: const Color(0xFFD5E6FF),
            borderRadius: BorderRadius.circular(26),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -18,
                bottom: -10,
                child: PebblesArt(
                  main: const Color(0xFFCDE6FF),
                  dark: const Color(0xFF5A6F8A),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(label: plan.level, color: const Color(0xFFE7F1FF)),
                    const SizedBox(height: 6),
                    Text(
                      plan.title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0E0E12),
                      ),
                    ),
                    const SizedBox(height: 3),
                    InfoLine(icon: Icons.calendar_today_rounded, text: displayDate),
                    const SizedBox(height: 2),
                    InfoLine(icon: Icons.access_time_filled_rounded, text: plan.time),
                    const SizedBox(height: 2),
                    InfoLine(icon: Icons.room_rounded, text: '${plan.room} room'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Social icons container now placed below the card
      // Replace the social icons section in PlanCardBalance with:
Container(
   width: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
  decoration: BoxDecoration(
    color: const Color(0xFFF1C1F0),
    borderRadius: BorderRadius.circular(18),
  ),
  child: Row(
     mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: const [
      SocialIcon(platform: 'instagram'),
      SizedBox(width: 10),
      SocialIcon(platform: 'youtube'),
      SizedBox(width: 10),
      SocialIcon(platform: 'twitter'),
    ],
  ),
),
      ],
    );
  }
  
  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd MMM.').format(date);
    } catch (e) {
      return dateString;
    }
  }
}

class RandomImageAvatar extends StatelessWidget {
  final double size;
  
  const RandomImageAvatar({super.key, required this.size});
  
  @override
  Widget build(BuildContext context) {
    // List of random avatar URLs
    final List<String> randomAvatars = [
      'https://randomuser.me/api/portraits/women/32.jpg',
      'https://randomuser.me/api/portraits/women/44.jpg',
      'https://randomuser.me/api/portraits/men/32.jpg',
      'https://randomuser.me/api/portraits/women/65.jpg',
      'https://randomuser.me/api/portraits/men/22.jpg',
    ];
    
    final random = Random();
    final avatarUrl = randomAvatars[random.nextInt(randomAvatars.length)];
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.network(
          avatarUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFFF9E3B7),
              child: Icon(
                Icons.person,
                size: size * 0.6,
                color: const Color(0xFF694C1E),
              ),
            );
          },
        ),
      ),
    );
  }
}

class InfoLine extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoLine({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF0E0E12).withOpacity(0.8)),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF0E0E12),
          ),
        ),
      ],
    );
  }
}

class Chip extends StatelessWidget {
  final String label;
  final Color color;
  const Chip({required this.label, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShapeDecoration(
        color: color,
        shape: const StadiumBorder(),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF0E0E12),
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String platform; // 'instagram', 'youtube', or 'twitter'
  const SocialIcon({required this.platform, super.key});

  @override
  Widget build(BuildContext context) {
    // Custom colored SVG icons in pink color (matching the container)
    final iconSvgs = {
      'instagram': '''
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M12 16C14.2091 16 16 14.2091 16 12C16 9.79086 14.2091 8 12 8C9.79086 8 8 9.79086 8 12C8 14.2091 9.79086 16 12 16Z" stroke="#F1C1F0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M17 3H7C4.79086 3 3 4.79086 3 7V17C3 19.2091 4.79086 21 7 21H17C19.2091 21 21 19.2091 21 17V7C21 4.79086 19.2091 3 17 3Z" stroke="#F1C1F0" stroke-width="2"/>
          <path d="M16.5 7.5V7.501" stroke="#F1C1F0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      ''',
      'youtube': '''
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M22.54 6.42C22.4212 5.94541 22.1793 5.51057 21.8387 5.15941C21.498 4.80824 21.0708 4.55318 20.6 4.42C18.88 4 12 4 12 4C12 4 5.12 4 3.4 4.42C2.92925 4.55318 2.50196 4.80824 2.16135 5.15941C1.82074 5.51057 1.57875 5.94541 1.46 6.42C1.14521 8.09656 0.991436 9.79987 1 11.51C0.991436 13.2101 1.14521 14.9034 1.46 16.58C1.57875 17.0546 1.82074 17.4894 2.16135 17.8406C2.50196 18.1918 2.92925 18.4468 3.4 18.58C5.12 19 12 19 12 19C12 19 18.88 19 20.6 18.58C21.0708 18.4468 21.498 18.1918 21.8387 17.8406C22.1793 17.4894 22.4212 17.0546 22.54 16.58C22.8548 14.9034 23.0086 13.2101 23 11.51C23.0086 9.79987 22.8548 8.09656 22.54 6.42Z" stroke="#F1C1F0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M9.75 15.02L15.5 11.51L9.75 8V15.02Z" stroke="#F1C1F0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      ''',
      'twitter': '''
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M23 3.00005C22.0424 3.67552 20.9821 4.19216 19.86 4.53005C19.2577 3.83756 18.4573 3.34674 17.567 3.12397C16.6767 2.90121 15.7395 2.95724 14.8821 3.2845C14.0247 3.61176 13.2884 4.19445 12.773 4.95376C12.2575 5.71308 11.9877 6.61238 12 7.53005V8.53005C10.2426 8.57561 8.50127 8.18586 6.93101 7.39549C5.36074 6.60513 4.01032 5.43868 3 4.00005C3 4.00005 -1 13 8 17C5.94053 18.398 3.48716 19.099 1 19C10 24 21 19 21 7.50005C20.9991 7.2215 20.9723 6.94364 20.92 6.67005C21.9406 5.66354 22.6608 4.39276 23 3.00005Z" stroke="#F1C1F0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      ''',
    };

    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 6,
            offset: const Offset(0, 3),
            spreadRadius: 4,
          ),
          BoxShadow(
            color: const Color(0xFFF1C1F0).withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.string(
          iconSvgs[platform]!,
          width: 18,
          height: 18,
        ),
      ),
    );
  }
}

/// Decorative pebble-like spheres on plan cards
class PebblesArt extends StatelessWidget {
  final Color main;
  final Color dark;
  const PebblesArt({required this.main, required this.dark, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 150,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Sphere(offset: const Offset(20, 40), size: 64, color: main),
          Sphere(offset: const Offset(70, 72), size: 36, color: dark),
          Sphere(offset: const Offset(110, 58), size: 44, color: main.withOpacity(0.9)),
        ],
      ),
    );
  }
}

class Sphere extends StatelessWidget {
  final Offset offset;
  final double size;
  final Color color;
  const Sphere({required this.offset, required this.size, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            center: const Alignment(-0.3, -0.4),
            radius: 0.9,
            colors: [
              Colors.white.withOpacity(0.9),
              color,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 14,
              offset: const Offset(4, 8),
            ),
          ],
        ),
      ),
    );
  }
}