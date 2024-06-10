import 'package:dacs3_1/common/services/http_util.dart';
import 'package:dacs3_1/common/utils/app_styles.dart';
import 'package:dacs3_1/firebase_options.dart';
import 'package:dacs3_1/global.dart';
import 'package:dacs3_1/pages/sign_in/sign_in.dart';
import 'package:dacs3_1/pages/sign_up/sign_up.dart';
import 'package:dacs3_1/pages/welcome/welcome.dart';
import 'package:dacs3_1/screens/details/course_details.dart';
import 'package:dacs3_1/screens/details/lecture_details.dart';
import 'package:dacs3_1/screens/home/course_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart' as provider;

import 'arguments/course_arguments.dart';
import 'arguments/lecture_arguments.dart';
import 'common/utils/route_names.dart';
import 'data_provider/QuizProvider.dart' ;

Future<void> main() async {
  await Global.init();

  runApp(
    provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(create: (_) => QuizProvider()),
        // Add other ChangeNotifierProviders if needed
      ],
      child: riverpod.ProviderScope(
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appThemeData,
        initialRoute: "/",
        routes: {
          "/": (context) => Welcome(),
          // "/": (context) => CourseHome(),
          "/register": (context) => const SignUp(),
          "/login": (context) => const SignIn(),
        },
        onGenerateRoute: (settings) {
          // Define route handling logic here
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
