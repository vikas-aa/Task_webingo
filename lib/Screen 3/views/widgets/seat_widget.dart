import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({super.key, required this.size, required this.color, required this.onTap});
  final double size;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: size,
        height: size,
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            if (color.value != const Color(0xFFD8D3C9).value)
              BoxShadow(
                color: color.withOpacity(0.28),
                blurRadius: 8,
                spreadRadius: 0,
              ),
          ],
        ),
      ),
    );
  }
}