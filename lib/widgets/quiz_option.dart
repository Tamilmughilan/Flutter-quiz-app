import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class QuizOption extends StatefulWidget {
  final Option option;
  final VoidCallback onSelect;

  const QuizOption({Key? key, required this.option, required this.onSelect})
      : super(key: key);

  @override
  _QuizOptionState createState() => _QuizOptionState();
}

class _QuizOptionState extends State<QuizOption> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelect,
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _isHovered = true;
        }),
        onExit: (_) => setState(() {
          _isHovered = false;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              colors: [
                _isHovered ? Colors.purple.shade700 : const Color.fromARGB(255, 141, 131, 143),
                _isHovered ? Color.fromARGB(255, 152, 154, 153) : Color.fromARGB(255, 152, 154, 153),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.5),
                offset: const Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Text(
            widget.option.description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
