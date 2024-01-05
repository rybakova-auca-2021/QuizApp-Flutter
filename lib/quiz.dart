import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'main_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'main-page';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == 'main-page' 
    //               ? MainPage(switchScreen) 
    //               : const Questions();

    Widget screenWidget =  MainPage(switchScreen);
    if(activeScreen == 'questions-screen') {
      screenWidget = const Questions();
    } else {
      screenWidget = MainPage(switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor:  const Color.fromARGB(255, 254, 155, 188),
        body: Center(
          child: screenWidget
          )
        ),
      );
  }
}