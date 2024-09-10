import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyTextWidget(), // Aquí se agrega el nuevo widget
          ],
        ),
      ),
    );
  }
}

class MyTextWidget extends StatefulWidget {
  const MyTextWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTextWidgetState createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: Text('221236 Carlos Ivan Cruz Zarmiento')),
            Icon(Icons.phone),
            SizedBox(width: 20), // Espacio entre los íconos
            Icon(Icons.message),
          ],
        ),
        SizedBox(height: 50),
        Row(
          children: [
            Expanded(child: Text('221238 Samuel Alberto Escobar Hernandez')),
            Icon(Icons.phone),
            SizedBox(width: 20), // Espacio entre los íconos
            Icon(Icons.message),
          ],
        ),
        SizedBox(height: 50),
        Row(
          children: [
            Expanded(child: Text('221263 Jesus David Ruiz Garcia')),
            Icon(Icons.phone),
            SizedBox(width: 20), // Espacio entre los íconos
            Icon(Icons.message),
          ],
        ),
      ],
    );
  }
}