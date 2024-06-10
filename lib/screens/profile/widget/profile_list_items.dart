import 'package:dacs3_1/common/utils/app_colors.dart';
import 'package:dacs3_1/screens/settings/widget/settings.dart';
import 'package:flutter/material.dart';

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          ListItem(
            imagePath: "assets/icons/settings.png",
            text: "Cài đặt",
            func:()=>Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const Settings(),
            ),
            ),
          ),
          ListItem(
            imagePath: "assets/icons/award.png",
            text: "Tài liệu",
          ),
          ListItem(
            imagePath: "assets/icons/heart(1).png",
            text: "Yêu thích",
          ),
          // ListItem(
          //   imagePath: "assets/icons/cube.png",
          //   text: "Reminder",
          // ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? func;
  const ListItem({super.key, required this.imagePath, required this.text, this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryElement)
            ),
            child: Image(
              image: AssetImage(imagePath),
              width: 20,
              height: 20,
            ),
          ),
          Container(
            height: 30,
            margin: EdgeInsets.only(left: 15),
            child: Text(
                text,
              style: TextStyle(
                fontSize: 15
              ),
            ),
          )
        ],
      ),
    );
  }
}

