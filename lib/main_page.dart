import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage(this.switchScreen, {super.key});

  final void Function() switchScreen;
  
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300, color: const Color.fromARGB(200, 255, 255, 255),),
          const SizedBox(height: 50),
          const Text("Learn Flutter the fun way!", style: TextStyle(color: Colors.white, fontSize: 30)),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: switchScreen,
            style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  foregroundColor: const Color.fromARGB(255, 254, 155, 188),
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            icon: const Icon(Icons.arrow_right_alt),    
            label: const Text('Start Quiz')
          )
        ],
      );
  }
}