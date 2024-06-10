class ScoreResponse {
  final int correctAnswers;
  final int totalQuestions;

  ScoreResponse({
    required this.correctAnswers,
    required this.totalQuestions,
  });

  factory ScoreResponse.fromJson(Map<String, dynamic> json) {
    return ScoreResponse(
      correctAnswers: json['correctAnswers'],
      totalQuestions: json['totalQuestions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'correctAnswers': correctAnswers,
      'totalQuestions': totalQuestions,
    };
  }
}