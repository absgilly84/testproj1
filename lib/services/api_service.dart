import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testproj1/models/models.dart'; // Update with your actual import

class ApiService {
  static const String baseUrl = 'http://localhost:3000'; // Update with your API URL

  Future<List<DifficultyLevel>> getDifficultyLevels() async {
    try {
      final response = await http.get('$baseUrl/difficulty-levels');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> difficultyLevelsData = data['difficultyLevels'];

        final List<DifficultyLevel> difficultyLevels = difficultyLevelsData
            .map((json) => DifficultyLevel.fromJson(json))
            .toList();

        return difficultyLevels;
      } else {
        throw Exception('Failed to load difficulty levels. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions appropriately
      throw Exception('Failed to load difficulty levels. Error: $e');
    }
  }

  // Add more API methods for fetching questions, submitting answers, etc.
}
