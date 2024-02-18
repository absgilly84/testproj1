import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:testproj1/models/question_model.dart'; // Update with your actual model import
import 'package:testproj1/models/category.dart'; // Update with your actual model import

class MisinformationAPI {
  final String baseUrl = 'https://your-misinformation-api.com'; // Replace with your actual API base URL

  Future<bool> getLevels(StreamedList<Category> levels) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/levels')); // Replace 'levels' with your actual API endpoint for levels
      final jsonResponse = jsonDecode(response.body);

      final result = (jsonResponse['difficultyLevels'] as List)
          .map((level) => Category.fromJson(level)) // Use the appropriate class, Category or DifficultyLevel
          .toList();

      levels.value = result;
      return true;
    } catch (e) {
      print('Error getting levels: $e');
      return false;
    }
  }

  Future<bool> getQuestions(List<Question> questions, Category selectedLevel) async {
    try {
      String questionType;

      // Determine the question type based on the selected level
      if (selectedLevel.id == 1 || selectedLevel.id == 2) {
        questionType = 'image'; // Use 'image' for the first two levels
      } else if (selectedLevel.id == 3) {
        questionType = 'video'; // Use 'video' for the third level
      } else {
        // Handle other levels if needed
        // questionType = '...';
      }

      final response = await http.get(Uri.parse('$baseUrl/questions?amount=5&difficulty=medium&type=$questionType')); // Replace 'questions' with your actual API endpoint for questions
      final jsonResponse = jsonDecode(response.body);

      final result = (jsonResponse['results'] as List)
          .map((question) => QuestionModel.fromJson(question))
          .toList();

      questions.value = result.map((question) => Question.fromQuestionModel(question, selectedLevel.id)).toList();
      return true;
    } catch (e) {
      print('Error getting questions: $e');
      return false;
    }
  }
}
