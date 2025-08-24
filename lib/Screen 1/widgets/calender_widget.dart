import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_webingo/Screen%201/view_models/plan_view_model.dart';


class CalendarWidget extends StatelessWidget {
  final Function(String) onDateSelected;
  final String selectedDate;
  
  const CalendarWidget({
    super.key, 
    required this.onDateSelected,
    required this.selectedDate
  });

  @override
  Widget build(BuildContext context) {
    final planProvider = Provider.of<PlanProvider>(context);
    
    // Start from November 25, 2025 instead of current date
    final startDate = DateTime(2025, 11, 25);
    final items = List.generate(9, (index) {
      final currentDate = startDate.add(Duration(days: index - 4)); // Show 4 days before and 4 days after Nov 25
      final isSelected = _isSameDate(DateTime.parse(selectedDate), currentDate);
      
      // Check if this date has plans
      final formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      final hasPlans = planProvider.hasPlansForDate(formattedDate);
      
      return DayPill(
        DateFormat('E').format(currentDate), 
        DateFormat('dd').format(currentDate), 
        isSelected, 
        hasPlans,
        dateTime: currentDate,
        onTap: () {
          final formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
          onDateSelected(formattedDate);
        },
      );
    });

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        itemBuilder: (context, index) => items[index],
      ),
    );
  }
  
  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }
}

class DayPill extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;
  final bool hasDot;
  final DateTime? dateTime;
  final VoidCallback? onTap;
  
  const DayPill(this.day, this.date, this.selected, this.hasDot, {
    super.key, 
    this.dateTime,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final bg = selected ? const Color(0xFF0E0E12) : Colors.white;
    final fg = selected ? Colors.white : const Color(0xFF0E0E12);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(
            color: const Color(0xFF0E0E12).withOpacity(0.1),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: fg.withOpacity(selected ? 0.9 : 0.7),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: fg,
                    height: 1.0,
                  ),
                ),
              ],
            ),
            if (hasDot)
              Positioned(
                top: 8,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: selected ? Colors.white : const Color(0xFF0E0E12),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}