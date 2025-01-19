import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class QuizOption extends StatelessWidget {
  final Option option;
  final VoidCallback onSelect;

  const QuizOption({Key? key, required this.option, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.blueAccent,
        ),
        child: Text(
          option.description,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
