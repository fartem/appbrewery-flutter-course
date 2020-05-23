import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(
  Quizzler()
);

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10
            ),
            child: _QuizPage(),
          ),
        ),
      ),
    );
  }
}

class _QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<_QuizPage> {
  List<Icon> _scoreKeeper = [];

  List<Question> _questions = [
    Question(
        text: 'You can lead a cow down stairs but not up stairs.',
        answer: false
    ),
    Question(
        text: 'Approximately one quarter of human bones are in the feet.',
        answer: true
    ),
    Question(
        text: 'A slug\'s blood is green.',
        answer: false
    )
  ];

  int _questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                _questions[_questionNumber].text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
              onPressed: () {
                bool correctAnswer = _questions[_questionNumber].answer;
                if (correctAnswer) {

                }
                setState(() {
                  _questionNumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
              onPressed: () {
                bool correctAnswer = _questions[_questionNumber].answer;
                if (!correctAnswer) {

                }
                setState(() {
                  _questionNumber++;
                });
              },
            ),
          ),
        ),
        Row(
          children: _scoreKeeper,
        )
      ],
    );
  }
}
