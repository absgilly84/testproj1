// import 'package:flutter/material.dart';
// //import 'package:frideos/frideos.dart';
// import 'package:testproj1/services/api_service.dart';
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';
// //import 'package:testproj1/models/trivia_models.dart';
// //import 'path_to_your_file/game_bloc.dart';


// class AppState {
//   // THEMES
//   final themes = List<MyTheme>();
//   final currentTheme = StreamedValue<MyTheme>();

//   // API
//   final QuestionsAPI api = ApiService(); // Update with your API service
//   final apiType = StreamedValue<ApiType>(initialData: ApiType.mock);

//   // TABS
//   final tabController = StreamedValue<AppTab>(initialData: AppTab.main);

//   // TRIVIA
//   final categoriesStream = StreamedList<Category>();
//   final categoryChosen = StreamedValue<Category>();
//   final questions = StreamedList<Question>();
//   final questionsDifficulty =
//       StreamedValue<QuestionDifficulty>(initialData: QuestionDifficulty.medium);

//   final questionsAmount = StreamedTransformed<String, String>();

//   final validateAmount =
//       StreamTransformer<String, String>.fromHandlers(handleData: (str, sink) {
//     if (str.isNotEmpty) {
//       final amount = int.tryParse(str);
//       if (amount != null && amount > 1 && amount <= 15) {
//         sink.add(str);
//       } else {
//         sink.addError('Insert a value from 2 to 15.');
//       }
//     } else {
//       sink.addError('Insert a value.');
//     }
//   });

//   // BLOC
//   TriviaBloc triviaBloc;

//   // COUNTDOWN
//   final countdown = StreamedTransformed<String, String>();

//   final validateCountdown =
//       StreamTransformer<String, String>.fromHandlers(handleData: (str, sink) {
//     if (str.isNotEmpty) {
//       final time = int.tryParse(str);
//       if (time != null && time >= 3 && time <= 90) {
//         sink.add(str);
//       } else {
//         sink.addError('Insert a value from 3 to 90 seconds.');
//       }
//     } else {
//       sink.addError('Insert a value.');
//     }
//   });

//   // Custom fields for your game
//   final selectedDifficulty =
//       StreamedValue<DifficultyLevel>(initialData: DifficultyLevel.easy);

//   // Constructor
//   AppState._internal() {
//     print('-------APP STATE INIT--------');
//     _createThemes(themes);
//     _loadCategories();

//     countdown.value = '10'; // Initial countdown value
//     countdown.setTransformer(validateCountdown);

//     questionsAmount.value = '5'; // Initial questions amount value
//     questionsAmount.setTransformer(validateAmount);

//     triviaBloc = TriviaBloc(
//       countdownStream: countdown,
//       questions: questions,
//       tabController: tabController,
//     );
//   }

//   // Singleton setup
//   static final AppState _instance = AppState._internal();

//   factory AppState() => _instance;

//   // Initialization method
//   @override
//   Future<void> init() async {
//     final String lastTheme = await Prefs.getPref('apptheme');
//     if (lastTheme != null) {
//       currentTheme.value = themes.firstWhere(
//         (theme) => theme.name == lastTheme,
//         orElse: () => themes[0],
//       );
//     } else {
//       currentTheme.value = themes[0];
//     }
//   }

//   // Load categories method
//   Future<void> _loadCategories() async {
//     final isLoaded = await api.getCategories(categoriesStream);
//     if (isLoaded) {
//       categoryChosen.value = categoriesStream.value.last;
//     }
//   }

//   // Load questions method
//   Future<void> _loadQuestions() async {
//     // Choose the appropriate API and question type based on the selected difficulty
//     final QuestionType questionType =
//         _getQuestionTypeForDifficulty(selectedDifficulty.value);
//     await api.getQuestions(
//       questions: questions,
//       number: int.parse(questionsAmount.value),
//       category: categoryChosen.value,
//       difficulty: questionsDifficulty.value,
//       type: questionType,
//     );
//   }

//   // Method to determine the question type based on difficulty
//   QuestionType _getQuestionTypeForDifficulty(DifficultyLevel difficulty) {
//     switch (difficulty) {
//       case DifficultyLevel.easy:
//         return QuestionType.text; // Adjust as needed
//       case DifficultyLevel.medium:
//         return QuestionType.image; // Adjust as needed
//       case DifficultyLevel.hard:
//         return QuestionType.video; // Adjust as needed
//       default:
//         return QuestionType.text;
//     }
//   }

