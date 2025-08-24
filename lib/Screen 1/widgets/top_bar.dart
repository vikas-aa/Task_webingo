import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current date and format it
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('dd MMM.').format(currentDate);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // Avatar with random image
          const Avatar(),
          const SizedBox(width: 12),

          // Center text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello, Sandra',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0E0E12),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Today $formattedDate',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400, // not bold
                    color: const Color(0xFF6D6B7A),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Simple search icon (no circle background)
          const Icon(
            Icons.search_rounded,
            color: Colors.black,
            size: 26,
          ),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        "https://randomuser.me/api/portraits/women/44.jpg", // random girl image
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: const Icon(Icons.person, color: Colors.grey),
          );
        },
      ),
    );
  }
}