// import 'package:flutter/material.dart';
// import 'package:testproj1/models/question_model.dart';

// class VideoLevelPage extends StatelessWidget {
//   final QuestionModel question;

//   const VideoLevelPage({Key key, this.question}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Media Deepfake Recognition'), // Updated title
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(question.question), // Display the question
//           SizedBox(height: 20),
//           // Display video player or video options based on your game logic
//           // You need to implement the logic for displaying and handling videos
//           // For example, you can use a video player package or custom video widgets
//           // Add your UI widgets to display videos based on your game's requirements
//           // Ensure to handle user interactions and answer selection
//           // For example, you can use a function like handleAnswer(videoOption);
//           // Display additional information based on the question, e.g., question.videoOption
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
// import 'package:video_player/video_player.dart';


// class VideoLevelPage extends StatefulWidget {
//   final QuestionModel question;

//   const VideoLevelPage({Key key, this.question}) : super(key: key);

//   @override
//   _VideoLevelPageState createState() => _VideoLevelPageState();
// }

// class _VideoLevelPageState extends State<VideoLevelPage> {
//   bool isVideoPlaying = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Media Deepfake Recognition'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(widget.question.question),
//           SizedBox(height: 20),
//           // Display video player or video options based on your game logic
//           isVideoPlaying
//               ? Container(
//                   // Use your preferred video player package or widget here
//                   // Example: video_player package
//                   child: VideoPlayer(videoController),
//                 )
//               : ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       isVideoPlaying = true;
//                     });
//                     // Play the video when the button is pressed
//                     // Implement your video play logic here
//                     playVideo();
//                   },
//                   child: Text('Play Video'),
//                 ),
//           // Add your UI widgets to display videos based on your game's requirements
//           // Ensure to handle user interactions and answer selection
//           // For example, you can use a function like handleAnswer(videoOption);
//           // Display additional information based on the question, e.g., widget.question.videoOption
//           // Display the score, number of wrong answers, number of correct answers, and not answered questions
//           Text('Score: ${widget.question.score}'),
//           Text('Wrong Answers: ${widget.question.wrongAnswers}'),
//           Text('Correct Answers: ${widget.question.correctAnswers}'),
//           Text('Not Answered Questions: ${widget.question.notAnsweredQuestions}'),
//         ],
//       ),
//     );
//   }

//   // Placeholder for video controller, you need to implement it based on your chosen video handling package
//   // Example: video_player package
//   late VideoPlayerController videoController;

//   // Placeholder function to play the video, you need to implement it based on your chosen video handling logic
//   // Example: video_player package
//   void playVideo() {
//     // Implement your video play logic here using videoController
//     // Example: videoController.play();
//   }

//   @override
//   void dispose() {
//     // Dispose of the video controller to free up resources
//     videoController.dispose();
//     super.dispose();
//   }
// }

// class VideoPlayerController {
// }
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:testproj1/models/question_model.dart';

class VideoLevelPage extends StatefulWidget {
  final QuestionModel question;

  const VideoLevelPage({Key key, this.question}) : super(key: key);

  @override
  _VideoLevelPageState createState() => _VideoLevelPageState();
}

class _VideoLevelPageState extends State<VideoLevelPage> {
  late VideoPlayerController _videoController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    // Initialize the VideoPlayerController with the video URL or asset path
    _videoController = VideoPlayerController.networkUrl('https:://www.example.com/sample.mp4' as Uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Deepfake Recognition'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.question.question),
          SizedBox(height: 20),
          _isVideoPlaying
              ? AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController),
                )
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isVideoPlaying = true;
                    });
                    _videoController.play();
                  },
                  child: Text('Play Video'),
                ),
          // Add your UI widgets for answer selection, score display, etc.
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the VideoPlayerController to free up resources
    _videoController.dispose();
    super.dispose();
  }
}