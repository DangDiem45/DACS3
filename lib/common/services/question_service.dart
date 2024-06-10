import 'dart:convert';

import 'package:dacs3_1/common/services/http_util.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'base_api.dart';
class QuestionService{
  // HttpUtil().post(
  // 'api/courseList'

  Future<Response> getSubject() async {
    return await HttpUtil().get('api/subjects');

  }

  Future<Response> getLecturesBySubjectId(int subjectId) async {
    return await HttpUtil().get('api/get_lecture_by_subject_id/$subjectId');
  }

  Future<Response> getQuestionsByLectureId(int lectureId) async {
    return await HttpUtil().get('api/get_question_by_lecture_id/$lectureId');

  }

  Future<Response> answerQuestion(int lectureId, Map<String, dynamic> answer) async {
    return await HttpUtil().post1("api/answer/$lectureId",data: {'answers': answer});
  }

  Future<Response> httpGetQuestionCount(String endPath, {Map<String, String>? query}) async {
    return await HttpUtil().get(endPath, queryParameters: query);

  }


  // Future<Response> getSubject() async {
  //   return await api.httpGet('subjects');
  //
  // }
  //
  // Future<Response> getLecturesBySubjectId(int subjectId) async {
  //   return await api.httpGet("get_lecture_by_subject_id/$subjectId",);
  // }
  //
  // Future<Response> getQuestionsByLectureId(int lectureId) async {
  //   return await api.httpGet('get_question_by_lecture_id/$lectureId');
  //
  // }
  //
  // Future<Response> answerQuestion(int lectureId, Map<String, dynamic> answer) async {
  //   return await api.httpPost("/answer/$lectureId",{'answer': answer});
  // }

  // Future<Response> httpGetQuestionCount(String endPath, {Map<String, String>? query}) async {
  //   return await api.httpGet(endPath, query: query);
  //
  // }


// nextQuestion



}