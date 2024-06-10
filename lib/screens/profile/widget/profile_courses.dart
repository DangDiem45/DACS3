import 'package:dacs3_1/common/utils/app_colors.dart';
import 'package:dacs3_1/model/my_course.dart';
import 'package:dacs3_1/screens/profile/courses_bought/view/courses_bought.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCourses extends StatelessWidget {
  const ProfileCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileLink(
              imagePath: "assets/icons/profile_video.png",
              text: "Khóa học của tôi",
            ),
            ProfileLink(
              imagePath: "assets/icons/profile_book.png",
              text: "Mua khóa học",
              func: ()=>Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const CoursesBought(),
                ),
              ),
            ),
            ProfileLink(
              imagePath: "assets/icons/profile_star.png",
              text: "4.9",
            ),
          ],
      ),
    );
  }
}

class ProfileLink extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? func;
  const ProfileLink({super.key, required this.imagePath, required this.text, this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7),
        width: 80,
        decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primaryElement),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(imagePath),
              width: 20,
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
