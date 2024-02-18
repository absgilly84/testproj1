// lass TriviaAPI implements QuestionsAPI {
//   @override
//   Future<bool> getCategories(StreamedList<Category> categories) async {
//     const categoriesURL = 'https://opentdb.com/api_category.php';
//     final response = await http.get(categoriesURL);

//     if (response.statusCode == 200) {
//       final jsonResponse = convert.jsonDecode(response.body);
//       final result = (jsonResponse['trivia_categories'] as List)
//           .map((category) => Category.fromJson(category));

//       categories.value = [];
//       categories
//         ..addAll(result)
//         ..addElement(Category(id: 0, name: 'Any category'));
//       return true;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       return false;
//     }
//   }

//   @override
//   Future<bool> getQuestions(
//       {StreamedList<Question> questions,
//       int number,
//       Category category,
//       QuestionDifficulty difficulty,
//       QuestionType type}) async {
//     var qdifficulty;
//     var qtype;
//     switch (difficulty) {
//       case QuestionDifficulty.easy:
//         qdifficulty = 'easy';
//         break;
//       case QuestionDifficulty.medium:
//         qdifficulty = 'medium';
//         break;
//       case QuestionDifficulty.hard:
//         qdifficulty = 'hard';
//         break;
//       default:
//         qdifficulty = 'medium';
//         break;
//     }

//     switch (type) {
//       case QuestionType.boolean:
//         qtype = 'boolean';
//         break;
//       case QuestionType.multiple:
//         qtype = 'multiple';
//         break;
//       default:
//       qtype = 'multiple';
//         break;
//     }

//     final url =
//         'https://opentdb.com/api.php?amount=$number&difficulty=$qdifficulty&type=$qtype&category=${category.id}';

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final jsonResponse = convert.jsonDecode(response.body);
//       final result = (jsonResponse['results'] as List)
//           .map((question) => QuestionModel.fromJson(question));

//       questions.value = result
//           .map((question) => Question.fromQuestionModel(question))
//           .toList();

//       return true;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       return false;
//     }
//   }
// }
class MisinformationAPI implements QuestionsAPI {
  @override
  Future<bool> getCategories(StreamedList<Category> categories) async {
    // Adjust the URL to a relevant source for misinformation categories
    const categoriesURL = 'https://your-misinformation-api.com/categories';
    final response = await http.get(categoriesURL);

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      final result = (jsonResponse['categories'] as List)
          .map((category) => Category.fromJson(category));

      categories.value = [];
      categories
        ..addAll(result)
        ..addElement(Category(id: 0, name: 'Any category'));
      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  }

  @override
  Future<bool> getQuestions({
    StreamedList<Question> questions,
    int number,
    Category category,
    QuestionDifficulty difficulty,
    QuestionType type,
  }) async {
    var qdifficulty;
    var qtype;
    switch (difficulty) {
      case QuestionDifficulty.easy:
        qdifficulty = 'easy';
        break;
      case QuestionDifficulty.medium:
        qdifficulty = 'medium';
        break;
      case QuestionDifficulty.hard:
        qdifficulty = 'hard';
        break;
      default:
        qdifficulty = 'medium';
        break;
    }

    switch (type) {
      case QuestionType.boolean:
        qtype = 'boolean';
        break;
      case QuestionType.multiple:
        qtype = 'multiple';
        break;
      default:
        qtype = 'multiple';
        break;
    }

    // Adjust the URL to a relevant source for misinformation questions
    final url =
        'https://your-misinformation-api.com/questions?amount=$number&difficulty=$qdifficulty&type=$qtype&category=${category.id}';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      final result = (jsonResponse['questions'] as List)
          .map((question) => QuestionModel.fromJson(question));

      questions.value = result
          .map((question) => Question.fromQuestionModel(question))
          .toList();

      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_project_name/models/question_model.dart';
import 'package:your_project_name/models/category.dart'; // Import your Category class here

class TriviaApi implements QuestionsApi {
  final String baseUrl = 'https://your-api-base-url.com'; // Replace with your actual API base URL

  @override
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

  @override
  Future<bool> getQuestions(StreamedList<Question> questions, Category selectedLevel) async {
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
