import 'package:dacs3_1/common/utils/constants.dart';
import 'package:dacs3_1/global.dart';
import 'package:dacs3_1/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: GestureDetector(
          onTap: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text("Confirm logout"),
                content: Text("Confirm logout."),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("Cancel")),
                  TextButton(onPressed: (){
                    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
                    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SignIn()),
                            (Route<dynamic> route) => false
                    );
                  }, child: Text("Confirm"))
                ],
              );
            });
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/icons/Logout.png"
                ),
                fit: BoxFit.fitHeight
              )
            ),
          ),
        ),
      ),
      );
  }

  AppBar buildAppBar(){
    return AppBar(
      title: Text(
        "Settings",
        style: TextStyle(color: textColor),
      ),
      iconTheme: IconThemeData(color: textColor),
    );
  }
}
