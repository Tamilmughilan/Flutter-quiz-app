import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import 'result_screen.dart';


class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final quiz = provider.quiz;

    if (provider.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text(quiz?.title ?? 'Quiz')),
      body: Column(
        children: [
          Text(
            quiz!.questions[_currentQuestionIndex].description,
            style: const TextStyle(fontSize: 18),
          ),
          ...quiz.questions[_currentQuestionIndex].options.map((option) {
            return ElevatedButton(
              onPressed: () {
                if (option.isCorrect) {
                  _score += 4;
                } else {
                  _score -= 1;
                }

                if (_currentQuestionIndex < quiz.questions.length - 1) {
                  setState(() {
                    _currentQuestionIndex++;
                  });
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(score: _score),
                    ),
                  );
                }
              },
              child: Text(option.description),
            );
          }).toList(),
        ],
      ),
    );
  }
}
