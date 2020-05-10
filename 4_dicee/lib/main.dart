import 'package:flutter/material.dart';

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

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var leftDiceNumber = 1;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {

              },
              child: Image.asset(
                  'images/dice$leftDiceNumber.png'
              ),
            )
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {

              },
              child: Image.asset(
                  'images/dice2.png'
              ),
            ),
          )
        ],
      ),
    );
  }
}
