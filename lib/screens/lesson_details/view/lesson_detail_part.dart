import 'package:flutter/material.dart';
import '../../../common/entities/lesson.dart';
import '../../../common/utils/constants.dart';

class LessonVideos extends StatelessWidget {
  final List<LessonVideoItem> lessonData;
  final Function(String) onVideoSelected;

  const LessonVideos({super.key, required this.lessonData, required this.onVideoSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(lessonData.length, (index) {
        return InkWell(
          onTap: () {
            onVideoSelected(lessonData[index].url!); // Gọi callback khi video được chọn
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
    );
  }
}
