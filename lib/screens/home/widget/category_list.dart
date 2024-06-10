
import 'package:flutter/material.dart';

import '../../../model/course_category.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Danh mục",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 20,
          width: 400,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CourseCategory.values.length,
              itemBuilder: (context, index){
                CourseCategory courseCategory = CourseCategory.values[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade800),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          courseCategory.title,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black),)),
                  ),
                );
              }),
        ),
        SizedBox(height: 15),

      ],
    );
  }
}
