import 'package:dacs3_1/screens/details/course_details.dart';
import 'package:dacs3_1/screens/home/widget/course_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/constants.dart';
import '../../../data_provider/course_data_provider.dart';
import '../controller/home_controller.dart';

class CourseList extends StatelessWidget {
  final WidgetRef ref;
  const CourseList({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);
    return courseState.when(
      data: (data) {
        final courseList = CourseDataProvider.courseList;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.87,
          ),
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: data?.length,
          itemBuilder: (context, index) {
            final course = courseList[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseItem(
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