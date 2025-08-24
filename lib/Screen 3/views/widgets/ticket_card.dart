import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.price,
    required this.time,
    required this.date,
    required this.cinema,
    required this.seats,
    required this.row,
    required this.onBuy,
  });

  final String price, time, date, cinema, seats, row;
  final VoidCallback onBuy;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          decoration: BoxDecoration(
            color: const Color(0xFF0E0E0E),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.place_rounded, color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      cinema,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _InfoTile(title: 'Date', value: date),
                    const SizedBox(width: 12),
                    _HourTile(time: time),
                    const SizedBox(width: 12),
                    _InfoTile(title: 'Seats', value: seats),
                    const SizedBox(width: 12),
                    _InfoTile(title: 'Row', value: row),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price',
                          style: GoogleFonts.inter(
                            color: Colors.white70,
                            fontSize: 12,
                          )),
                      const SizedBox(height: 4),
                      Text(
                        price,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  _buyButton(onBuy),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _InfoTile({required String title, required String value}) {
    return Container(
      width: 72,
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.00),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              )),
          const Spacer(),
          Text(title,
              style: GoogleFonts.inter(
                color: Colors.white70,
                fontSize: 12,
              )),
        ],
      ),
    );
  }

  Widget _HourTile({required String time}) {
    return Container(
      width: 72,
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              )),
          const Spacer(),
          Text('Hour',
              style: GoogleFonts.inter(
                color: Colors.white70,
                fontSize: 12,
              )),
        ],
      ),
    );
  }

  Widget _buyButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF9C7BFF),
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              color: Color(0x559C7BFF),
              blurRadius: 16,
              offset: Offset(0, 6),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          'Buy',
          style: GoogleFonts.inter(
            color: const Color(0xFF1A1A1A),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}