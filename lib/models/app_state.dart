import 'package:flutter/material.dart';
//import 'package:frideos/frideos.dart';
import 'package:testproj1/services/api_service.dart';
import 'package:testproj1/models/category.dart';
import 'package:testproj1/models/question_model.dart';
//import 'package:testproj1/models/trivia_models.dart';
//import 'path_to_your_file/game_bloc.dart';


class AppState {
  // THEMES
  final themes = List<MyTheme>();
  final currentTheme = StreamedValue<MyTheme>();

  // API
  final QuestionsAPI api = ApiService(); // Update with your API service
  final apiType = StreamedValue<ApiType>(initialData: ApiType.mock);

  // TABS
  final tabController = StreamedValue<AppTab>(initialData: AppTab.main);

  // TRIVIA
  final categoriesStream = StreamedList<Category>();
  final categoryChosen = StreamedValue<Category>();
  final questions = StreamedList<Question>();
  final questionsDifficulty =
      StreamedValue<QuestionDifficulty>(initialData: QuestionDifficulty.medium);

  final questionsAmount = StreamedTransformed<String, String>();

  final validateAmount =
      StreamTransformer<String, String>.fromHandlers(handleData: (str, sink) {
    if (str.isNotEmpty) {
      final amount = int.tryParse(str);
      if (amount != null && amount > 1 && amount <= 15) {
        sink.add(str);
      } else {
        sink.addError('Insert a value from 2 to 15.');
      }
    } else {
      sink.addError('Insert a value.');
    }
  });

  // BLOC
  TriviaBloc triviaBloc;

  // COUNTDOWN
  final countdown = StreamedTransformed<String, String>();

  final validateCountdown =
      StreamTransformer<String, String>.fromHandlers(handleData: (str, sink) {
    if (str.isNotEmpty) {
      final time = int.tryParse(str);
      if (time != null && time >= 3 && time <= 90) {
        sink.add(str);
      } else {
        sink.addError('Insert a value from 3 to 90 seconds.');
      }
    } else {
      sink.addError('Insert a value.');
    }
  });

  // Custom fields for your game
  final selectedDifficulty =
      StreamedValue<DifficultyLevel>(initialData: DifficultyLevel.easy);

  // Constructor
  AppState._internal() {
    print('-------APP STATE INIT--------');
    _createThemes(themes);
    _loadCategories();

    countdown.value = '10'; // Initial countdown value
    countdown.setTransformer(validateCountdown);

    questionsAmount.value = '5'; // Initial questions amount value
    questionsAmount.setTransformer(validateAmount);

    triviaBloc = TriviaBloc(
      countdownStream: countdown,
      questions: questions,
      tabController: tabController,
    );
  }

  // Singleton setup
  static final AppState _instance = AppState._internal();

  factory AppState() => _instance;

  // Initialization method
  @override
  Future<void> init() async {
    final String lastTheme = await Prefs.getPref('apptheme');
    if (lastTheme != null) {
      currentTheme.value = themes.firstWhere(
        (theme) => theme.name == lastTheme,
        orElse: () => themes[0],
      );
    } else {
      currentTheme.value = themes[0];
    }
  }

  // Load categories method
  Future<void> _loadCategories() async {
    final isLoaded = await api.getCategories(categoriesStream);
    if (isLoaded) {
      categoryChosen.value = categoriesStream.value.last;
    }
  }

  // Load questions method
  Future<void> _loadQuestions() async {
    // Choose the appropriate API and question type based on the selected difficulty
    final QuestionType questionType =
        _getQuestionTypeForDifficulty(selectedDifficulty.value);
    await api.getQuestions(
      questions: questions,
      number: int.parse(questionsAmount.value),
      category: categoryChosen.value,
      difficulty: questionsDifficulty.value,
      type: questionType,
    );
  }

  // Method to determine the question type based on difficulty
  QuestionType _getQuestionTypeForDifficulty(DifficultyLevel difficulty) {
    switch (difficulty) {
      case DifficultyLevel.easy:
        return QuestionType.text; // Adjust as needed
      case DifficultyLevel.medium:
        return QuestionType.image; // Adjust as needed
      case DifficultyLevel.hard:
        return QuestionType.video; // Adjust as needed
      default:
        return QuestionType.text;
    }
  }

  // Set category method
  void setCategory(Category category) => categoryChosen.value = category;

  // Set difficulty method
  void setDifficulty(QuestionDifficulty difficulty) =>
      questionsDifficulty.value = difficulty;

  // Set API type method
  void setApiType(ApiType type) {
    if (apiType.value != type) {
      apiType.value = type;
      if (type == ApiType.remote) {
        _loadCategories();
      }
    }
  }

  // Create themes method
  void _createThemes(List<MyTheme> themes) {
    themes.addAll([
      MyTheme(
        name: 'Default',
        brightness: Brightness.dark,
        backgroundColor: const Color(0xff111740),
        scaffoldBackgroundColor: const Color(0xff111740),
        primaryColor: const Color(0xff283593),
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.blue[300],
      ),
      MyTheme(
        name: 'Dark',
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.blueGrey[900],
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.blue[900],
      ),
    ]);
  }

  // Set theme method
  void setTheme(MyTheme theme) {
    currentTheme.value = theme;
    Prefs.savePref<String>('apptheme', theme.name);
  }

  // Change tab method
  set _changeTab(AppTab appTab) => tabController.value = appTab;

  // Start trivia method
  void startTrivia() {
    _loadQuestions();
    _changeTab = AppTab.trivia;
  }

  // End trivia method
  void endTrivia() => tabController.value = AppTab.main;

  // Show summary method
  void showSummary() => tabController.value = AppTab.summary;

  // Dispose method
  @override
  void dispose() {
    print('---------APP STATE DISPOSE-----------');
    apiType.dispose();
    categoryChosen.dispose();
    countdown.dispose();
    currentTheme.dispose();
    questions.dispose();
    questionsAmount.dispose();
    questionsDifficulty.dispose();
    tabController.dispose();
    triviaBloc.dispose();
    selectedDifficulty.dispose();
  }
}