//   // Set category method
//   void setCategory(Category category) => categoryChosen.value = category;

//   // Set difficulty method
//   void setDifficulty(QuestionDifficulty difficulty) =>
//       questionsDifficulty.value = difficulty;

//   // Set API type method
//   void setApiType(ApiType type) {
//     if (apiType.value != type) {
//       apiType.value = type;
//       if (type == ApiType.remote) {
//         _loadCategories();
//       }
//     }
//   }

//   // Create themes method
//   void _createThemes(List<MyTheme> themes) {
//     themes.addAll([
//       MyTheme(
//         name: 'Default',
//         brightness: Brightness.dark,
//         backgroundColor: const Color(0xff111740),
//         scaffoldBackgroundColor: const Color(0xff111740),
//         primaryColor: const Color(0xff283593),
//         primaryColorBrightness: Brightness.dark,
//         accentColor: Colors.blue[300],
//       ),
//       MyTheme(
//         name: 'Dark',
//         brightness: Brightness.dark,
//         backgroundColor: Colors.black,
//         scaffoldBackgroundColor: Colors.black,
//         primaryColor: Colors.blueGrey[900],
//         primaryColorBrightness: Brightness.dark,
//         accentColor: Colors.blue[900],
//       ),
//     ]);
//   }

//   // Set theme method
//   void setTheme(MyTheme theme) {
//     currentTheme.value = theme;
//     Prefs.savePref<String>('apptheme', theme.name);
//   }

//   // Change tab method
//   set _changeTab(AppTab appTab) => tabController.value = appTab;

//   // Start trivia method
//   void startTrivia() {
//     _loadQuestions();
//     _changeTab = AppTab.trivia;
//   }

//   // End trivia method
//   void endTrivia() => tabController.value = AppTab.main;

//   // Show summary method
//   void showSummary() => tabController.value = AppTab.summary;

//   // Dispose method
//   @override
//   void dispose() {
//     print('---------APP STATE DISPOSE-----------');
//     apiType.dispose();
//     categoryChosen.dispose();
//     countdown.dispose();
//     currentTheme.dispose();
//     questions.dispose();
//     questionsAmount.dispose();
//     questionsDifficulty.dispose();
//     tabController.dispose();
//     triviaBloc.dispose();
//     selectedDifficulty.dispose();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/services/api_service.dart';
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';

// class AppState {
//   final QuestionsAPI api = ApiService(); // Update with your API service

//   final categoriesStream = StreamedList<DifficultyLevel>(); // Update with the correct type
//   final categoryChosen = StreamedValue<DifficultyLevel>(); // Update with the correct type
//   final questions = StreamedList<Question>(); // Update with the correct type

//   // Constructor
//   AppState._internal() {
//     _loadCategories();
//   }

//   // Singleton setup
//   static final AppState _instance = AppState._internal();

//   factory AppState() => _instance;

//   // Load categories method
//   Future<void> _loadCategories() async {
//     final isLoaded = await api.getLevels(categoriesStream); // Update method call based on the API service
//     if (isLoaded) {
//       categoryChosen.value = categoriesStream.value.last;
//     }
//   }

//   // Load questions method
//   Future<void> _loadQuestions() async {
//     // Update the method call based on the API service and parameters
//     final levelId = categoryChosen.value.id; // Assuming the category has an id property
//     final isLoaded = await api.getQuestions(questions, levelId);
//     if (!isLoaded) {
//       throw Exception('Failed to load questions');
//     }
//   }

//   // Set category method
//   void setCategory(DifficultyLevel category) => categoryChosen.value = category;

//   // Start trivia method
//   void startTrivia() {
//     _loadQuestions();
//     // Add logic to change the app state or notify listeners
//   }

//   // End trivia method
//   void endTrivia() {
//     // Add logic to change the app state or notify listeners
//   }

//   // Dispose method
//   void dispose() {
//     // Dispose of any streams or resources
//     categoriesStream.dispose();
//     categoryChosen.dispose();
//     questions.dispose();
//   }
// }
// import 'package:testproj1/services/api_service.dart';
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';

// class AppState {
//   final ApiService api = ApiService(); // Update with your API service

//   final categoriesStream = StreamedList<DifficultyLevel>(); // Update with the correct type
//   final categoryChosen = StreamedValue<DifficultyLevel>(); // Update with the correct type
//   final questions = StreamedList<QuestionModel>(); // Update with the correct type

