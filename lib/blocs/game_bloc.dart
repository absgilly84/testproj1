const questionTime = 10000;
const refreshTime = 100;

class TriviaBloc {
  TriviaBloc({this.countdownStream, this.questions, this.tabController}) {
    // Getting the questions from the API
    questions.onChange((data) {
      if (data.isNotEmpty) {
        final questions = data..shuffle();
        _startTrivia(questions);
      }
    });

    countdownStream.outTransformed.listen((data) {
      countdown = int.parse(data) * 1000;
    });
  }

  // STREAMS
  final StreamedValue<AppTab> tabController;
  final triviaState = StreamedValue<TriviaState>(initialData: TriviaState());
  final StreamedList<Question> questions;
  final currentQuestion = StreamedValue<Question>();
  final currentTime = StreamedValue<int>(initialData: 0);
  final countdownBar = StreamedValue<double>();
  final answersAnimation = StreamedValue<AnswerAnimation>(
      initialData: AnswerAnimation(chosenAnswerIndex: 0, startPlaying: false));

  // QUESTIONS, ANSWERS, STATS
  int index = 0;
  String chosenAnswer;
  final stats = TriviaStats();

  // TIMER, COUNTDOWN
  final StreamedTransformed<String, String> countdownStream;
  int countdown; // Milliseconds
  Timer timer;

  void _startTrivia(List<Question> data) {
    index = 0;
    triviaState.value.questionIndex = 1;

    // To show the main page and summary buttons
    triviaState.value.isTriviaEnd = false;

    // Reset the stats
    stats.reset();

    // To set the initial question (in this case the countdown
    // bar animation won't start).
    currentQuestion.value = data.first;

    Timer(Duration(milliseconds: 1000), () {
      // Setting this flag to true on changing the question
      // the countdown bar animation starts.
      triviaState.value.isTriviaPlaying = true;

      // Stream the first question again with the countdown bar
      // animation.
      currentQuestion.value = data[index];

      playTrivia();
    });
  }

  void playTrivia() {
    timer = Timer.periodic(Duration(milliseconds: refreshTime), (Timer t) {
      currentTime.value = refreshTime * t.tick;

      if (currentTime.value > countdown) {
        currentTime.value = 0;
        timer.cancel();
        notAnswered(currentQuestion.value);
        _nextQuestion();
      }
    });
  }

  void _endTrivia() {
    // RESET
    timer.cancel();
    currentTime.value = 0;
    triviaState.value.isTriviaEnd = true;
    triviaState.refresh();
    stopTimer();

    Timer(Duration(milliseconds: 1500), () {
      // this is reset here to not trigger the start of the
      // countdown animation while waiting for the summary page.
      triviaState.value.isAnswerChosen = false;
      // Show the summary page after 1.5s
      tabController.value = AppTab.summary;

      // Clear the last question so that it doesn't appear
      // in the next game
      currentQuestion.value = null;
    });
  }

  void notAnswered(Question question) {
    stats.addNoAnswer(question);
  }

  void checkAnswer(Question question, String answer) {
    if (!triviaState.value.isTriviaEnd) {
      question.chosenAnswerIndex = question.answers.indexOf(answer);
      if (question.isCorrect(answer)) {
        stats.addCorrect(question);
      } else {
        stats.addWrong(question);
      }

      timer.cancel();
      currentTime.value = 0;

      _nextQuestion();
    }
  }

  void _nextQuestion() {
    index++;

    if (index < questions.length) {
      triviaState.value.questionIndex++;
      currentQuestion.value = questions.value[index];
      playTrivia();
    } else {
      _endTrivia();
    }
  }

  void stopTimer() {
    // Stop the timer
    timer.cancel();
    // By setting this flag to true the countdown animation will stop
    triviaState.value.isAnswerChosen = true;
    triviaState.refresh();
  }

  void onChosenAnswer(String answer) {
    chosenAnswer = answer;

    stopTimer();

    // Set the chosenAnswer so that the answer widget can put it last on the
    // stack.
    answersAnimation.value.chosenAnswerIndex =
        currentQuestion.value.answers.indexOf(answer);
    answersAnimation.refresh();
  }

  void onChosenAnwserAnimationEnd() {
    // Reset the flag so that the countdown animation can start
    triviaState.value.isAnswerChosen = false;
    triviaState.refresh();

    checkAnswer(currentQuestion.value, chosenAnswer);
  }

  void dispose() {
    answersAnimation.dispose();
    countdownBar.dispose();
    countdownStream.dispose();
    currentQuestion.dispose();
    currentTime.dispose();
    questions.dispose();
    tabController.dispose();
    triviaState.dispose();
  }
}
import 'dart:async';
import 'package:your_app/models/misinformation_question_model.dart'; // Replace with your actual model import
import 'package:rxdart/rxdart.dart';

class TriviaBloc {
  TriviaBloc({
    this.countdownStream,
    this.misinformationQuestions,
    this.tabController,
  }) {
    misinformationQuestions.onChange((data) {
      if (data.isNotEmpty) {
        final questions = data..shuffle();
        _startMisinformationTrivia(questions);
      }
    });

    countdownStream.outTransformed.listen((data) {
      countdown = int.parse(data) * 1000;
    });
  }

