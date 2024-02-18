// class QuestionModel {
//   QuestionModel({
//     required this.question,
//     required this.correctAnswer,
//     required this.incorrectAnswers,
//     required this.imageOptions,
//     required this.videoOption,
//   });

//   factory QuestionModel.fromJson(Map<String, dynamic> json) {
//     return QuestionModel(
//       question: json['question'],
//       correctAnswer: json['correct_answer'],
//       incorrectAnswers: List<String>.from(json['incorrect_answers']),
//       imageOptions: json['image_options'], // Replace 'image_options' with the actual field name
//       videoOption: json['video_option'], // Replace 'video_option' with the actual field name
//     );
//   }

//   String question;
//   String correctAnswer;
//   List<String> incorrectAnswers;
//   List<String> imageOptions; // Replace 'imageOptions' with the actual field name
//   String videoOption; // Replace 'videoOption' with the actual field name
// }

// class Question {
//   Question({
//     required this.question,
//     required this.answers,
//     required this.correctAnswerIndex,
//     required this.levelType,
//     required this.userAnsweredCorrectly,
//   });

//   factory Question.fromQuestionModel(QuestionModel model, int levelType) {
//     final List<String> answers = []
//       ..add(model.correctAnswer)
//       ..addAll(model.incorrectAnswers)
//       ..shuffle();
//     final index = answers.indexOf(model.correctAnswer);

//     return Question(
//       question: model.question,
//       answers: answers,
//       correctAnswerIndex: index,
//       levelType: levelType,
//       userAnsweredCorrectly: false, // Set initially to false
//     );
//   }

//   String question;
//   List<String> answers;
//   int correctAnswerIndex;
//   int chosenAnswerIndex = -1; // Initialize to -1
//   int levelType; // Add a property to store the level type (text, image, video)
//   bool userAnsweredCorrectly; // Add a property to track if the user answered correctly

//   bool isCorrect(String answer) {
//     return answers.indexOf(answer) == correctAnswerIndex;
//   }

//   bool isChosen(String answer) {
//     return answers.indexOf(answer) == chosenAnswerIndex;
//   }

//   void setUserAnswer(String answer) {
//     chosenAnswerIndex = answers.indexOf(answer);
//     userAnsweredCorrectly = isCorrect(answer);
//   }
// }
// class QuestionModel {
//   QuestionModel({
//     required this.question,
//     required this.correctAnswer,
//     required this.incorrectAnswers,
//     required this.imageOptions,
//     required this.videoOption,
//     required this.score, // Add score property
//     required this.wrongAnswers, // Add wrongAnswers property
//     required this.correctAnswers, // Add correctAnswers property
//     required this.notAnsweredQuestions, // Add notAnsweredQuestions property
//   });

//   factory QuestionModel.fromJson(Map<String, dynamic> json) {
//     return QuestionModel(
//       question: json['question'],
//       correctAnswer: json['correct_answer'],
//       incorrectAnswers: List<String>.from(json['incorrect_answers']),
//       imageOptions: json['image_options'], // Replace 'image_options' with the actual field name
//       videoOption: json['video_option'], // Replace 'video_option' with the actual field name
//       score: 0, // Initialize score to 0
//       wrongAnswers: 0, // Initialize wrongAnswers to 0
//       correctAnswers: 0, // Initialize correctAnswers to 0
//       notAnsweredQuestions: 0, // Initialize notAnsweredQuestions to 0
//     );
//   }

//   String question;
//   String correctAnswer;
//   List<String> incorrectAnswers;
//   List<String> imageOptions; // Replace 'imageOptions' with the actual field name
//   String videoOption; // Replace 'videoOption' with the actual field name
//   int score;
//   int wrongAnswers;
//   int correctAnswers;
//   int notAnsweredQuestions;
// }
// class QuestionModel {
//   QuestionModel({
//     required this.question,
//     required this.correctAnswer,
//     required this.incorrectAnswers,
//     required this.imageOptions,
//     required this.videoOption,
//     required this.score,
//     required this.wrongAnswers,
//     required this.correctAnswers,
//     required this.notAnsweredQuestions,
//   });

//   String question;
//   String correctAnswer;
//   List<String> incorrectAnswers;
//   List<String> imageOptions;
//   String videoOption;
//   int score;
//   int wrongAnswers;
//   int correctAnswers;
//   int notAnsweredQuestions;
// }
class QuestionModel {
  QuestionModel({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.imageOptions,
    required this.videoOption,
    required this.score,
    required this.wrongAnswers,
    required this.correctAnswers,
    required this.notAnsweredQuestions,
  });

  String question;
  String correctAnswer;
  List<String> incorrectAnswers;
  List<String> imageOptions;
  String videoOption;
  int score;
  int wrongAnswers;
  int correctAnswers;
  int notAnsweredQuestions;

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
      imageOptions: List<String>.from(json['image_options']),
      videoOption: json['video_option'],
      score: json['score'],
      wrongAnswers: json['wrong_answers'],
      correctAnswers: json['correct_answers'],
      notAnsweredQuestions: json['not_answered_questions'],
    );
  }
}
