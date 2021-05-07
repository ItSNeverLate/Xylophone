import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayerPage(),
    );
  }
}

class PlayerPage extends StatelessWidget {
  final player = AudioCache();

  void _playNote(int noteNumber) {
    player.play('assets_note$noteNumber.wav');
  }

  Expanded _playButton(String noteName, Color color, int noteNumber) =>
      Expanded(
        child: Container(
          width: window.physicalSize.width,
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0 * noteNumber,
          ),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: color),
            child: Container(
              child: Text(
                noteName,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            onPressed: () => _playNote(noteNumber),
            // child: Expanded(),
          ),
        ),
      );

  // );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _playButton('C', Colors.red, 1),
        _playButton('D', Colors.orange, 2),
        _playButton('E', Colors.yellow, 3),
        _playButton('F', Colors.green, 4),
        _playButton('G', Colors.teal, 5),
        _playButton('A', Colors.blueAccent, 6),
        _playButton('B', Colors.purple, 7),
      ],
    ));
  }
}