  // STREAMS
  final StreamedValue<AppTab> tabController;
  final triviaState = StreamedValue<TriviaState>(initialData: TriviaState());
  final StreamedList<MisinformationQuestionModel> misinformationQuestions;
  final currentMisinformationQuestion =
      StreamedValue<MisinformationQuestionModel>();
  final currentTime = StreamedValue<int>(initialData: 0);
  final countdownBar = StreamedValue<double>();
  final answersAnimation = StreamedValue<AnswerAnimation>(
    initialData: AnswerAnimation(chosenAnswerIndex: 0, startPlaying: false),
  );

  // QUESTIONS, ANSWERS, STATS
  int index = 0;
  String chosenAnswer;
  final stats = TriviaStats();

  // TIMER, COUNTDOWN
  final StreamedTransformed<String, String> countdownStream;
  int countdown; // Milliseconds
  Timer timer;

  void _startMisinformationTrivia(
      List<MisinformationQuestionModel> data) {
    index = 0;
    triviaState.value.questionIndex = 1;

    // To show the main page and summary buttons
    triviaState.value.isTriviaEnd = false;

    // Reset the stats
    stats.reset();

    // To set the initial question (in this case, the countdown
    // bar animation won't start).
    currentMisinformationQuestion.value = data.first;

    Timer(Duration(milliseconds: 1000), () {
      // Setting this flag to true on changing the question
      // the countdown bar animation starts.
      triviaState.value.isTriviaPlaying = true;

      // Stream the first question again with the countdown bar
      // animation.
      currentMisinformationQuestion.value = data[index];

      playTrivia();
    });
  }

  void playTrivia() {
    timer = Timer.periodic(Duration(milliseconds: refreshTime), (Timer t) {
      currentTime.value = refreshTime * t.tick;

      if (currentTime.value > countdown) {
        currentTime.value = 0;
        timer.cancel();
        notAnswered(currentMisinformationQuestion.value);
        _nextQuestion();
      }
    });
  }

  void _endTrivia() {
    // RESET
    timer.cancel();
    currentTime.value = 0;
    triviaState.value.isTriviaEnd = true;
    triviaState.refresh();
    stopTimer();

    Timer(Duration(milliseconds: 1500), () {
      // this is reset here to not trigger the start of the
      // countdown animation while waiting for the summary page.
      triviaState.value.isAnswerChosen = false;
      // Show the summary page after 1.5s
      tabController.value = AppTab.summary;

      // Clear the last question so that it doesn't appear
      // in the next game
      currentMisinformationQuestion.value = null;
    });
  }

  void notAnswered(MisinformationQuestionModel question) {
    stats.addNoAnswer(question);
  }

  void checkAnswer(MisinformationQuestionModel question, String answer) {
    if (!triviaState.value.isTriviaEnd) {
      question.chosenAnswerIndex = question.answers.indexOf(answer);
      if (question.isCorrect(answer)) {
        stats.addCorrect(question);
      } else {
        stats.addWrong(question);
      }

      timer.cancel();
      currentTime.value = 0;

      _nextQuestion();
    }
  }

  void _nextQuestion() {
    index++;

    if (index < misinformationQuestions.length) {
      triviaState.value.questionIndex++;
      currentMisinformationQuestion.value =
          misinformationQuestions.value[index];
      playTrivia();
    } else {
      _endTrivia();
    }
  }

  void stopTimer() {
    // Stop the timer
    timer.cancel();
    // By setting this flag to true, the countdown animation will stop
    triviaState.value.isAnswerChosen = true;
    triviaState.refresh();
  }

  void onChosenAnswer(String answer) {
    chosenAnswer = answer;

    stopTimer();

    // Set the chosenAnswer so that the answer widget can put it last on the
    // stack.
    answersAnimation.value.chosenAnswerIndex =
        currentMisinformationQuestion.value.answers.indexOf(answer);
    answersAnimation.refresh();
  }

  void onChosenAnswerAnimationEnd() {
    // Reset the flag so that the countdown animation can start
    triviaState.value.isAnswerChosen = false;
    triviaState.refresh();

    checkAnswer(
        currentMisinformationQuestion.value, chosenAnswer);
  }

  void dispose() {
    answersAnimation.dispose();
    countdownBar.dispose();
    countdownStream.dispose();
    currentMisinformationQuestion.dispose();
    currentTime.dispose();
    misinformationQuestions.dispose();
    tabController.dispose();
    triviaState.dispose();
  }
}

class TriviaStats {
  TriviaStats() {
    corrects = [];
    wrongs = [];
    noAnswered = [];
    score = 0;
  }

  List<MisinformationQuestionModel> corrects;
  List<MisinformationQuestionModel> wrongs;
  List<MisinformationQuestionModel> noAnswered;
  int score;

  void addCorrect(MisinformationQuestionModel question) {
    corrects.add(question);
    score += 10;
  }

  void addWrong(MisinformationQuestionModel question) {
    wrongs.add(question);
    score -= 4;
  }

  void addNoAnswer(MisinformationQuestionModel question) {
    noAnswered.add(question);
    score -= 2;
  }

  void reset() {
    corrects = [];
    wrongs = [];
    noAnswered = [];
    score = 0;
  }
}

class AnswerAnimation {
  AnswerAnimation({this.chosenAnswerIndex, this.startPlaying});
  int chosenAnswerIndex;
  bool startPlaying = false;
}

class TriviaState {
  bool isTriviaPlaying = false;
  bool isTriviaEnd = false;
  bool isAnswerChosen = false;
  int questionIndex = 1;
}

enum AppTab { main, trivia, summary }
