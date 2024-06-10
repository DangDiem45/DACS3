

import 'package:dacs3_1/model/options.dart';

class Question {
  late final int id;
  late final int lecture_id;
  late final String content;
  late List<Options> options;

  Question(
      {required this.id,
        required this.lecture_id,
        required this.content,
        required this.options
      }
      );
  factory Question.fromJson(Map<String, dynamic> json){
    return Question(
      id: json['id'],
      lecture_id: json['lecture_id'],
      content: json['content'],
      options: (json['options'] as List).map((item) => Options.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']=this.id;
    data['lecture_id']= this.lecture_id;
    data['content']=this.content;
    return data;
  }

}
