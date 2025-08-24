import 'package:flutter/foundation.dart';
import 'package:task_webingo/Screen%201/models/plan_model.dart';
import 'package:task_webingo/Screen%201/services/api_services.dart';

class PlanProvider with ChangeNotifier {
  List<Plan> _plans = [];
  bool _isLoading = false;
  String _errorMessage = '';
  String _selectedDate = '2025-11-25'; // Default to Nov 25, 2025
  Set<String> _datesWithPlans = {}; // Store dates that have plans

  List<Plan> get plans => _plans;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get selectedDate => _selectedDate;
  Set<String> get datesWithPlans => _datesWithPlans;

  PlanProvider() {
    // Fetch plans for default date when provider is created
    fetchPlans(_selectedDate);
  }

  Future<void> updateSelectedDate(String date) async {
    _selectedDate = date;
    await fetchPlans(date);
  }

  Future<void> fetchPlans(String date) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final data = await ApiService.fetchPlans(date);
      final List<dynamic> plansData = data['plans'];
      
      _plans = plansData.map((planJson) => Plan.fromJson(planJson)).toList();
      
      // Update dates with plans
      if (_plans.isNotEmpty) {
        _datesWithPlans.add(date);
      } else {
        _datesWithPlans.remove(date);
      }
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Check if a specific date has plans
  bool hasPlansForDate(String date) {
    return _datesWithPlans.contains(date);
  }

  Plan? getYogaPlan() {
    try {
      return _plans.firstWhere(
        (plan) => plan.title.toLowerCase().contains('yoga'),
      );
    } catch (e) {
      return null;
    }
  }

  Plan? getBalancePlan() {
    try {
      return _plans.firstWhere(
        (plan) => plan.title.toLowerCase().contains('balance'),
      );
    } catch (e) {
      return null;
    }
  }
}