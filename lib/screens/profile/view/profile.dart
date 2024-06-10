import 'package:dacs3_1/screens/profile/widget/profile_courses.dart';
import 'package:dacs3_1/screens/profile/widget/profile_list_items.dart';
import 'package:dacs3_1/screens/profile/widget/profile_widget.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileWidget(),
                ProfileNameWidget(),
                ProfileDescriptionWidget(),
                ProfileCourses(),
                ProfileListItems()
              ],
            ),
          )
      ),
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      title: Text(
        "Trang cá nhân",
        style: TextStyle(color: textColor),
      ),
      iconTheme: IconThemeData(color: textColor),
    );
  }
}
