import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          'Dicee'
        ),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ),
  )
);

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  int _leftDiceNumber = 1;
  int _rightDiceNumber = 1;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() => _dicee());
                },
                child: Image.asset(
                    'images/dice$_leftDiceNumber.png'
                ),
              )
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() => _dicee());
              },
              child: Image.asset(
                  'images/dice$_rightDiceNumber.png'
              ),
            ),
          )
        ],
      ),
    );
  }

  void _dicee() {
    _leftDiceNumber = _randomDiceNumber();
    _rightDiceNumber = _randomDiceNumber();
  }

  int _randomDiceNumber() {
    return Random().nextInt(6) + 1;
  }
}