//   // Constructor
//   AppState._internal() {
//     _loadCategories();
//   }

//   // Singleton setup
//   static final AppState _instance = AppState._internal();

//   factory AppState() => _instance;

//   // Load categories method
//   Future<void> _loadCategories() async {
//     final isLoaded = await api.getLevels(categoriesStream); // Update method call based on the API service
//     if (isLoaded) {
//       categoryChosen.value = categoriesStream.value.last;
//     }
//   }

//   // Load questions method
//   Future<void> _loadQuestions() async {
//     // Update the method call based on the API service and parameters
//     final levelId = categoryChosen.value.id; // Assuming the category has an id property
//     final isLoaded = await api.getQuestions(questions, levelId);
//     if (!isLoaded) {
//       throw Exception('Failed to load questions');
//     }
//   }

//   // Set category method
//   void setCategory(DifficultyLevel category) => categoryChosen.value = category;

//   // Start trivia method
//   void startTrivia() {
//     _loadQuestions();
//     // Add logic to change the app state or notify listeners
//   }

//   // End trivia method
//   void endTrivia() {
//     // Add logic to change the app state or notify listeners
//   }

//   // Dispose method
//   void dispose() {
//     // Dispose of any streams or resources
//     categoriesStream.dispose();
//     categoryChosen.dispose();
//     questions.dispose();
//   }
// }
// import 'package:testproj1/services/api_service.dart';
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';

// class AppState {
//   final ApiService api = ApiService(); // Update with your API service

//   final StreamedList<DifficultyLevel> categoriesStream = StreamedList<DifficultyLevel>(); // Update with the correct type
//   final StreamedValue<DifficultyLevel> categoryChosen = StreamedValue<DifficultyLevel>(); // Update with the correct type
//   final StreamedList<QuestionModel> questions = StreamedList<QuestionModel>(); // Update with the correct type

//   // Constructor
//   AppState._internal() {
//     _loadCategories();
//   }

//   // Singleton setup
//   static final AppState _instance = AppState._internal();

//   factory AppState() => _instance;

//   // Load categories method
//   Future<void> _loadCategories() async {
//     final isLoaded = await api.getLevels(categoriesStream); // Update method call based on the API service
//     if (isLoaded) {
//       categoryChosen.value = categoriesStream.value.last;
//     }
//   }

//   // Load questions method
//   Future<void> _loadQuestions() async {
//     // Update the method call based on the API service and parameters
//     final levelId = categoryChosen.value.id; // Assuming the category has an id property
//     final isLoaded = await api.getQuestions(questions, levelId);
//     if (!isLoaded) {
//       throw Exception('Failed to load questions');
//     }
//   }

//   // Set category method
//   void setCategory(DifficultyLevel category) => categoryChosen.value = category;

//   // Start trivia method
//   void startTrivia() {
//     _loadQuestions();
//     // Add logic to change the app state or notify listeners
//   }

//   // End trivia method
//   void endTrivia() {
//     // Add logic to change the app state or notify listeners
//   }

//   // Dispose method
//   void dispose() {
//     // Dispose of any streams or resources
//     categoriesStream.dispose();
//     categoryChosen.dispose();
//     questions.dispose();
//   }
// }
// import 'package:testproj1/services/api_service.dart';
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';

// class AppState {
//   final ApiService api = ApiService();

//   final StreamedList<DifficultyLevel> categoriesStream = StreamedList<DifficultyLevel>();
//   final StreamedValue<DifficultyLevel> categoryChosen = StreamedValue<DifficultyLevel>();
//   final StreamedList<QuestionModel> questions = StreamedList<QuestionModel>();

//   int correctAnswers = 0;
//   int wrongAnswers = 0;
//   int totalScore = 0;

//   AppState._internal() {
//     _loadCategories();
//   }

//   static final AppState _instance = AppState._internal();

//   factory AppState() => _instance;

//   Future<void> _loadCategories() async {
//   final isLoaded = await api.getLevels(categoriesStream);
//   if (isLoaded) {
//     categoryChosen.value = categoriesStream.value!.last;
//   } else {
//     // Handle the case where loading categories failed
//     // For example, display an error message or retry loading
//   }
// }


