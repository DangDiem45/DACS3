import 'package:flutter/cupertino.dart';

class SelectedOption {
  final String questionId;
  final String optionId;

  SelectedOption(this.questionId, this.optionId);

  Map<String, dynamic> toJson() {
    return {
      questionId: optionId,
    };
  }
}

class SelectedOption1 {
  final String questionId;
  final String optionId;

  SelectedOption1(this.questionId, this.optionId);
}


