import 'package:exemplo_k2mini/routes.dart';
import 'package:exemplo_k2mini/sinaleiro.dart';
import 'package:exemplo_k2mini/som.dart';
import 'package:flutter/material.dart';
import 'impressora.dart';
import 'leitor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemplo K2 Mini - TecToy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(),
      routes: {
        Routes.leitor: (_) => const Leitor(),
        Routes.impressora: (_) => const Impressora(),
        Routes.som: (_) => const Som(),
        Routes.sinaleiro: (_) => const Sinaleiro(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Exemplo K2 Mini - TecToy'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed(Routes.leitor);
            }, child: Text('Leitor')),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed(Routes.impressora);
            }, child: Text('Impressora')),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed(Routes.som);
            }, child: Text('Som')),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed(Routes.sinaleiro);
            }, child: Text('Sinaleiro'))
          ],
        ),
      ),
    );
  }
}
