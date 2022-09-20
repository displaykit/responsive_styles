import 'package:flutter/material.dart';
import 'package:responsive_styles/responsive_styles.dart';
import 'package:with_flutter_sample/chat_app_screen/chat_app_screen.dart';
import 'package:with_flutter_sample/flutter_basic/flutter_basic.dart';
import 'package:with_flutter_sample/holy_grail_layout/holy_grail_layout.dart';
import 'package:with_flutter_sample/todo_app/screens/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'sans-serif',
        primarySwatch: Colors.orange,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/flutter-basic': (context) =>
            const FlutterBasic(title: 'Flutter Demo Home Page'),
        '/holy-grail-layout': (context) => const HolyGrailLayoutScreen(),
        '/chat-app': (context) => const ChatAppScreen(),
        ...todoAppRoutes
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const links = [
      {"name": 'Flutter Basic Screen', "href": "/flutter-basic"},
      {"name": 'Holy Grail Layout Screen', "href": "/holy-grail-layout"},
      {"name": 'Chat App Screen', "href": "/chat-app"},
      {"name": 'Todo App Sample', "href": "/$appRoutesNamespace"},
    ];
    return Scaffold(
      body: Center(
        child: GridItem(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Skynex UI Responsive Stylesheet!',
              style: TextStyle(fontSize: 24),
            ),
            ...links.map((link) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text(link["name"] as String),
                  onPressed: () =>
                      Navigator.pushNamed(context, link["href"] as String),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
