import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/utils/constants.dart';
import '../../../data_provider/QuizProvider.dart';
import '../../../model/subjects.dart';
import 'lecture_list.dart';
import 'package:http/http.dart' as http;

class SubjectList extends StatefulWidget {
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  bool showAllSubjects = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Các môn học",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),

                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       showAllSubjects= true;
                //     });
                //   },
                //   child: const Text("See All",
                //     style: TextStyle(color: Colors.blue, fontSize: 12),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 4),
            FutureBuilder<List<Subject>>(
              future: quizProvider.getSubjectData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('Loading data...');
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  print('Error: ${snapshot.error}');
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final List<Subject> subjects = snapshot.data!;
                  //       print('Type of snapshot.data: ${snapshot.data.runtimeType}');
                  //       print('Subjects length: ${subjects.length}');
                  //       print('Subjects: $subjects');
                  return SizedBox(
                    height: 400,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.85,
                      ),
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        final subject = subjects[index];
                        print('Subject $index: $subject');
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:
                          InkWell(
                            onTap: () {
                              quizProvider.setSelectedSubjectId(subject.id);
                              // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
                              // print(quizProvider.selectedSubjectId);
                              // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LectureList(id: quizProvider.selectedSubjectId),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 100,
                              height: 120,
                              child: Card(
                                color: Colors.white,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Image.network("${AppConstants.IMAGE_UPLOADS_PATH}${subject.imageUrl}", width: 70, height: 70,),
                                        const SizedBox(height: 10),
                                        Text(
                                          subject.name,
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );

                } else {
                  print('No subjects found');
                  return Text('No subjects found');
                }
              },
            ),
          ],
        );
      },
    );
  }
}

