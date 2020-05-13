import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
    new MaterialApp(
      home: BallPage(),
    )
);

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
            'Ask Me Anything'
        ),
      ),
      body: Container(
        child: Center(
          child: _Ball(),
        ),
      ),
    );
  }
}

class _Ball extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BallState();
}

class _BallState extends State<_Ball> with SingleTickerProviderStateMixin {
  int _ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          _updateBall();
        });
      },
      child: Image.asset(
          'images/ball$_ballNumber.png'
      ),
    );
  }

  void _updateBall() {
    _ballNumber = new Random().nextInt(5) + 1;
  }
}
