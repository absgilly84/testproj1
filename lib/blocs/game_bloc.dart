// import 'dart:async';
// import 'package:rxdart/rxdart.dart';
// import 'package:testproj1/models/misinformation_question_model.dart';
// import 'package:testproj1/models/app_state.dart';
// import 'package:testproj1/services/api_service.dart'; // Update with your actual import

// class GameBloc {
//   GameBloc({
//     this.countdownStream,
//     this.misinformationQuestions,
//     this.tabController,
//     this.apiService,
//   }) {
//     misinformationQuestions.onChange((data) {
//       if (data.isNotEmpty) {
//         final questions = data..shuffle();
//         _startMisinformationTrivia(questions);
//       }
//     });

//     countdownStream.outTransformed.listen((data) {
//       countdown = int.parse(data) * 1000;
//     });
//   }

//   // STREAMS
//   final StreamedValue<AppTab> tabController;
//   final triviaState = StreamedValue<TriviaState>(initialData: TriviaState());
//   final StreamedList<MisinformationQuestionModel> misinformationQuestions;
//   final currentMisinformationQuestion =
//       StreamedValue<MisinformationQuestionModel>();
//   final currentTime = StreamedValue<int>(initialData: 0);
//   final countdownBar = StreamedValue<double>();
//   final answersAnimation = StreamedValue<AnswerAnimation>(
//     initialData: AnswerAnimation(chosenAnswerIndex: 0, startPlaying: false),
//   );

//   // QUESTIONS, ANSWERS, STATS
//   int index = 0;
//   String chosenAnswer;
//   final stats = TriviaStats();

//   // TIMER, COUNTDOWN
//   final StreamedTransformed<String, String> countdownStream;
//   int countdown; // Milliseconds
//   Timer timer;

//   void _startMisinformationTrivia(
//       List<MisinformationQuestionModel> data) {
//     index = 0;
//     triviaState.value.questionIndex = 1;

//     // To show the main page and summary buttons
//     triviaState.value.isTriviaEnd = false;

//     // Reset the stats
//     stats.reset();

//     // To set the initial question (in this case, the countdown
//     // bar animation won't start).
//     currentMisinformationQuestion.value = data.first;

//     Timer(Duration(milliseconds: 1000), () {
//       // Setting this flag to true on changing the question
//       // the countdown bar animation starts.
//       triviaState.value.isTriviaPlaying = true;

//       // Stream the first question again with the countdown bar
//       // animation.
//       currentMisinformationQuestion.value = data[index];

//       playTrivia();
//     });
//   }

//   void playTrivia() {
//     timer = Timer.periodic(Duration(milliseconds: refreshTime), (Timer t) {
//       currentTime.value = refreshTime * t.tick;

//       if (currentTime.value > countdown) {
//         currentTime.value = 0;
//         timer.cancel();
//         notAnswered(currentMisinformationQuestion.value);
//         _nextQuestion();
//       }
//     });
//   }

//   void _endTrivia() {
//     // RESET
//     timer.cancel();
//     currentTime.value = 0;
//     triviaState.value.isTriviaEnd = true;
//     triviaState.refresh();
//     stopTimer();

//     Timer(Duration(milliseconds: 1500), () {
//       // this is reset here to not trigger the start of the
//       // countdown animation while waiting for the summary page.
//       triviaState.value.isAnswerChosen = false;
//       // Show the summary page after 1.5s
//       tabController.value = AppTab.summary;

//       // Clear the last question so that it doesn't appear
//       // in the next game
//       currentMisinformationQuestion.value = null;
//     });
//   }

//   void notAnswered(MisinformationQuestionModel question) {
//     stats.addNoAnswer(question);
//   }

//   void checkAnswer(MisinformationQuestionModel question, String answer) {
//     if (!triviaState.value.isTriviaEnd) {
//       question.chosenAnswerIndex = question.answers.indexOf(answer);
//       if (question.isCorrect(answer)) {
//         stats.addCorrect(question);
//       } else {
//         stats.addWrong(question);
//       }

