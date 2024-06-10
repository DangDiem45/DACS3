import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../../../model/course.dart';

class CourseItem extends StatelessWidget {
  CourseItem({super.key, required this.imagePath, required this.title,
    required this.teacher, required this.course, required this.price,required this.func});

  final String imagePath;
  final String title;
  final String teacher;
  final Course course;
  final String price;
  final Function()? func;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: func
                // Navigator.pushNamed(
                //     context,
                //     RouteNames.courseDetails,
                //     arguments: CourseArgument(course)
                // );
              ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(imagePath),
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.person,
                              color: kBlueColor, size: 15,),
                            const SizedBox(width: 3),
                            Text(
                              teacher,
                              style: const TextStyle(fontSize: 8, color: kBlueColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 15,
                                  color: kRatingColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${course.rate}',
                                  style: const TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            Text(
                              '$price VND',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      );

  }
}
