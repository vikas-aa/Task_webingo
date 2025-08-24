import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_webingo/Screen%201/view_models/plan_view_model.dart';
import 'package:task_webingo/Screen%201/widgets/bottom_nav.dart';
import 'package:task_webingo/Screen%201/widgets/calender_widget.dart';
import 'package:task_webingo/Screen%201/widgets/challenge_card.dart';
import 'package:task_webingo/Screen%201/widgets/plan_card.dart';
import 'package:task_webingo/Screen%201/widgets/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Pre-fetch plans for nearby dates to show dots in calendar
    _prefetchNearbyDates();
  }

  void _prefetchNearbyDates() {
    final planProvider = Provider.of<PlanProvider>(context, listen: false);
    final startDate = DateTime(2025, 11, 25);
    
    // Pre-fetch plans for nearby dates (-4 to +4 days from Nov 25)
    for (int i = -4; i <= 4; i++) {
      final date = startDate.add(Duration(days: i));
      final formattedDate = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      
      if (formattedDate != planProvider.selectedDate) {
        planProvider.fetchPlans(formattedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final isCompact = width < 360;
    final planProvider = Provider.of<PlanProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 6),
            const TopBar(),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChallengeCard(isCompact: isCompact),
                    const SizedBox(height: 18),
                    CalendarWidget(
                      onDateSelected: (newDate) {
                        planProvider.updateSelectedDate(newDate);
                      },
                      selectedDate: planProvider.selectedDate,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your plan',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.3,
                        color: const Color(0xFF0E0E12),
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    // Show loading, error, or plans
                    if (planProvider.isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (planProvider.errorMessage.isNotEmpty)
                      Text('Error: ${planProvider.errorMessage}')
                    else if (planProvider.plans.isEmpty)
                      _buildNoPlansWidget()
                    else
                      _buildPlanCards(planProvider),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }

  Widget _buildNoPlansWidget() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F9),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 40,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 12),
            Text(
              'No plans for this date',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try selecting another date',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCards(PlanProvider planProvider) {
    final yogaPlan = planProvider.getYogaPlan();
    final balancePlan = planProvider.getBalancePlan();
    
    // If we have both plans, show them in two columns
    if (yogaPlan != null && balancePlan != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PlanCardYoga(plan: yogaPlan),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: PlanCardBalance(plan: balancePlan),
          ),
        ],
      );
    } 
    // If we have only one plan, show it full width
    else if (yogaPlan != null) {
      return PlanCardYoga(plan: yogaPlan);
    }
    else if (balancePlan != null) {
      return PlanCardBalance(plan: balancePlan);
    }
    // No matching plans but we have some plans
    else if (planProvider.plans.isNotEmpty) {
      // Show the first plan in a generic card
      return planProvider.plans[0].title.toLowerCase().contains('yoga')
          ? PlanCardYoga(plan: planProvider.plans[0])
          : PlanCardBalance(plan: planProvider.plans[0]);
    }
    // No plans at all (shouldn't reach here because of the check above)
    else {
      return _buildNoPlansWidget();
    }
  }
}