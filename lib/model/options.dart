class Options{
  late final int id;
  late final int question_id;
  late final String content;
  late final int is_correct;
  Options({required this.id, required this.question_id, required this.content, required this.is_correct,});

  factory Options.fromJson(Map<String, dynamic> json){
    return Options(
        id: json['id'],
        content:json['content'],
        is_correct:json['is_correct'],
        question_id:json['question_id']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['is_correct'] = this.is_correct;
    data['question_id'] = this.question_id;
    return data;
  }
}