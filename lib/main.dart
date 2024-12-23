import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String quiz = "";

  Future<String> getNuberTrival() async {
    Response result = await Dio().get('http://numbersapi.com/random/trivia');
    String trivia = result.data;
    print(trivia);
    return trivia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.pinkAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  quiz,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            //newQuiz
            SizedBox(
              height: 42,
              child: ElevatedButton(
                onPressed: () async {
                  String trivia = await getNuberTrival();
                  setState(() {
                    quiz = trivia;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white)),
                child: const Text(
                  "NewQuiz",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
