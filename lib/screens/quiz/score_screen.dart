
import 'package:dacs3_1/data_provider/QuizProvider.dart';
import 'package:dacs3_1/screens/home/course_home.dart';
import 'package:dacs3_1/themes/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../model/score_reponse.dart';
import '../../model/select_option.dart';

class ScoreScreen extends StatefulWidget {

  final Future<String> result;
  const ScoreScreen({Key? key, required this.result}) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizProvider>(
      create: (_)=> QuizProvider(),
        child: Consumer<QuizProvider>(
          builder: (context, quizProvider , child){
            return FutureBuilder(
                future: widget.result,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    final scores= snapshot.data;
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/quiz/bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 180),
                              height: MediaQuery.of(context).size.height * 1/3,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                color: kSecondaryColor.withOpacity(0.2),
                                border: Border.all(
                                  color: kSecondaryColor.withOpacity(0.2),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("ĐIỂM SỐ", style: TextStyle ( color: kPrimaryColor, fontSize: 25, fontFamily: FontFamily.dancing),),
                                  SizedBox(height: 20,),
                                  Text(scores.toString(), style: TextStyle ( color: kPrimaryColor, fontSize: 27, fontFamily: FontFamily.dancing),),
                                ],
                              ),

                            ),
                          ),
                          SizedBox(height: 20,),
                          Align(

                            alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context)=> CourseHome())
                                );
                              },
                              child: Text("Quay về trang chủ"),
                            )
                          ),
                        ],),
                    );
                  } else if (snapshot.hasError){
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                });
          },
        ),
        );
  }
}