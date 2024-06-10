// import 'package:dacs3_1/common/global_loader/global_loader.dart';
// import 'package:dacs3_1/common/widgets/button_widgets.dart';
// import 'package:dacs3_1/common/widgets/text_widgets.dart';
// import 'package:dacs3_1/pages/sign_in/sign_in_controller.dart';
// import 'package:dacs3_1/pages/sign_in/widgets/sign_in_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:dacs3_1/pages/sign_in/notifier/sign_in_notifier.dart';
// import '../../common/utils/app_colors.dart';
// import '../../common/widgets/app_bar.dart';
// import '../../common/widgets/app_textfields.dart';
//
// class SignIn extends ConsumerStatefulWidget {
//   const SignIn({super.key});
//
//   @override
//   ConsumerState<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends ConsumerState<SignIn> {
//   late SignInController _controller;
//
//   void initState(){
//     Future.delayed(Duration(seconds: 0),(){
//       _controller = SignInController(ref);
//     });
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     _controller = SignInController(ref);
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final signInProvider = ref.watch(signInNotifierProvider);
//     final loader = ref.watch(appLoaderProvider);
//     print(signInProvider.email);
//     print(signInProvider.password);
//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//         child: Scaffold(
//             backgroundColor: Colors.white,
//             body: loader==false?SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 50,),
//                   appTextField(
//                       controller: _controller.emailController,
//                       text: "Email",
//                       iconName: "assets/icons/user.png",
//                       hintText: "Enter your email",
//                       func: (value)=> ref.read(signInNotifierProvider.notifier).onUserEmailChange(value)
//                   ),
//                   SizedBox(height: 15,),
//                   appTextField(
//                       controller: _controller.passwordController,
//                       text: "Password",
//                       iconName: "assets/icons/lock.png",
//                       hintText: "Enter your password",
//                       func: (value)=> ref.read(signInNotifierProvider.notifier).onPasswordChange(value),
//                       obscureText: true),
//                   SizedBox(height: 15,),
//                   Container(
//                       margin: EdgeInsets.only(left: 25),
//                       child: textUnderline(text: "Forgot password?")
//                   ),
//                   SizedBox(height: 60,),
//                   Center(
//                       child: appButton(
//                           buttonName: "Login",
//                           func: ()=> _controller.handleSignIn()
//                       )
//                   ),
//                   SizedBox(height: 15,),
//                   Center(
//                       child: appButton(
//                           buttonName: "Register",
//                           isLogin: false,
//                           context: context,
//                           func: (){
//                             Navigator.pushNamed(context, "/register");
//                           }
//                       )
//                   ),
//                 ],
//               ),
//             )
//                 :const Center(
//               child: CircularProgressIndicator(
//                 backgroundColor: Colors.blue,
//                 color: AppColors.primaryElement,
//               ),
//             )
//         ),
//       ),
//     );
//   }
// }






import 'package:dacs3_1/common/global_loader/global_loader.dart';
import 'package:dacs3_1/common/widgets/button_widgets.dart';
import 'package:dacs3_1/common/widgets/text_widgets.dart';
import 'package:dacs3_1/pages/sign_in/sign_in_controller.dart';
import 'package:dacs3_1/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dacs3_1/pages/sign_in/notifier/sign_in_notifier.dart';
import '../../common/utils/app_colors.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  void initState(){
    Future.delayed(Duration(seconds: 0),(){
      _controller = SignInController(ref);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller = SignInController(ref);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    print(signInProvider.email);
    print(signInProvider.password);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body:
            loader==false?SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset("assets/login.png",
                          width: 210,),),
                        SizedBox(height: 15,),


                          appTextField(
                              controller: _controller.emailController,
                              iconName: "assets/icons/user.png",
                              hintText: "Email",
                              func: (value)=> ref.read(signInNotifierProvider.notifier).onUserEmailChange(value)
                          ),

                         appTextField(
                              controller: _controller.passwordController,
                              iconName: "assets/icons/lock.png",
                              hintText: "Mật khẩu",
                              func: (value)=> ref.read(signInNotifierProvider.notifier).onPasswordChange(value),
                              obscureText: true),
                        SizedBox(height: 25,),

                               Container(
                                   margin: EdgeInsets.only(left: 27),
                                 height: 40,
                                 width: 290,
                                 child: appButton(
                                     buttonName: "Đăng nhập",
                                     func: ()=> _controller.handleSignIn()
                                 ),
                               ),

                        SizedBox(height: 15,),

                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 27),
                                  child: Text("Nếu chưa có tài khoản", style: TextStyle(fontSize: 15),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 27),
                                    child: TextButton(
                                        onPressed: (){
                                          Navigator.pushNamed(context, "/register");
                                        },
                                        child: Text( "Đăng ký", style: TextStyle(fontSize: 16),)
                                    )
                                ),

                              ],
                            ),


                      ],
                    ),
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
