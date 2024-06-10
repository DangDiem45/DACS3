import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../data_provider/QuizProvider.dart';
import '../../model/questions.dart'; // Import QuestionProvider

class Option extends StatelessWidget {
  @override
  const Option({
    Key? key,
    required this.id,
    required this.question_id
    // Pass the instance of QuestionProvider
  }) : super(key: key);
  final int question_id;
  final int id;

  @override
  Widget build(BuildContext context) {
    return
      Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            return
              FutureBuilder<List<Question>>(
                  future: quizProvider.getQuestionsByLectureIdData(id),
                  builder: (context, snapshot){
                    if (snapshot.hasData) { // If data is available
                      final questions = snapshot.data!; // Extracting subject data from the snapshot
                      return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            final question = questions[index];
                            final option = question.options[index];
                            return InkWell(
                              onTap: () {
                                quizProvider.addSelectedOption("${question.id}", "${option.id}");

                              },
                              child: Container(
                                margin: EdgeInsets.only(top: kDefaultPadding),
                                padding: EdgeInsets.all(kDefaultPadding),
                                decoration: BoxDecoration(
                                  border: Border.all(color: (kSecondaryColor)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${index + 1}.${option.content}", // Use optionContent instead of text
                                      style: TextStyle(color: kSecondaryColor, fontSize: 16),
                                    ),
                                    Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                        color: kGreenColor == kGrayColor
                                            ? Colors.transparent
                                            : kGreenColor,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: kGreenColor),
                                      ),
                                      child: kGreenColor == kGrayColor
                                          ? null
                                          : Icon(kGreenColor as IconData?, size: 16),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Handling error case
                    } else {
                      return CircularProgressIndicator(); // Showing a progress indicator while loading
                    }
                  }
              );
          }
      );

  }
}
