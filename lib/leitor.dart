import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Leitor extends StatefulWidget {
  const Leitor({super.key});

  @override
  State<Leitor> createState() => _LeitorState();
}

class _LeitorState extends State<Leitor> {
  String _code = '';
  String _lido = '';

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey.keyLabel;

    if (event is KeyUpEvent) {
      if (key != 'Enter') {
        _lido = _lido + key;
      } else {
        setState(() {
          _code = _lido;
        });
        _lido = '';
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  void dispose() {
    ServicesBinding.instance.keyboard.removeHandler(_onKey);
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leitor QRCode e Barras'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Passe o código de barras do produto no leitor',
              style: TextStyle(fontSize: 36),
            ),
            Text(
              _code,
              style: const TextStyle(fontSize: 48),
            ),

          ],
        ),
      ),
    );
  }
}
