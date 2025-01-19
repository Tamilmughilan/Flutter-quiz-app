import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quiz_model.dart';

class ApiService {
  static const String _url = 'https://api.jsonserve.com/Uw5CrX';

  static Future<QuizModel> fetchQuiz() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return QuizModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load quiz data');
    }
  }
}
