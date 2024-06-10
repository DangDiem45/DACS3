import 'package:dacs3_1/common/entities/course.dart';
import 'package:dacs3_1/screens/search/repos/courses_search_repos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class CoursesSearchController extends AutoDisposeAsyncNotifier<List<CourseItem>?>{
  @override
  FutureOr<List<CourseItem>?> build() async{
    final response = await CoursesSearchRepos.coursesDefaultSearch();
    if(response.code==200){
      return response.data;
    }
    return [];
  }
  searchData (String search) async{
    SearchRequestEntity searchRequestEntity = SearchRequestEntity();
    searchRequestEntity.search = search;
    var response = await CoursesSearchRepos.coursesSearch(params: searchRequestEntity);

    if(response.code==200){
      state = AsyncValue.data(response.data);
    }else{
      state = AsyncValue.data([]);
    }
  }
}

final coursesSearchControllerProvider =
AutoDisposeAsyncNotifierProvider<CoursesSearchController, List<CourseItem>?>(CoursesSearchController.new);