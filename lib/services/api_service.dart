// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // // import 'package:testproj1/models/models.dart'; // Update with your actual import

// // // class ApiService {
// // //   static const String baseUrl = 'http://localhost:3000'; // Update with your API URL

// // //   Future<List<DifficultyLevel>> getDifficultyLevels() async {
// // //     try {
// // //       final response = await http.get('$baseUrl/difficulty-levels');

// // //       if (response.statusCode == 200) {
// // //         final Map<String, dynamic> data = jsonDecode(response.body);
// // //         final List<dynamic> difficultyLevelsData = data['difficultyLevels'];

// // //         final List<DifficultyLevel> difficultyLevels = difficultyLevelsData
// // //             .map((json) => DifficultyLevel.fromJson(json))
// // //             .toList();

// // //         return difficultyLevels;
// // //       } else {
// // //         throw Exception('Failed to load difficulty levels. Status code: ${response.statusCode}');
// // //       }
// // //     } catch (e) {
// // //       // Handle exceptions appropriately
// // //       throw Exception('Failed to load difficulty levels. Error: $e');
// // //     }
// // //   }

// // //   // Add more API methods for fetching questions, submitting answers, etc.
// // // }
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'package:testproj1/models/category.dart'; 

// // class ApiService {
// //   // Base URL for the API
// //   static const String baseUrl = 'http://localhost:3000';

// //   // Method to get questions for a specific level from the API
// //   Future<List<Question>> getQuestionsForLevel(int level) async {
// //     try {
// //       // Make an HTTP GET request to the API endpoint for questions of the specified level
// //       final response = await http.get('$baseUrl/api/level$level/questions');

// //       // Check if the response status code is OK
// //       if (response.statusCode == 200) {
// //         // Parse the JSON response
// //         final List<dynamic> responseData = jsonDecode(response.body);
        
// //         // Convert the JSON data into a list of Question objects
// //         final List<Question> questions = responseData
// //             .map((json) => Question.fromJson(json))
// //             .toList();

// //         // Return the list of questions
// //         return questions;
// //       } else {
// //         // Throw an exception if the HTTP request fails
// //         throw Exception('Failed to load questions for level $level. Status code: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       // Handle exceptions and throw a custom exception with an error message
// //       throw Exception('Failed to load questions for level $level. Error: $e');
// //     }
// //   }

// //   // Method to compare images for level 1 and level 2 questions
// //   Future<bool> compareImages(int level, int questionId, String selectedImage) async {
// //     try {
// //       // Make an HTTP POST request to the API endpoint for comparing images
// //       final response = await http.post(
// //         '$baseUrl/api/compareImages',
// //         headers: {'Content-Type': 'application/json'},
// //         body: jsonEncode({'questionId': questionId, 'selectedImage': selectedImage}),
// //       );

// //       // Check if the response status code is OK
// //       if (response.statusCode == 200) {
// //         // Parse the JSON response
// //         final Map<String, dynamic> responseData = jsonDecode(response.body);
        
// //         // Extract the result from the response
// //         final bool isCorrect = responseData['isCorrect'];

// //         // Return whether the answer is correct or not
// //         return isCorrect;
// //       } else {
// //         // Throw an exception if the HTTP request fails
// //         throw Exception('Failed to compare images for question $questionId. Status code: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       // Handle exceptions and throw a custom exception with an error message
// //       throw Exception('Failed to compare images for question $questionId. Error: $e');
// //     }
// //   }

// //   // Method to compare videos for level 3 questions
// //   Future<bool> compareVideos(int questionId, bool selectedIsMisinformation) async {
// //     try {
// //       // Make an HTTP POST request to the API endpoint for comparing videos
// //       final response = await http.post(
// //         '$baseUrl/api/compareVideos',
// //         headers: {'Content-Type': 'application/json'},
// //         body: jsonEncode({'questionId': questionId, 'selectedIsMisinformation': selectedIsMisinformation}),
// //       );

// //       // Check if the response status code is OK
// //       if (response.statusCode == 200) {
// //         // Parse the JSON response
// //         final Map<String, dynamic> responseData = jsonDecode(response.body);
        
