import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://fitness.wigian.in/';
  
  static Future<Map<String, dynamic>> fetchPlans(String date) async {
    print('API Call for date: $date');
    
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}user_plan_api.php?date=$date'),
        headers: {'Accept': 'application/json'},
      ).timeout(const Duration(seconds: 10));
      
      print('API Response status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        
        // Check if the response has the expected structure
        if (decodedResponse is Map<String, dynamic> && decodedResponse.containsKey('plans')) {
          return decodedResponse;
        } else {
          // Return empty plans if response structure is unexpected
          return {'plans': []};
        }
      } else {
        // Return empty plans for non-200 status codes
        return {'plans': []};
      }
    } catch (e) {
      print('API Error: $e');
      // Return empty plans on any error
      return {'plans': []};
    }
  }
}