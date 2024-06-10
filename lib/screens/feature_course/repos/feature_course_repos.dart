import 'package:dacs3_1/common/services/http_util.dart';

import '../../../common/entities/course.dart';

class FeatureCourseRepos{
  static Future<CourseListResponseEntity> featureCourse() async{
    var response = await HttpUtil().post("api/courseFeature");
    return CourseListResponseEntity.fromJson(response);

  }

}