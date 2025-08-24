import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 👇 left-right margin ko adjust kiya aur thoda compact kiya
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      // 👇 padding bhi thoda kam kiya taki black background chhota lage
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E12),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          NavItem(
            icon: Icons.home_rounded,
            selected: true,
          ),
          NavItem(icon: Icons.grid_view_rounded),
          NavItem(icon: Icons.bar_chart_rounded),
          NavItem(icon: Icons.person_rounded),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  const NavItem({required this.icon, this.selected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: selected ? 54 : 44,  // selected hone par thoda bada
      height: selected ? 54 : 44,
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: selected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Icon(
        icon,
        color:
            selected ? const Color(0xFF0E0E12) : Colors.white.withOpacity(0.7),
        size: selected ? 25 : 24, // selected hone par icon bhi thoda bada
      ),
    );
  }
}
