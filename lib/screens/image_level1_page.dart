// import 'package:flutter/material.dart';
// import 'package:testproj1/models/question_model.dart';

// class ImageLevel1Page extends StatelessWidget {
//   final QuestionModel question;

//   const ImageLevel1Page({required Key key, required this.question}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Media Headline Recognition'), // Updated title
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(question.question), // Display the question
//           const SizedBox(height: 20),
//           // Display image options based on question.imageOptions
//           for (String imageOption in question.imageOptions)
//             ElevatedButton(
//               onPressed: () {
//                 // Handle user's answer selection (you need to implement this logic)
//                 // For example, you can use a function like handleAnswer(imageOption);
//               },
//               child: Text(imageOption),
//             ),
//           const SizedBox(height: 20),
//           // Display the score, number of wrong answers, number of correct answers, and not answered questions
//           Text('Score: ${question.score}'),
//           Text('Wrong Answers: ${question.wrongAnswers}'),
//           Text('Correct Answers: ${question.correctAnswers}'),
//           Text('Not Answered Questions: ${question.notAnsweredQuestions}'),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/models/question_model.dart';

// class ImageLevel1Page extends StatelessWidget {
//   final QuestionModel question;

//   const ImageLevel1Page({Key? key, required this.question}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Media Headline Recognition'), // Updated title
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(question.question), // Display the question
//           const SizedBox(height: 20),
//           // Display image options based on question.imageOptions
//           for (String imageOption in question.imageOptions)
//             ElevatedButton(
//               onPressed: () {
//                 // Handle user's answer selection (you need to implement this logic)
//                 // For example, you can use a function like handleAnswer(imageOption);
//               },
//               child: Text(imageOption),
//             ),
//           const SizedBox(height: 20),
//           // Display the score, number of wrong answers, number of correct answers, and not answered questions
//           Text('Score: ${question.score}'),
//           Text('Wrong Answers: ${question.wrongAnswers}'),
//           Text('Correct Answers: ${question.correctAnswers}'),
//           Text('Not Answered Questions: ${question.notAnsweredQuestions}'),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:testproj1/models/question_model.dart';

class ImageLevel1Page extends StatelessWidget {
  const ImageLevel1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final question = QuestionModel(
      question: 'Sample question for Level 1',
      correctAnswer: 'Correct answer',
      incorrectAnswers: ['Incorrect answer 1', 'Incorrect answer 2'],
      imageOptions: ['Option 1', 'Option 2'],
      videoOption: 'Video option',
      score: 0,
      wrongAnswers: 0,
      correctAnswers: 0,
      notAnsweredQuestions: 0,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Media Headline Recognition')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(question.question), // Display the question
          const SizedBox(height: 20),
          // Display image options based on question.imageOptions
          for (String imageOption in question.imageOptions)
            ElevatedButton(
              onPressed: () {
                // Handle user's answer selection
                // For example, you can use a function like handleAnswer(imageOption);
              },
              child: Text(imageOption),
            ),
          const SizedBox(height: 20),
          // Display the score, number of wrong answers, number of correct answers, and not answered questions
          Text('Score: ${question.score}'),
          Text('Wrong Answers: ${question.wrongAnswers}'),
          Text('Correct Answers: ${question.correctAnswers}'),
          Text('Not Answered Questions: ${question.notAnsweredQuestions}'),
        ],
      ),
    );
  }
}
