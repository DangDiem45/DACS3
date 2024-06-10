import 'package:dacs3_1/common/entities/course.dart';
import 'package:dacs3_1/screens/search/repos/courses_search_repos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repos/feature_course_repos.dart';


class FeatureCourseController extends AutoDisposeAsyncNotifier<List<CourseItem>?>{
  @override
  FutureOr<List<CourseItem>?> build() async{
    final response = await FeatureCourseRepos.featureCourse();
    if(response.code==200){
      return response.data;
    }
    return [];
  }
}

final featureCourseControllerProvider =
AutoDisposeAsyncNotifierProvider<FeatureCourseController, List<CourseItem>?>(FeatureCourseController.new);