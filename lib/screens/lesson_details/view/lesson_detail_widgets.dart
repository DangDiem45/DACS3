import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/entities/lesson.dart';
import '../../../common/utils/constants.dart';
import '../../../constant.dart';
import '../controller/lesson_controller.dart';
import 'lesson_detail.dart';

class LessonDetailWidget extends ConsumerWidget {
  final List<LessonItem> lessonData;
  final WidgetRef ref;
  const LessonDetailWidget({super.key, required this.lessonData, required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        lessonData.isNotEmpty
            ? const Text(
          "Danh sách bài giảng",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        )
            : const Text(
          "Chưa cập nhật danh sách bài giảng",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        const SizedBox(height: 5),
        Column(
          children: List.generate(lessonData.length, (index) {
            return InkWell(
              onTap: () {
                ref.watch(lessonDetailControllerProvider(index: lessonData[index].id!));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LessonDetail(),
                    settings: RouteSettings(
                      arguments: {
                        "id": lessonData[index].id.toString(),
                      },
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          "${AppConstants.IMAGE_UPLOADS_PATH}${lessonData[index].thumbnail}",
                          width: 100,
                          height: 65,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(lessonData[index].name ?? "No name"),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.description,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                                const SizedBox(width: 7),
                                Expanded(
                                  child: Text(
                                    lessonData[index].description ?? "No description",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
