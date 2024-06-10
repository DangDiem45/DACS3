import 'package:dacs3_1/screens/feature_course/controller/feature_course_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/constants.dart';
import '../../../data_provider/course_data_provider.dart';
import '../../../model/course.dart';
import '../../details/course_details.dart';
import '../../feature_course/widget/feature_course_widget.dart';
import 'course_item1.dart';

class FeatureCourses extends StatelessWidget {
  final WidgetRef ref;
  const FeatureCourses({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final featureCourse = ref.watch(featureCourseControllerProvider);
    // List<Course> featuredCourseList = [
    //   CourseDataProvider.courseList[0],
    //   CourseDataProvider.courseList[1],
    //   CourseDataProvider.courseList[2],
    //   CourseDataProvider.courseList[3],
    //   CourseDataProvider.courseList[4],
    // ];
    return featureCourse.when(
        data: (data){
          final courseList = CourseDataProvider.courseList;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Khóa học online",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                  ),

                  InkWell(
                    onTap: () {},
                    child: const Text("See All",
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 185,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    final course = courseList[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FeatureCourseWidget(
                            imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${data![index].thumbnail}",
                            title: "${data[index].name}",
                            teacher: "${data[index].teacher}",
                            course: course,
                            price: "${data[index].price}",
                            func: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => const CourseDetails(),
                                  settings: RouteSettings(
                                    arguments: {
                                      "id": data[index].id.toString(),
                                      // Add other key-value pairs if needed
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
        error: (error, stackTrace) {
          print(error.toString());
          print(stackTrace.toString());
          return const Center(child: Text("Error loading data"));
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
    );
  }
}
