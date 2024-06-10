import 'package:dacs3_1/screens/details/course_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/entities/course.dart';
import '../../../common/utils/constants.dart';

class CourseSearchWidget extends ConsumerWidget {
  const CourseSearchWidget({super.key, required this.value});
  final List<CourseItem> value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        for (final course in value)
          Card(
            child: ListTile(
              leading: Image.network(
                "${AppConstants.IMAGE_UPLOADS_PATH}${course.thumbnail}",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                "${course.name}",
                maxLines: 5,
                style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7,),
                  Text(
                    "${course.teacher}",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CourseDetails(),
                    settings: RouteSettings(
                      arguments: {
                        "id": course.id.toString(),
                      },
                    ),
                  ),
                );
              },
            ),
          )
      ],
    );
  }
}
