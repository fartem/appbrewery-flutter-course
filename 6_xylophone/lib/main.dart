import 'package:flutter/cupertino.dart';
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
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildKey(Colors.red, 1),
            _buildKey(Colors.orange, 2),
            _buildKey(Colors.yellow, 3),
            _buildKey(Colors.green, 4),
            _buildKey(Colors.teal, 5),
            _buildKey(Colors.blue, 6),
            _buildKey(Colors.purple, 7)
          ],
        ),
      ),
    );
  }
  
  Expanded _buildKey(Color color, int note) {
    return Expanded(
      // ignore: missing_required_param
      child: FlatButton(
        color: color,
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
