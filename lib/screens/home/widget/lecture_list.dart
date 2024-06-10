
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import '../../../data_provider/QuizProvider.dart';

import 'package:http/http.dart' as http;

import '../../../model/lecture.dart';
import '../../../themes/font_family.dart';
import '../../quiz/quiz_screen.dart';

class LectureList extends StatefulWidget {
  static final routeName = 'lecture';
  final int id;

  LectureList({Key? key, required this.id}) : super(key: key);

  @override
  _LectureListState createState() => _LectureListState();
}

class _LectureListState extends State<LectureList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        return FutureBuilder<List<Lecture>>(
          future: quizProvider.getLectureBySubjectIdData(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final lectures = snapshot.data!;
              // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
              // print(lectures);
              // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
              return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: appBgColor,
                      pinned: true,
                      title: Center(
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Danh sách bài thi",
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(left: 3, top: 1),
                      sliver: SliverToBoxAdapter(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: lectures.length,
                          itemBuilder: (context, index) {
                            final lecture = lectures[index];
                            return Material(
                                child: InkWell(
                                  onTap: () {
                                    quizProvider.setSelectedLectureId(lecture.id);
                                    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
                                    print(quizProvider.selectedLectureId);
                                    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => QuizScreen(id: quizProvider.selectedSubjectId, duration: lecture.duration,),
                                      ),
                                    );
                                    // quizProvider.setSelectedLectureId(lecture.id);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (BuildContext context) => QuizScreen(id: lecture.id,),
                                    //   ),
                                    // );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      title: Text(
                                        lecture.name,
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 15, color: Colors.blue.shade800),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time,
                                                    size: 15,
                                                    color: Colors.grey,),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text( "${lecture.duration}",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15,
                                                        fontFamily: FontFamily.lato
                                                    ),
                                                  )
                                                ],
                                              ),

                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.question_answer,
                                                    size: 15,
                                                    color: Colors.grey,),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text( "50",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15,
                                                        fontFamily: FontFamily.lato
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              );

            } else if (snapshot.hasError) {
              return Text('Error Hoài An: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        );
      },
    );
  }
}
