import 'package:dacs3_1/common/global_loader/global_loader.dart';
import 'package:dacs3_1/common/widgets/popup_messages.dart';
import 'package:dacs3_1/pages/sign_up/notifier/register_notifier.dart';
import 'package:dacs3_1/pages/sign_up/repo/sign_up_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class SignUpController{
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async{

    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;

     bool isEmail(String em) {
      String p =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      RegExp regExp = new RegExp(p);
      return regExp.hasMatch(em);
    }
    
    if(state.userName.isEmpty || name.isEmpty){
      toastInfo("Tên đang rỗng ");
      return;
    }

    if(state.userName.length<6 || name.length<6){
      toastInfo("Tên quá ngắn");
      return;
    }

    if( email!.isEmail){
      toastInfo("Email sai định dạng");
      return;

    }
    if(state.email.isEmpty || email.isEmpty ){
      toastInfo("Email đang rỗng");
      return;
    }

    if((state.password.isEmpty!=state.rePassword.isEmpty)||password.isEmpty!=rePassword.isEmpty){
      toastInfo("Mật khẩu đang rỗng");
      return;
    }

    if((state.password!=state.rePassword)||password!=rePassword){
      toastInfo("Mật khẩu không giống nhau");
      return;
    }

    // print("username is $name");
    // print("email is $email");
    // print("password is $password");
    // print("Repassword is $rePassword");

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    Future.delayed(const Duration(seconds: 2), () async {
      var context = Navigator.of(ref.context);

      try{
        final credential = await SignUpRepo.firebaseSignUp(email, password);

        if(kDebugMode){
          print(credential);
        }

        if(credential.user!=null) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(name);
          String photoUrl = "uploads/default.png";
          await credential.user?.updatePhotoURL(photoUrl);
          toastInfo(
              "Asn email has been sent to verify your account, Please open that email and confirm your identity");
          context.pop();
        }
      }on FirebaseAuthException catch(e){
        if(e.code=='weak-password'){
          toastInfo("This password is too weak");
        }else if(e.code=='email-already-in-use'){
          toastInfo("This email address has already been registered");
        }else if(e.code=='user-not-found'){
          toastInfo("User not found");
        }

      }catch(e){
        if(kDebugMode){
          print(e.toString());
        }
      }
      ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
    });

  }
}