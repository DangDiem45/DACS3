import 'package:dacs3_1/common/global_loader/global_loader.dart';
import 'package:dacs3_1/common/utils/app_colors.dart';
import 'package:dacs3_1/common/widgets/button_widgets.dart';
import 'package:dacs3_1/common/widgets/text_widgets.dart';
import 'package:dacs3_1/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:dacs3_1/pages/sign_up/notifier/register_notifier.dart';
import 'package:dacs3_1/pages/sign_up/sign_up_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});


  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {

  late SignUpController _controller;

  void initState(){
    _controller = SignUpController(ref: ref);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: loader==false?SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset("assets/login.png",
                    width: 150,),),
                SizedBox(height: 15,),

                appTextField(
                    iconName: "assets/icons/user.png",
                    hintText: "Tên",
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserNameChange(value),

                ),
                appTextField(
                    iconName: "assets/icons/user.png",
                    hintText: "Email",
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserEmailChange(value),
                ),
                appTextField(
                    iconName: "assets/icons/lock.png",
                    hintText: "Mật khẩu",
                    obscureText: true,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onPasswordChange(value),
                ),
                appTextField(
                    iconName: "assets/icons/lock.png",
                    hintText: "Xác nhận mật khẩu",
                    obscureText: true,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onRePasswordChange(value),
                ),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(left: 25),
                    child: appButton(
                        buttonName: "Đăng ký",
                        isLogin: true,
                        context: context,
                        func: ()=> _controller.handleSignUp()
                    ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 27),
                      child: Text("Bạn đã có tài khoản", style: TextStyle(fontSize: 15),),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 27),
                        child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, "/login");
                            },
                            child: Text( "Đăng nhập", style: TextStyle(fontSize: 16),)
                        )
                    ),
                  ],

                ),
              ],
            ),
          )
              :const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  color: AppColors.primaryElement,
                ),
          )
        ),
      ),
    );
  }
}
