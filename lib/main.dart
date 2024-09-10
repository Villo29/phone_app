import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone and SmS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Phone and SmS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  // ignore: unused_element
  void _launchCaller(String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(launchUri);
  }

  // ignore: unused_element
  void _launchSMS(String number, String message) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: number,
      queryParameters: {'body': message},
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyTextWidget(controller: _controller),
            const SizedBox(height: 20),
            TextFieldClass(controller: _controller),
            const SizedBox(height: 20),
            ButtonStyleClass(
              onPressed: () {
                // Acción del botón
                // ignore: avoid_print
                print('Button pressed: ${_controller.text}');
              },
              text: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextWidget extends StatefulWidget {
  final TextEditingController controller;

  const MyTextWidget({super.key, required this.controller});

  @override
  // ignore: library_private_types_in_public_api
  _MyTextWidgetState createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> {
  void _launchCaller(String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(launchUri);
  }

  void _launchSMS(String number) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: number,
      queryParameters: {'body': widget.controller.text},
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Text('221236 Carlos Ivan Cruz Zarmiento')),
            IconButton(
              icon: const Icon(Icons.phone),
              onPressed: () => _launchCaller('9681096112'),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () => _launchSMS('9681096112'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Expanded(child: Text('221238 Samuel Alberto Escobar Hernandez')),
            IconButton(
              icon: const Icon(Icons.phone),
              onPressed: () => _launchCaller('9651062634'),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () => _launchSMS('9651062634'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Expanded(child: Text('221263 Jesus David Ruiz Garcia')),
            IconButton(
              icon: const Icon(Icons.phone),
              onPressed: () => _launchCaller('9612835436'),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () => _launchSMS('9612835436'),
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonStyleClass extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ButtonStyleClass({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: Text(text),
    );
  }
}

class TextFieldClass extends StatelessWidget {
  final TextEditingController controller;

  const TextFieldClass({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Ingresa el mensaje de Textoy',
      ),
    );
  }
}