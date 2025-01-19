import 'package:flutter/foundation.dart';
import '../models/quiz_model.dart';
import '../services/api_service.dart';

class QuizProvider with ChangeNotifier {
  QuizModel? _quiz;
  bool _loading = true;

  QuizModel? get quiz => _quiz;
  bool get loading => _loading;

  Future<void> loadQuiz() async {
    _loading = true;
    notifyListeners();

    try {
      _quiz = await ApiService.fetchQuiz();
    } catch (e) {
      // Handle error
      print('Error loading quiz: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