// //         // Extract the result from the response
// //         final bool isCorrect = responseData['isCorrect'];

// //         // Return whether the answer is correct or not
// //         return isCorrect;
// //       } else {
// //         // Throw an exception if the HTTP request fails
// //         throw Exception('Failed to compare videos for question $questionId. Status code: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       // Handle exceptions and throw a custom exception with an error message
// //       throw Exception('Failed to compare videos for question $questionId. Error: $e');
// //     }
// //   }

// //   // Add more API methods for submitting answers, fetching difficulty levels, etc.
// // }
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:testproj1/models/category.dart'; 

// class ApiService {
//   // Base URL for the API
//   static const String baseUrl = 'http://localhost:3000';

//   // Method to get questions for a specific level from the API
//   Future<List<Question>> getQuestionsForLevel(int level) async {
//     try {
//       // Make an HTTP GET request to the API endpoint for questions of the specified level
//       final response = await http.get('$baseUrl/api/level$level/questions');

//       // Check if the response status code is OK
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final List<dynamic> responseData = jsonDecode(response.body);
        
//         // Convert the JSON data into a list of Question objects
//         final List<Question> questions = responseData
//             .map((json) => Question.fromJson(json))
//             .toList();

//         // Return the list of questions
//         return questions;
//       } else {
//         // Throw an exception if the HTTP request fails
//         throw Exception('Failed to load questions for level $level. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and throw a custom exception with an error message
//       throw Exception('Failed to load questions for level $level. Error: $e');
//     }
//   }

//   // Method to compare images for level 1 and level 2 questions
//   Future<bool> compareImages(int level, int questionId, String selectedImage) async {
//     try {
//       // Make an HTTP POST request to the API endpoint for comparing images
//       final response = await http.post(
//         '$baseUrl/api/compareImages',
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'questionId': questionId, 'selectedImage': selectedImage}),
//       );

//       // Check if the response status code is OK
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
        
//         // Extract the result from the response
//         final bool isCorrect = responseData['isCorrect'];

//         // Return whether the answer is correct or not
//         return isCorrect;
//       } else {
//         // Throw an exception if the HTTP request fails
//         throw Exception('Failed to compare images for question $questionId. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and throw a custom exception with an error message
//       throw Exception('Failed to compare images for question $questionId. Error: $e');
//     }
//   }

//   // Method to compare videos for level 3 questions
//   Future<bool> compareVideos(int questionId, bool selectedIsMisinformation) async {
//     try {
//       // Make an HTTP POST request to the API endpoint for comparing videos
//       final response = await http.post(
//         '$baseUrl/api/compareVideos',
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'questionId': questionId, 'selectedIsMisinformation': selectedIsMisinformation}),
//       );

//       // Check if the response status code is OK
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
        
//         // Extract the result from the response
//         final bool isCorrect = responseData['isCorrect'];

//         // Return whether the answer is correct or not
//         return isCorrect;
//       } else {
//         // Throw an exception if the HTTP request fails
//         throw Exception('Failed to compare videos for question $questionId. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and throw a custom exception with an error message
//       throw Exception('Failed to compare videos for question $questionId. Error: $e');
//     }
//   }

//   // Add more API methods for submitting answers, fetching difficulty levels, etc.
// }
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:testproj1/models/category.dart'; 
// import 'package:testproj1/models/question_model.dart'; // Import the QuestionModel class

// class ApiService {
//   // Base URL for the API
//   static const String baseUrl = 'http://localhost:3000';

//   // Method to get questions for a specific level from the API
//   Future<List<QuestionModel>> getQuestionsForLevel(int level) async {
//     try {
//       // Make an HTTP GET request to the API endpoint for questions of the specified level
//       final response = await http.get('$baseUrl/api/level$level/questions');

//       // Check if the response status code is OK
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final List<dynamic> responseData = jsonDecode(response.body);
        
//         // Convert the JSON data into a list of QuestionModel objects
//         final List<QuestionModel> questions = responseData
//             .map((json) => QuestionModel.fromJson(json))
//             .toList();

