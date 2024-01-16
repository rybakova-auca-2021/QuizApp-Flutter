import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'main_page.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'main-page';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == 'main-page' 
    //               ? MainPage(switchScreen) 
    //               : const Questions();

    Widget screenWidget =  MainPage(switchScreen);
    if(activeScreen == 'questions-screen') {
      screenWidget = Questions(onSelectAnswer: chooseAnswer);
    } 

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers);
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