//   Future<void> _loadQuestions() async {
//     final levelId = categoryChosen.value!.id;
//     final isLoaded = await api.getQuestionsForLevel(levelId);
//     if (!isLoaded) {
//       throw Exception('Failed to load questions');
//     }
//   }

//   void setCategory(DifficultyLevel category) {
//     categoryChosen.value = category;
//   }

//   void startTrivia() {
//     _loadQuestions();
//   }

//   void endTrivia() {
//     // Add logic to change the app state or notify listeners
//   }

//   void dispose() {
//     categoriesStream.dispose();
//     categoryChosen.dispose();
//     questions.dispose();
//   }
// }
// import 'dart:convert';

// import 'package:testproj1/API/misinformation_api.dart';
// import 'package:testproj1/services/api_service.dart';
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';

// class AppState {
//   final ApiService api = ApiService();
//   final StreamedList<DifficultyLevel> categoriesStream = StreamedList<DifficultyLevel>();
//   //final StreamedValue<DifficultyLevel?> categoryChosen = StreamedValue<DifficultyLevel?>(initialData: null);
//   //final StreamedValue<DifficultyLevel?> categoryChosen = StreamedValue<DifficultyLevel?>(initialData: null);
//   final StreamedValue<DifficultyLevel?> categoryChosen = StreamedValue<DifficultyLevel?>(null, initialData: null);


//   final StreamedList<QuestionModel> questions = StreamedList<QuestionModel>();

//   int correctAnswers = 0;
//   int wrongAnswers = 0;
//   int totalScore = 0;

//   AppState._internal() {
//     _loadCategories();
//   }

//   static final AppState _instance = AppState._internal();

//   factory AppState() => _instance;

//   Future<void> _loadCategories() async {
//     final isLoaded = await api.getLevels(categoriesStream);
//     if (isLoaded) {
//       categoryChosen.stream.listen((List<DifficultyLevel> categories) {
//         // This listener will be called whenever new categories are added
//         if (categories.isNotEmpty) {
//           categoryChosen.value = categories.last;
//         }
//       } as void Function(DifficultyLevel? event)?);
//     } else {
//       // Handle the case where loading categories failed
//       // For example, display an error message or retry loading
//     }
//   }

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
//   void setCategory(DifficultyLevel category) {
//     categoryChosen.value = category;
//   }

//   void startTrivia() {
//     _loadQuestions();
//   }

//   void endTrivia() {
//     // Add logic to change the app state or notify listeners
//   }

//   void dispose() {
//     categoriesStream.dispose();
//     categoryChosen.dispose();
//     questions.dispose();
//   }
// }
// import 'package:testproj1/API/misinformation_api.dart';
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';
// import 'package:testproj1/services/api_service.dart';

// class AppState {
//   final ApiService api = ApiService();
//   final StreamedList<DifficultyLevel> categoriesStream = StreamedList<DifficultyLevel>();
//   final StreamedValue<DifficultyLevel?> categoryChosen = StreamedValue<DifficultyLevel?>(initialData: null);
//   final StreamedList<QuestionModel> questions = StreamedList<QuestionModel>();
  
//   // Define the theme stream
//   final StreamedValue<String> themeStream = StreamedValue<String>("light", initialData: "light");

//   int correctAnswers = 0;
//   int wrongAnswers = 0;
//   int totalScore = 0;

//   AppState._internal() {
//     _loadCategories();
//   }

//   static final AppState _instance = AppState._internal();

//   factory AppState() => _instance;

//   Future<void> _loadCategories() async {
//     final List<DifficultyLevel> categories = await api.getLevels();
//     categoriesStream.addAll(categories);
//     if (categories.isNotEmpty) {
//       categoryChosen.value = categories.last;
//     }

//     categoryChosen.stream.listen((DifficultyLevel? category) {
//       // Listener to handle changes in chosen category
//       if (category != null) {
//         _loadQuestionsForLevel(category.id); // Assuming id is the unique identifier for each difficulty level
//       }
//     });
//   }

//   Future<void> _loadQuestionsForLevel(int level) async {
//     try {
//       final List<QuestionModel> loadedQuestions = await api.getQuestions(level);
//       questions.addAll(loadedQuestions);
//     } catch (e) {
//       // Handle error
//       print('Failed to load questions for level $level: $e');
//     }
//   }

//   void setCategory(DifficultyLevel category) {
//     categoryChosen.value = category;
//   }

//   void startTrivia() {
//     // Add logic to start trivia
//   }

