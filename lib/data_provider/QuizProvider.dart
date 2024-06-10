import 'dart:async';
import 'dart:convert';

import 'package:dacs3_1/data_provider/base_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/services/question_service.dart';
import '../model/lecture.dart';
import '../model/questions.dart';
import '../model/score_reponse.dart';
import '../model/select_option.dart';
import '../model/subjects.dart';


class QuizProvider extends BaseProvider {
  final QuestionService _questionService = QuestionService();

  late int _selectedSubjectId;
  int get selectedSubjectId => _selectedSubjectId;
  void setSelectedSubjectId(int id){
    _selectedSubjectId=id;
    notifyListeners();
  }

  late int _selectedLectureId;
  int get selectedLectureId => _selectedLectureId;
  void setSelectedLectureId(int id){
    _selectedLectureId=id;
    notifyListeners();
  }

  late int _selectedQuestionId;
  int get selectedQuestionId => _selectedQuestionId;
  void setSelectedQuestionId(int id){
    _selectedQuestionId=id;
    notifyListeners();
  }



  List<SelectedOption> _selectedOptions = [];

  List<SelectedOption> get selectedOptions => _selectedOptions;

  void addSelectedOption(String questionId, String optionId) {
    _selectedOptions.add(SelectedOption(questionId, optionId));
    notifyListeners();
  }

  void removeSelectedOption(int questionId, int optionId) {
    _selectedOptions.removeWhere(
            (selectedOption) =>
        selectedOption.questionId == questionId &&
            selectedOption.optionId == optionId);
    notifyListeners();
  }

  void clearSelectedOptions() {
    _selectedOptions.clear();
    notifyListeners();
  }

  List<Map<String, dynamic>> toJson() {
    return _selectedOptions.map((selectedOption) => selectedOption.toJson()).toList();
  }

  Future<List<Subject>> getSubjectData() async {
    setBusy(true);
    var response = await _questionService.getSubject();
    if (response.statusCode == 200) {
      try {
        final List<dynamic> dataList = response.data['data'] as List;
        final subjects = dataList.map((item) => Subject.fromJson(item)).toList();
        return subjects;
      } catch (e) {
        print('rơi vào catch rồi: $e');
        throw Exception("");
      }
    } else {
      setBusy(false);
      throw Exception('Failed to load subject data');
    }
  }

  Future<List<Lecture>> getLectureBySubjectIdData(int subjectId) async {
    setBusy(true);
    var response = await _questionService.getLecturesBySubjectId(subjectId);
    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] as List;
      final lectures = dataList.map((item) => Lecture.fromJson(item)).toList();
      return lectures;
    } else {
      setBusy(false);
      throw Exception('Failed to load subject data');
    }
  }

  Future<List<Question>> getQuestionsByLectureIdData(int lectureId) async {
    setBusy(true);
    var response = await _questionService.getQuestionsByLectureId(lectureId);
    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] as List;
      final questions=dataList.map((item) => Question.fromJson(item)).toList();
      return questions;
    } else {
      setBusy(false);
      throw Exception('Failed to load subject data');
    }
  }

  Future<int> getQuestionbyLectureIdCountData(int lectureId) async{
    setBusy(true);
    bool tokenExist = await getToken();
    if (tokenExist) {
      var response = await _questionService.httpGetQuestionCount('lectures/$lectureId/questions/count');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final int questionCount = responseData['question_count'];
        return questionCount;
      }
      else {
        setBusy(false);
        return 0;
      }
    } else {
      setBusy(false);
      throw Exception('Failed to load question data');
    }
  }

  Future<void> goToScoreScreen(int lecture_id) async {
    // Navigator.pushReplacementNamed(context, '/score');
  }


  Future<void> goToQuestionScreen(int questionId) async {
    // Thực hiện các thao tác cần thiết để chuyển sang màn hình câu hỏi với id được cung cấp, ví dụ:
    // Navigator.pushReplacementNamed(context, '/question/$questionId');
  }

  Future<String> submitAnswers(int lectureId) async {
    final Map<String, String> answers = Map.fromIterable(
      selectedOptions,
      key: (option) => option.questionId,
      value: (option) => option.optionId,
    );

    final response = await _questionService.answerQuestion(lectureId, answers);
    if (response.statusCode == 200) {
      final String data =  await response.data["data"]["score"];
      // final result=dataList.map((item) => ScoreResponse.fromJson(item)).toList();
      return  data;
    } else {
      throw Exception('Failed to submit answers');
    }
  }

  Future<bool> getToken() async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    var token = prefs.getString('access_token');
    print(token);
    if(token != null){
      return true;
    }
    return false;
  }

  void notifyListenersAfterBuild() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifyListeners();
    });
  }



}
