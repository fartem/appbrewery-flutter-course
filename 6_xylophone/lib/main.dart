import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(
  XylophoneApp()
);

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  _playSound(1);
                },
              ),
              FlatButton(
                color: Colors.orange,
                onPressed: () {
                  _playSound(2);
                },
              ),
              FlatButton(
                color: Colors.yellow,
                onPressed: () {
                  _playSound(3);
                },
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  _playSound(4);
                },
              ),
              FlatButton(
                color: Colors.teal,
                onPressed: () {
                  _playSound(5);
                },
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  _playSound(6);
                },
              ),
              FlatButton(
                color: Colors.purple,
                onPressed: () {
                  _playSound(7);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _playSound(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }
}
