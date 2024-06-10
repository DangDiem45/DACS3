import 'package:dacs3_1/common/utils/app_colors.dart';
import 'package:dacs3_1/common/widgets/app_bar.dart';
import 'package:dacs3_1/common/widgets/app_shadow.dart';
import 'package:dacs3_1/common/widgets/text_widgets.dart';
import 'package:dacs3_1/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:dacs3_1/pages/sign_up/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appButton({
  String buttonName="",
  bool isLogin=true,
  BuildContext? context,
  void Function()? func
}){
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 300,
      height: 40,
      decoration: appBoxShadow(color: isLogin?AppColors.primaryElement:Colors.white),
      child: Center(
        child: text16Normal(
            text: buttonName,
            color: isLogin?AppColors.primaryBackground:AppColors.primaryText
        ),
      ),
    ),
  );
}