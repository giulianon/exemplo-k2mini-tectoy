import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Som extends StatefulWidget {
  const Som({super.key});

  @override
  State<Som> createState() => _SomState();
}

class _SomState extends State<Som> {
  final player = AudioPlayer();

  Future<void> _tocar() async {
    player.setAsset('assets/passe.mp3');
    await player.play();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Som'),
      ),
      body: Center(
        child:  ElevatedButton(
          onPressed: _tocar,
          child: const Text('Tocar'),
        ),
      ),
    );
  }
}
