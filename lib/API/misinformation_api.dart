// // class MisinformationAPI {
//   final String baseUrl = 'http://localhost:3000'; // Update with actual API base URL

//   Future<List<Category>> getLevels() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/api/levels'));
// //       if (response.statusCode == 200) {
// //         final List<dynamic> jsonResponse = jsonDecode(response.body);
// //         return jsonResponse.map((json) => Category.fromJson(json)).toList();
// //       } else {
// //         throw Exception('Failed to load levels');
// //       }
// //     } catch (e) {
// //       throw Exception('Failed to load levels: $e');
// //     }
// //   }

// //   Future<List<QuestionModel>> getQuestions(int levelId) async {
// //     try {
// //       final response = await http.get(Uri.parse('$baseUrl/api/level$levelId/questions'));
// //       if (response.statusCode == 200) {
// //         final List<dynamic> jsonResponse = jsonDecode(response.body);
// //         return jsonResponse.map((json) => QuestionModel.fromJson(json)).toList();
// //       } else {
// //         throw Exception('Failed to load questions for level $levelId');
// //       }
// //     } catch (e) {
// //       throw Exception('Failed to load questions for level $levelId: $e');
// //     }
// //   }
// // }
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/category.dart'; // Update the import statement
// import '../models/question_model.dart';

// class MisinformationAPI {
//   final String baseURL = 'http://localhost:3000/api'; // Update with actual API base URL

//   Future<List<DifficultyLevel>> getLevels() async {
//     try {
//       final response = await http.get(Uri.parse('$baseURL/levels'));
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonResponse = jsonDecode(response.body);
//         return jsonResponse.map((json) => DifficultyLevel.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load levels');
//       }
//     } catch (e) {
//       throw Exception('Failed to load levels: $e');
//     }
//   }

//   Future<List<QuestionModel>> getQuestions(int levelId) async {
//     try {
//       final response = await http.get(Uri.parse('$baseURL/level$levelId/questions'));
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonResponse = jsonDecode(response.body);
//         return jsonResponse.map((json) => QuestionModel.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load questions for level $levelId');
//       }
//     } catch (e) {
//       throw Exception('Failed to load questions for level $levelId: $e');
//     }
//   }
// }
