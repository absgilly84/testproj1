import 'package:flutter/material.dart';
import 'package:testproj1/models/question_model.dart'; // Update with your actual model import

class SummaryAnswers extends StatelessWidget {
  const SummaryAnswers({Key key, this.index, this.question}) : super(key: key);

  final int index;
  final QuestionModel question;

  Widget _buildAnswer(String answer, bool isCorrect, bool isChosen) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        answer,
        style: TextStyle(
          color: isChosen
              ? (isCorrect ? Colors.green : Colors.red)
              : Colors.black,
          fontWeight: isChosen ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blue, // Customize as needed
                  radius: 20,
                  child: Text(
                    '$index',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${question.question}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: question.incorrectAnswers.map((option) {
              return _buildAnswer(option, false, false);
            }).toList(),
          ),
          _buildAnswer(question.correctAnswer, true, false),
          SizedBox(height: 10),
          _buildExplanation(),
        ],
      ),
    );
  }

  Widget _buildExplanation() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explanation:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          // Assuming explanation is a field in your model
          Text(
            question.explanation ?? 'No explanation provided',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
