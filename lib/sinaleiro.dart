import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Sinaleiro extends StatefulWidget {
  const Sinaleiro({super.key});

  @override
  State<Sinaleiro> createState() => _SinaleiroState();
}

class _SinaleiroState extends State<Sinaleiro> {

  final MethodChannel _channel = MethodChannel('sunmi_lamp_service');

  Future<void> _ligar() async {
    try {
      _channel.invokeMethod('controlLamp', <String, dynamic>{'status': 0, 'lamp': 'Led-1',},);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _piscar() async {
    try {
      _channel.invokeMethod('controlLampForLoop', <String, dynamic>{'status': 0, 'lamp': 'Led-1',},);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _desligar() async {
    try {
      _channel.invokeMethod('closeAllLamp');
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sinaleiro'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _ligar();
              },
              child: const Text('Ligar'),
            ),
            ElevatedButton(
              onPressed: () {
                _piscar();
              },
              child: const Text('Piscar'),
            ),
            ElevatedButton(
              onPressed: () {
                _desligar();
              },
              child: const Text('Desligar'),
            )
          ]
        ),
    ));
  }
}
