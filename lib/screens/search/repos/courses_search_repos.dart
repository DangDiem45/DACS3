import 'package:dacs3_1/common/services/http_util.dart';

import '../../../common/entities/course.dart';

class CoursesSearchRepos{
  static Future<CourseListResponseEntity> coursesDefaultSearch() async{
    var response = await HttpUtil().post("api/courseSearchDefault");
    return CourseListResponseEntity.fromJson(response);

  }
  static Future<CourseListResponseEntity> coursesSearch({SearchRequestEntity? params}) async{
    var response = await HttpUtil().post("api/courseSearch", queryParameters: params?.toJson());
    return CourseListResponseEntity.fromJson(response);
  }
}