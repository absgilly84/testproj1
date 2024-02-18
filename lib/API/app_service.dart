
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';

// class ApiService {
//   static const String baseUrl = 'http://localhost:3000';

//   Future<List<QuestionModel>> getQuestions(int levelId) async {
//     try {
//       final response = await http.get('$baseUrl/api/questions?levelId=$levelId' as Uri);

//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = jsonDecode(response.body);
//         final List<QuestionModel> questions = responseData
//             .map((json) => QuestionModel.fromJson(json))
//             .toList();
//         return questions;
//       } else {
//         throw Exception('Failed to load questions');
//       }
//     } catch (e) {
//       throw Exception('Failed to load questions: $e');
//     }
//   }

//   Future<List<DifficultyLevel>> getLevels() async {
//     try {
//       final response = await http.get('$baseUrl/api/difficulty-levels' as Uri);

//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = jsonDecode(response.body);
//         final List<DifficultyLevel> levels = responseData
//             .map((json) => DifficultyLevel.fromJson(json))
//             .toList();
//         return levels;
//       } else {
//         throw Exception('Failed to load levels');
//       }
//     } catch (e) {
//       throw Exception('Failed to load levels: $e');
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testproj1/models/category.dart';
import 'package:testproj1/models/question_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  Future<List<QuestionModel>> getQuestions(int levelId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/questions?levelId=$levelId')); // Use Uri.parse()

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<QuestionModel> questions = responseData
            .map((json) => QuestionModel.fromJson(json))
            .toList();
        return questions;
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      throw Exception('Failed to load questions: $e');
    }
  }

  Future<List<DifficultyLevel>> getLevels() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/difficulty-levels')); // Use Uri.parse()

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<DifficultyLevel> levels = responseData
            .map((json) => DifficultyLevel.fromJson(json))
            .toList();
        return levels;
      } else {
        throw Exception('Failed to load levels');
      }
    } catch (e) {
      throw Exception('Failed to load levels: $e');
    }
  }
}
