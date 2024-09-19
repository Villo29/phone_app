import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:phone_app/pages/chat.dart'; // Importa el archivo chat.dart

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatApp()),
        );
      }
    });
  }

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
      queryParameters: {'body': Uri.encodeComponent('Hello from Home Page!')},
    );
    await launchUrl(launchUri);
  }

  void _launchGitHub() async {
    const url = 'https://github.com/tu-repositorio'; // Reemplaza con la URL de tu repositorio
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.code),
              onPressed: _launchGitHub,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyTextWidget(controller: _controller),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.http),
            label: 'HTTP',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MyTextWidget extends StatefulWidget {
  final TextEditingController controller;

  const MyTextWidget({super.key, required this.controller});

  @override
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
      queryParameters: {'body': Uri.encodeComponent(widget.controller.text)},
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https://via.placeholder.com/150', // URL de la imagen
          width: 150,
          height: 150,
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