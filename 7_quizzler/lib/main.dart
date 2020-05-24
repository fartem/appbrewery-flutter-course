import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain _quizBrain = QuizBrain();

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
                _quizBrain.getQuestionText(),
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
                _checkAnswer(true);
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
                _checkAnswer(false);
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

  void _checkAnswer(bool userPickedAnswer) {
    if (_quizBrain.isLastQuestion()) {
      _quizBrain.reset();
      _scoreKeeper = [];
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You have reached the end of the quiz.'
      ).show();
      setState(() {});
    } else {
      bool correctAnswer = _quizBrain.getQuestionAnswer();
      if (userPickedAnswer == correctAnswer) {
        _scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            )
        );
      } else {
        _scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            )
        );
      }
      setState(() {
        _quizBrain.nextQuestion();
      });
    }
  }
}
