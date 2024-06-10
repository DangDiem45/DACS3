import 'package:dacs3_1/common/utils/app_colors.dart';
import 'package:dacs3_1/common/utils/constants.dart';
import 'package:dacs3_1/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var profileImage = ref.read(profileControllerProvider);
        return Container(
          alignment: Alignment.bottomRight,
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: profileImage.avatar != null
                ? DecorationImage(
              image: NetworkImage(
                  "${AppConstants.SERVER_API_URL}${profileImage.avatar!}"),
            )
                : DecorationImage(
              image: AssetImage("assets/icons/headpic.png"),
            ),
          ),
          child: Image.asset(
            "assets/icons/edit_3.png",
            width: 25,
            height: 25,
          ),
        );
      },
    );
  }
}

class ProfileNameWidget extends StatelessWidget {
  const ProfileNameWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var profileName = ref.read(profileControllerProvider);
        return Container(
          margin: EdgeInsets.only(top: 12),
          child: Text(
            profileName.name!=null?"${profileName.name}":"",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        );
      },
    );
  }
}

class ProfileDescriptionWidget extends StatelessWidget {
  const ProfileDescriptionWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var profileName = ref.read(profileControllerProvider);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          margin: EdgeInsets.only(top: 5, bottom: 10),
          child: Text(
            profileName.description!=null?"${profileName.description}"
                :"Tôi là một sinh viên năm 2, mới tập làm Flutter nên mong bạn du di cho tôi để tôi có điểm cao ạ.",
            style: TextStyle(
              color: AppColors.primarySecondElementText,
                fontSize: 10,
                fontWeight: FontWeight.normal
            ),
          ),
        );
      },
    );
  }
}
