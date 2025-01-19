class QuizModel {
  final String title;
  final String description;
  final List<Question> questions;

  QuizModel({required this.title, required this.description, required this.questions});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      questions: (json['questions'] as List<dynamic>)
          .map((q) => Question.fromJson(q))
          .toList(),
    );
  }
}

class Question {
  final String description;
  final List<Option> options;
  final int correctAnswerId;

  Question({
    required this.description,
    required this.options,
    required this.correctAnswerId,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      description: json['description'] ?? '',
      correctAnswerId: json['options']
          .indexWhere((option) => option['is_correct'] == true),
      options: (json['options'] as List<dynamic>)
          .map((o) => Option.fromJson(o))
          .toList(),
    );
  }
}

class Option {
  final String description;
  final bool isCorrect;

  Option({required this.description, required this.isCorrect});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      description: json['description'] ?? '',
      isCorrect: json['is_correct'] ?? false,
    );
  }
}