//         // Return the list of questions
//         return questions;
//       } else {
//         // Throw an exception if the HTTP request fails
//         throw Exception('Failed to load questions for level $level. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and throw a custom exception with an error message
//       throw Exception('Failed to load questions for level $level. Error: $e');
//     }
//   }

//   // Method to compare images for level 1 and level 2 questions
//   Future<bool> compareImages(int level, int questionId, String selectedImage) async {
//     try {
//       // Make an HTTP POST request to the API endpoint for comparing images
//       final response = await http.post(
//         '$baseUrl/api/compareImages',
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'questionId': questionId, 'selectedImage': selectedImage}),
//       );

//       // Check if the response status code is OK
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
        
//         // Extract the result from the response
//         final bool isCorrect = responseData['isCorrect'];

//         // Return whether the answer is correct or not
//         return isCorrect;
//       } else {
//         // Throw an exception if the HTTP request fails
//         throw Exception('Failed to compare images for question $questionId. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and throw a custom exception with an error message
//       throw Exception('Failed to compare images for question $questionId. Error: $e');
//     }
//   }

//   // Method to compare videos for level 3 questions
//   Future<bool> compareVideos(int questionId, bool selectedIsMisinformation) async {
//     try {
//       // Make an HTTP POST request to the API endpoint for comparing videos
//       final response = await http.post(
//         '$baseUrl/api/compareVideos',
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'questionId': questionId, 'selectedIsMisinformation': selectedIsMisinformation}),
//       );

//       // Check if the response status code is OK
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
        
//         // Extract the result from the response
//         final bool isCorrect = responseData['isCorrect'];

//         // Return whether the answer is correct or not
//         return isCorrect;
//       } else {
//         // Throw an exception if the HTTP request fails
//         throw Exception('Failed to compare videos for question $questionId. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and throw a custom exception with an error message
//       throw Exception('Failed to compare videos for question $questionId. Error: $e');
//     }
//   }

//   // Add more API methods for submitting answers, fetching difficulty levels, etc.
// }
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart'; // Import the QuestionModel class

// class ApiService {
//   // Base URL for the API
//   static const String baseUrl = 'http://localhost:3000';

//   // Method to get questions for a specific level from the API
//   Future<List<QuestionModel>> getQuestionsForLevel(int level) async {
//     try {
//       // Make an HTTP GET request to the API endpoint for questions of the specified level
//       final response = await http.get('$baseUrl/api/level$level/questions' as Uri);

//       // Check if the response status code is OK
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final List<dynamic> responseData = jsonDecode(response.body);

//         // Convert the JSON data into a list of QuestionModel objects
//         final List<QuestionModel> questions = responseData
//             .map((json) => QuestionModel.fromJson(json))
//             .toList();

//         // Return the list of questions
//         return questions;
//       } else {
//         // Throw an exception if the HTTP request fails
//         throw Exception('Failed to load questions for level $level. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and throw a custom exception with an error message
//       throw Exception('Failed to load questions for level $level. Error: $e');
//     }
//   }

//   // Method to compare images for level 1 and level 2 questions
//   Future<bool> compareImages(int level, int questionId, String selectedImage) async {
//     try {
//       // Make an HTTP POST request to the API endpoint for comparing images
//       final response = await http.post(
//         '$baseUrl/api/compareImages' as Uri,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'questionId': questionId, 'selectedImage': selectedImage}),
//       );

//       // Check if the response status code is OK
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final Map<String, dynamic> responseData = jsonDecode(response.body);

//         // Extract the result from the response
//         final bool isCorrect = responseData['isCorrect'];

//         // Return whether the answer is correct or not
//         return isCorrect;
//       } else {
//         // Throw an exception if the HTTP request fails
//         throw Exception('Failed to compare images for question $questionId. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and throw a custom exception with an error message
//       throw Exception('Failed to compare images for question $questionId. Error: $e');
//     }
//   }

