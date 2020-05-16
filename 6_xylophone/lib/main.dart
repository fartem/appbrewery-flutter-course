import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(
  XylophoneApp()
);

class XylophoneApp extends StatelessWidget {
  final _keyColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildKey(1),
            _buildKey(2),
            _buildKey(3),
            _buildKey(4),
            _buildKey(5),
            _buildKey(6),
            _buildKey(7)
          ],
        ),
      ),
    );
  }
  
  Expanded _buildKey(int note) {
    return Expanded(
      // ignore: missing_required_param
      child: FlatButton(
        color: _keyColors[note - 1],
        onPressed: () {
          _playSound(note);
        },
      ),
    );
  }

  void _playSound(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }
}
