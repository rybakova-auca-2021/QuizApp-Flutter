import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] == data['correct_answer'];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircularIndex(isCorrect, data['question_index'] as int),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildText(data['question'] as String, Colors.white),
                        const SizedBox(height: 5),
                        _buildText(data['user_answer'] as String,
                            isCorrect ? Colors.blue : Colors.pink),
                        _buildText(data['correct_answer'] as String,
                            const Color.fromARGB(255, 2, 26, 43)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildText(String text, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 16),
    );
  }
}

class CircularIndex extends StatelessWidget {
  final bool isCorrect;
  final int questionIndex;

  const CircularIndex(this.isCorrect, this.questionIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCorrect ? Colors.blue : Colors.pink,
      ),
      child: Center(
        child: Text(
          (questionIndex + 1).toString(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
