// question_model.dart

class QuestionModel {
  QuestionModel({
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
    this.imageOptions,
    this.videoOption,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: (json['incorrect_answers'] as List).cast<String>(),
      imageOptions: json['image_options'], // Replace 'image_options' with the actual field name
      videoOption: json['video_option'], // Replace 'video_option' with the actual field name
    );
  }

  String question;
  String correctAnswer;
  List<String> incorrectAnswers;
  List<String> imageOptions; // Replace 'imageOptions' with the actual field name
  String videoOption; // Replace 'videoOption' with the actual field name
}

class Question {
  Question({
    this.question,
    this.answers,
    this.correctAnswerIndex,
    this.levelType,
    this.userAnsweredCorrectly,
  });

  factory Question.fromQuestionModel(QuestionModel model, int levelType) {
    final List<String> answers = []
      ..add(model.correctAnswer)
      ..addAll(model.incorrectAnswers)
      ..shuffle();
    final index = answers.indexOf(model.correctAnswer);

    return Question(
      question: model.question,
      answers: answers,
      correctAnswerIndex: index,
      levelType: levelType,
    );
  }

  String question;
  List<String> answers;
  int correctAnswerIndex;
  int chosenAnswerIndex;
  int levelType; // Add a property to store the level type (text, image, video)
  bool userAnsweredCorrectly; // Add a property to track if the user answered correctly

  bool isCorrect(String answer) {
    return answers.indexOf(answer) == correctAnswerIndex;
  }

  bool isChosen(String answer) {
    return answers.indexOf(answer) == chosenAnswerIndex;
  }

  void setUserAnswer(String answer) {
    chosenAnswerIndex = answers.indexOf(answer);
    userAnsweredCorrectly = isCorrect(answer);
  }
}
