import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlassBlackBottomBar extends StatelessWidget {
  const GlassBlackBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.extraBottomPadding = 0,
    this.showHomeIndicator = false,
  });

  final List<BottomItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final double extraBottomPadding;
  final bool showHomeIndicator;

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.of(context).padding.bottom;
    final totalBottomPad = 16 + pad * 0.3;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                height: 56 + extraBottomPadding,
                padding: EdgeInsets.fromLTRB(12, 8, 12, totalBottomPad - 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(0.75),
                      Colors.black.withOpacity(0.75),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20,
                      offset: Offset(0, -4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: List.generate(items.length, (i) {
                    final selected = i == currentIndex;
                    return Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onTap(i),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              items[i].icon,
                              size: 22,
                              color: selected
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                              shadows: selected
                                  ? [
                                      const Shadow(
                                        color: Colors.white24,
                                        blurRadius: 4,
                                      )
                                    ]
                                  : null,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              items[i].label,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                color: selected
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                shadows: selected
                                    ? [
                                        const Shadow(
                                          color: Colors.white24,
                                          blurRadius: 2,
                                        )
                                      ]
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
        if (showHomeIndicator)
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 8 + pad * 0.2, top: 6),
            child: Container(
              width: 120,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
      ],
    );
  }
}

class BottomItem {
  final IconData icon;
  final String label;
  const BottomItem({required this.icon, required this.label});
}
