import 'package:flutter/cupertino.dart';

import 'base_provider.dart';


class QuestionProvider extends BaseProvider{

  late int _selectedQuestionId;
  int get selectedSubjectId => _selectedQuestionId;
  void setSelectedQuestionId(int id){
    _selectedQuestionId=id;
    notifyListeners();
  }

}