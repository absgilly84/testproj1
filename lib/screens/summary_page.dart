// import 'package:flutter/material.dart';
// import 'package:testproj1/models/app_state.dart'; // Replace with your actual model import
// import '../widgets/summaryAnswers_widget.dart'; // Import your SummaryAnswers widget

// class SummaryPage extends StatelessWidget {
//   const SummaryPage({required Key key, required this.appState}) : super(key: key);

//   final AppState appState; // Replace with your actual model

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Summary'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: appState.questions.length,
//               itemBuilder: (context, index) {
//                 final question = appState.questions[index];
//                 return SummaryAnswers(index: index + 1, question: question, key: null,);
//               },
//             ),
//           ),
//           _buildStats(),
//         ],
//       ),
//     );
//   }

//   Widget _buildStats() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Stats:',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Correct Answers: ${appState.correctAnswers.length}',
//             style: const TextStyle(fontSize: 16),
//           ),
//           Text(
//             'Wrong Answers: ${appState.wrongAnswers.length}',
//             style: const TextStyle(fontSize: 16),
//           ),
//           Text(
//             'Unanswered: ${appState.unansweredQuestions.length}',
//             style: const TextStyle(fontSize: 16),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Total Score: ${appState.totalScore}',
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/models/app_state.dart';
// import '../widgets/summaryAnswers_widget.dart';

// class SummaryPage extends StatelessWidget {
//   const SummaryPage({Key? key, required this.appState}) : super(key: key);

//   final AppState appState;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Summary'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: appState.questions.length,
//               itemBuilder: (context, index) {
//                 final question = appState.questions[index];
//                 return SummaryAnswers(
//                   index: index + 1,
//                   question: question,
//                 );
//               },
//             ),
//           ),
//           _buildStats(),
//         ],
//       ),
//     );
//   }

//   Widget _buildStats() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Stats:',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Correct Answers: ${appState.correctAnswers}',
//             style: const TextStyle(fontSize: 16),
//           ),
//           Text(
//             'Wrong Answers: ${appState.wrongAnswers}',
//             style: const TextStyle(fontSize: 16),
//           ),
//           Text(
//             'Unanswered: ${appState.questions.length - (appState.correctAnswers + appState.wrongAnswers)}',
//             style: const TextStyle(fontSize: 16),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Total Score: ${appState.totalScore}',
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testproj1/models/app_state.dart';
// import '../widgets/summaryAnswers_widget.dart';

// class SummaryPage extends StatelessWidget {
//   const SummaryPage({Key? key, required this.appState}) : super(key: key);

//   final AppState appState;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Summary'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: appState.questions.length,
//               itemBuilder: (context, index) {
//                 final question = appState.questions[index];
//                 return SummaryAnswers(
//                   index: index + 1,
//                   question: question,
//                 );
//               },
//             ),
//           ),
//           _buildStats(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildStats(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Stats:',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Correct Answers: ${appState.correctAnswers}',
//             style: const TextStyle(fontSize: 16),
//           ),
//           Text(
//             'Wrong Answers: ${appState.wrongAnswers}',
//             style: const TextStyle(fontSize: 16),
//           ),
//           Text(
//             'Unanswered: ${appState.questions.length - (appState.correctAnswers + appState.wrongAnswers)}',
//             style: const TextStyle(fontSize: 16),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Total Score: ${appState.totalScore}',
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