//       timer.cancel();
//       currentTime.value = 0;

//       _nextQuestion();
//     }
//   }

//   void _nextQuestion() {
//     index++;

//     if (index < misinformationQuestions.length) {
//       triviaState.value.questionIndex++;
//       currentMisinformationQuestion.value =
//           misinformationQuestions.value[index];
//       playTrivia();
//     } else {
//       _endTrivia();
//     }
//   }

//   void stopTimer() {
//     // Stop the timer
//     timer.cancel();
//     // By setting this flag to true, the countdown animation will stop
//     triviaState.value.isAnswerChosen = true;
//     triviaState.refresh();
//   }

//   void onChosenAnswer(String answer) {
//     chosenAnswer = answer;

//     stopTimer();

//     // Set the chosenAnswer so that the answer widget can put it last on the
//     // stack.
//     answersAnimation.value.chosenAnswerIndex =
//         currentMisinformationQuestion.value.answers.indexOf(answer);
//     answersAnimation.refresh();
//   }

//   void onChosenAnswerAnimationEnd() {
//     // Reset the flag so that the countdown animation can start
//     triviaState.value.isAnswerChosen = false;
//     triviaState.refresh();

//     checkAnswer(
//         currentMisinformationQuestion.value, chosenAnswer);
//   }

//   void dispose() {
//     answersAnimation.dispose();
//     countdownBar.dispose();
//     countdownStream.dispose();
//     currentMisinformationQuestion.dispose();
//     currentTime.dispose();
//     misinformationQuestions.dispose();
//     tabController.dispose();
//     triviaState.dispose();
//   }
// }

// class TriviaStats {
//   TriviaStats() {
//     corrects = [];
//     wrongs = [];
//     noAnswered = [];
//     score = 0;
//   }

//   List<MisinformationQuestionModel> corrects;
//   List<MisinformationQuestionModel> wrongs;
//   List<MisinformationQuestionModel> noAnswer
// import 'package:testproj1/models/misinformation_question_model.dart';
// import 'package:testproj1/models/app_state.dart';
// import 'package:testproj1/services/api_service.dart';

// class GameBloc {
//   GameBloc({
//     this.apiService,
//   });

//   final ApiService apiService;

//   // Add necessary streams and methods as needed for handling game logic

//   void dispose() {
//     // Dispose of streams and resources
//   }
// }
// import 'dart:async';

// import 'package:testproj1/models/app_state.dart'; // Assuming this is needed
// import 'package:testproj1/services/api_service.dart'; // Assuming this is needed

// class GameBloc {
//   GameBloc({
//     required this.apiService, // Marking apiService as required
//   });

//   final ApiService apiService;

//   // Streams
//   // Assuming StreamController is used instead of StreamedValue
//   final StreamController<AppTab> tabController = StreamController<AppTab>(); 

// //   // Methods
// //   Future<void> fetchQuestions(int level) async {
// //     try {
// //       final questions = await apiService.getQuestions(level); 
// //       // Handle fetched questions, update state, etc.
// //     } catch (e) {
// //       // Handle error
// //     }
// //   }

// //   void dispose() {
// //     // Dispose of streams and resources
// //     tabController.close();
// //   }
// // }

// import 'dart:async';
// import 'package:testproj1/models/app_state.dart';
// import 'package:testproj1/services/api_service.dart';

// class GameBloc {
//   GameBloc({
//     required this.apiService,
//   });

//   final ApiService apiService;
//   final StreamController<AppTab> tabController = StreamController<AppTab>();

//   Future<void> fetchQuestions(int level) async {
//     try {
//       final questions = await apiService.getQuestions(level);
//       // Handle fetched questions, update state, etc.
//     } catch (e) {
//       // Handle error
//       print('Failed to fetch questions: $e');
//     }
//   }

//   void dispose() {
//     tabController.close();
//   }
// }
