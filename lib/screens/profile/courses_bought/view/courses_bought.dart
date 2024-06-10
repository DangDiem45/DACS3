import 'package:flutter/material.dart';

import '../../../../constant.dart';

class CoursesBought extends StatelessWidget {
  const CoursesBought({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }
  AppBar buildAppBar(){
    return AppBar(
      title: Text(
        "Khóa học của bạn",
        style: TextStyle(color: textColor),
      ),
      iconTheme: IconThemeData(color: textColor),
    );
  }
}
