import 'package:dacs3_1/common/entities/course.dart';
import 'package:dacs3_1/common/entities/lesson.dart';
import 'package:dacs3_1/common/services/http_util.dart';

class LessonRepo{

  static Future<LessonListResponseEntity> courseLessonDetail({LessonRequestEntity? params}) async {

    var response = await HttpUtil().post("api/lessonDetail",
        queryParameters: params?.toJson()
    );
    return LessonListResponseEntity.fromJson(response);
  }
}