//   void endTrivia() {
//     // Add logic to end trivia
//   }

//   void dispose() {
//     categoriesStream.dispose();
//     categoryChosen.dispose();
//     questions.dispose();
//   }
// }

// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';
// import 'package:testproj1/services/api_service.dart';

// class AppState {
//   final ApiService api = ApiService();
//   final StreamedList<DifficultyLevel> categoriesStream = StreamedList<DifficultyLevel>();
//   final StreamedValue<DifficultyLevel?> categoryChosen = StreamedValue<DifficultyLevel?>(initialData: null);
//   final StreamedList<QuestionModel> questions = StreamedList<QuestionModel>();

//   final StreamedValue<String> themeStream = StreamedValue<String>("light", initialData: "light");

//   int correctAnswers = 0;
//   int wrongAnswers = 0;
//   int totalScore = 0;

//   AppState._internal() {
//     _loadCategories();
//   }

//   static final AppState _instance = AppState._internal();

//   factory AppState() => _instance;

//   Future<void> _loadCategories() async {
//     final List<DifficultyLevel> categories = await api.getLevels();
//     categoriesStream.addAll(categories);
//     if (categories.isNotEmpty) {
//       categoryChosen.value = categories.last;
//     }

//     categoryChosen.stream.listen((DifficultyLevel? category) {
//       if (category != null) {
//         _loadQuestionsForLevel(category.id);
//       }
//     });
//   }

//   Future<void> _loadQuestionsForLevel(int level) async {
//     try {
//       final List<QuestionModel> loadedQuestions = await api.getQuestions(level);
//       questions.addAll(loadedQuestions);
//     } catch (e) {
//       print('Failed to load questions for level $level: $e');
//     }
//   }

//   void setCategory(DifficultyLevel category) {
//     categoryChosen.value = category;
//   }

//   void startTrivia() {
//     // Add logic to start trivia
//   }

//   void endTrivia() {
//     // Add logic to end trivia
//   }

//   void dispose() {
//     categoriesStream.dispose();
//     categoryChosen.dispose();
//     questions.dispose();
//   }
// }
// import 'package:testproj1/api/app_service.dart';
// import 'package:testproj1/models/category.dart';
// import 'package:testproj1/models/question_model.dart';
// import 'package:testproj1/api/streamed_list.dart'; // Assuming this is needed

// class AppState {
//   final AppService api = ApiService();

//   final StreamedList<DifficultyLevel> categoriesStream = StreamedList<DifficultyLevel>();
//   final StreamedList<QuestionModel> questions = StreamedList<QuestionModel>();

//   AppState._internal() {
//     _loadCategories();
//   }

//   static final AppState _instance = AppState._internal();

//   factory AppState() => _instance;

//   Future<void> _loadCategories() async {
//     try {
//       final List<DifficultyLevel> categories = await api.getLevels();
//       categoriesStream.addAll(categories);
//     } catch (e) {
//       print('Failed to load categories: $e');
//     }
//   }

//   Future<void> loadQuestionsForLevel(int level) async {
//     try {
//       final List<QuestionModel> loadedQuestions = await api.getQuestions(level);
//       questions.addAll(loadedQuestions);
//     } catch (e) {
//       print('Failed to load questions for level $level: $e');
//     }
//   }
// }
import 'package:testproj1/api/app_service.dart'; // Corrected import statement
import 'package:testproj1/models/category.dart';
import 'package:testproj1/models/question_model.dart';
import 'package:testproj1/api/streamed_list.dart'; // Assuming this is needed

class AppState {
  final ApiService api = ApiService(); // Corrected instantiation

  final StreamedList<DifficultyLevel> categoriesStream = StreamedList<DifficultyLevel>();
  final StreamedList<QuestionModel> questions = StreamedList<QuestionModel>();

  AppState._internal() {
    _loadCategories();
  }

  static final AppState _instance = AppState._internal();

  factory AppState() => _instance;

  Future<void> _loadCategories() async {
    try {
      final List<DifficultyLevel> categories = await api.getLevels();
      categoriesStream.addAll(categories);
    } catch (e) {
      print('Failed to load categories: $e');
    }
  }

  Future<void> loadQuestionsForLevel(int level) async {
    try {
      final List<QuestionModel> loadedQuestions = await api.getQuestions(level);
      questions.addAll(loadedQuestions);
    } catch (e) {
      print('Failed to load questions for level $level: $e');
    }
  }
}
