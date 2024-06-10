import 'package:dacs3_1/common/entities/course.dart';
import 'package:dacs3_1/common/entities/lesson.dart';
import 'package:dacs3_1/common/services/http_util.dart';

class CourseDetailRepo{
  static Future<CourseDetailResponseEntity> courseDetail({CourseRequestEntity? params}) async {

    var response = await HttpUtil().post("api/courseDetail",
      queryParameters: params?.toJson()
    );
    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<LessonListResponseEntity> courseLessonList({LessonRequestEntity? params}) async {

    var response = await HttpUtil().post("api/lessonList",
        queryParameters: params?.toJson()
    );
    return LessonListResponseEntity.fromJson(response);
  }
}