//   // Method to compare videos for level 3 questions
//   Future<bool> compareVideos(int questionId, bool selectedIsMisinformation) async {
//     try {
//       // Make an HTTP POST request to the API endpoint for comparing videos
//       final response = await http.post(
//         '$baseUrl/api/compareVideos' as Uri,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'questionId': questionId, 'selectedIsMisinformation': selectedIsMisinformation}),
//       );

//       // Check if the response status code is OK
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final Map<String, dynamic> responseData = jsonDecode(response.body);

//         // Extract the result from the response
//         final bool isCorrect = responseData['isCorrect'];

//         // Return whether the answer is correct or not
//         return isCorrect;
//       } else {
//         // Throw an exception if the HTTP request fails
//         throw Exception('Failed to compare videos for question $questionId. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and throw a custom exception with an error message
//       throw Exception('Failed to compare videos for question $questionId. Error: $e');
//     }
//   }

//   // Add more API methods for submitting answers, fetching difficulty levels, etc.
// }

// // Define the QuestionsAPI class
// class QuestionsAPI {
//   final ApiService _apiService = ApiService(); // Create an instance of ApiService

//   Future<bool> getQuestions(StreamedList<QuestionModel> questions, int levelId) async {
//     // Call the ApiService method to get questions
//     try {
//       final List<QuestionModel> fetchedQuestions = await _apiService.getQuestionsForLevel(levelId);
//       questions.addAll(fetchedQuestions);
//       return true;
//     } catch (e) {
//       // Handle errors if any
//       print('Error fetching questions: $e');
//       return false;
//     }
//   }
// }
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// //import 'package:testproj1/models/category.dart'; 
// import 'package:testproj1/models/question_model.dart'; // Import the QuestionModel class

// // Define a simple logging function
// void log(dynamic message) {
//   // In production, you might want to disable logging or use a proper logging framework
//   // ignore: avoid_print
//   //maybe need to fix later
//   // ignore: avoid_print
//   print('[INFO] $message');
// }

// // Define a custom class for handling streamed lists
// class StreamedList<T> {
//   final _controller = StreamController<List<T>>();
//   final List<T> _list = [];

//   StreamedList() {
//     _controller.add(_list);
//   }

//   void add(T item) {
//     _list.add(item);
//     _controller.add(_list);
//   }

//   void addAll(List<T> items) {
//     _list.addAll(items);
//     _controller.add(_list);
//   }

//   Stream<List<T>> get stream => _controller.stream;

//   void dispose() {
//     _controller.close();
//   }
// }

// class ApiService {
//   // Base URL for the API
//   static const String baseUrl = 'http://localhost:3000';

//   // Method to get questions for a specific level from the API
//   Future<List<QuestionModel>> getQuestionsForLevel(int level) async {
//     try {
//       final response = await http.get('$baseUrl/api/level$level/questions' as Uri);
//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = jsonDecode(response.body);
//         final List<QuestionModel> questions = responseData
//             .map((json) => QuestionModel.fromJson(json))
//             .toList();
//         return questions;
//       } else {
//         throw Exception('Failed to load questions for level $level. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load questions for level $level. Error: $e');
//     }
//   }

//   // Method to compare images for level 1 and level 2 questions
//   Future<bool> compareImages(int level, int questionId, String selectedImage) async {
//     try {
//       final response = await http.post(
//         '$baseUrl/api/compareImages' as Uri,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'questionId': questionId, 'selectedImage': selectedImage}),
//       );
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
//         final bool isCorrect = responseData['isCorrect'];
//         return isCorrect;
//       } else {
//         throw Exception('Failed to compare images for question $questionId. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to compare images for question $questionId. Error: $e');
//     }
//   }

//   // Method to compare videos for level 3 questions
//   Future<bool> compareVideos(int questionId, bool selectedIsMisinformation) async {
//     try {
//       final response = await http.post(
//         '$baseUrl/api/compareVideos' as Uri,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'questionId': questionId, 'selectedIsMisinformation': selectedIsMisinformation}),
//       );
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
//         final bool isCorrect = responseData['isCorrect'];
//         return isCorrect;
//       } else {
//         throw Exception('Failed to compare videos for question $questionId. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to compare videos for question $questionId. Error: $e');
//     }
//   }

//   // Add more API methods for submitting answers, fetching difficulty levels, etc.
// }
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';

// class ApiService {
//   // Base URL for the API
//   static const String baseUrl = 'http://localhost:3000';

//   // Method to get questions for a specific level from the API
//   Future<List<QuestionModel>> getQuestionsForLevel(int level) async {
//     try {
//       final response = await http.get('$baseUrl/api/level$level/questions' as Uri);
//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = jsonDecode(response.body);
//         final List<QuestionModel> questions = responseData
//             .map((json) => QuestionModel.fromJson(json))
//             .toList();
//         return questions;
//       } else {
//         throw Exception('Failed to load questions for level $level. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load questions for level $level. Error: $e');
//     }
//   }

//   // Method to get difficulty levels from the API
//   Future<List<DifficultyLevel>> getDifficultyLevels() async {
//     try {
//       final response = await http.get('$baseUrl/api/difficulty-levels' as Uri);
//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = jsonDecode(response.body);
//         final List<DifficultyLevel> levels = responseData
//             .map((json) => DifficultyLevel.fromJson(json))
//             .toList();
//         return levels;
//       } else {
//         throw Exception('Failed to load difficulty levels. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load difficulty levels. Error: $e');
//     }
//   }

//   // Add more API methods for submitting answers, fetching user data, etc.
// }
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testproj1/models/category.dart';
import 'package:testproj1/models/question_model.dart';

// Define a simple logging function
void log(dynamic message) {
  // In production, you might want to disable logging or use a proper logging framework
  // ignore: avoid_print
  print('[INFO] $message');
}

// Define a custom class for handling streamed lists
class StreamedList<T> {
  final _controller = StreamController<List<T>>();
  final List<T> _list = [];

  StreamedList() {
    _controller.add(_list);
  }

  void add(T item) {
    _list.add(item);
    _controller.add(_list);
  }

  void addAll(List<T> items) {
    _list.addAll(items);
    _controller.add(_list);
  }

  Stream<List<T>> get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}

// Define a custom class for handling streamed values
class StreamedValue<T> {
  late T _value;
  final _controller = StreamController<T>();

  StreamedValue(T initialValue, {required initialData}) {
    _value = initialValue;
    _controller.add(_value);
  }

  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    _controller.add(_value);
  }

  Stream<T> get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}

class ApiService {
  // Base URL for the API
  static const String baseUrl = 'http://localhost:3000';
Future<void> _loadQuestions() async {
  try {
    final levelId = categoryChosen.value!.id;
    final List<QuestionModel> loadedQuestions = await api.getQuestionsForLevel(levelId);
    
    // Check if questions were successfully loaded
    if (loadedQuestions.isNotEmpty) {
      // Handle successful loading of questions
      questions.addAll(loadedQuestions);
    } else {
      // Handle the case where no questions were loaded
      throw Exception('No questions loaded for level $levelId');
    }
  } catch (e) {
    // Handle exceptions
    print('Failed to load questions: $e');
    throw Exception('Failed to load questions: $e');
  }
}


  Future<bool> loadQuestions(StreamedList<QuestionModel> questions, int levelId) async {
    try {
      final response = await http.get('$baseUrl/api/questions?levelId=$levelId' as Uri);
      
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<QuestionModel> loadedQuestions = responseData
            .map((json) => QuestionModel.fromJson(json))
            .toList();
        questions.addAll(loadedQuestions);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Failed to load questions: $e');
      return false;
    }
  }

  Future<bool> getLevels(StreamedList<DifficultyLevel> categoriesStream) async {
    try {
      final response = await http.get('$baseUrl/api/difficulty-levels' as Uri);
      
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<DifficultyLevel> categories = responseData
            .map((json) => DifficultyLevel.fromJson(json))
            .toList();
        categoriesStream.addAll(categories);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Failed to load categories: $e');
      return false;
    }
  }
}
