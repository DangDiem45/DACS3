
import 'dart:async';

import 'package:dacs3_1/screens/quiz/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/components_quiz/option.dart';
import '../../component/components_quiz/progress_bar.dart';

import '../../constant.dart';
import '../../data_provider/QuizProvider.dart';
import '../../model/questions.dart';
import '../../themes/font_family.dart';

class QuizScreen extends StatefulWidget {
  final int id;
  final int duration;
  static final routeName = 'question';
  QuizScreen({Key? key, required this.id, required this.duration}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  /* mới*/
  late Future<List<Question>> _questionsFuture;
  List<Question> _questions = [];


  Future<List<Question>> fetchQuestionsOnce() async {
    if (_isQuestionLoaded) return _questions;
    final questionProvider = QuizProvider();
    _questions = await questionProvider.getQuestionsByLectureIdData(widget.id);
    _isQuestionLoaded = true;
    return _questions;
  }

  /* mới*/
  int _currentPageIndex = 0;
  int? _selectedOptionIndex;

  Timer? _timer;
  int _remainingTime = 0;
  late int totalDuration= widget.duration *60;

  bool _isDataLoaded = false;
  bool _isQuestionLoaded= false;

  @override
  void initState() {
    super.initState();
    if (widget.duration != null) {
      _startTimer();
    } else {
      _calculationFuture = _calculateTotalDuration();
    }
      _questionsFuture = fetchQuestionsOnce();


  }


  Future<void>? _calculationFuture;

  Future<void> _calculateTotalDuration() async {
    if (_isDataLoaded) return; // Nếu dữ liệu đã được tải, không cần thực hiện lại
    try {
      final lectures = await QuizProvider().getLectureBySubjectIdData(widget.id);
      setState(() {
        totalDuration = lectures
            .map((lecture) => lecture.duration * 60)
            .reduce((value, element) => value + element);
        _startTimer();
        _isDataLoaded = true;
      });
    } catch (e) {
      print('Error getting lecture data: $e');
      _startTimerWithDefaultDuration();
    }
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _startTimer() {
    _remainingTime = totalDuration;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime--;
      });
      if (_remainingTime <= 0) {
        _timer?.cancel();
        _submitQuiz();
      }
    });
  }

  void _startTimerWithDefaultDuration() {
    setState(() {
      totalDuration = 60 * 50;
      _remainingTime = totalDuration;
      _startTimer();
    });
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Đã xảy ra lỗi khi lấy thời gian quiz. Sử dụng thời gian mặc định.'),
    //   ),
    // );
  }
  Future<void> _submitQuiz() async {
    try {
      final result =  QuizProvider().submitAnswers(widget.id);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ScoreScreen(result:result,),
        ),
      );
      print(result);
    } catch (e) {
      // Xử lý lỗi
      print('Error: $e');
    }

    print("Bài kiểm tra đã được submit!");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizProvider>(
      create: (_) => QuizProvider(),
      child: Consumer<QuizProvider>(
        builder: (context, questionProvider, child) {
          return FutureBuilder<List<Question>>(
            future: _questionsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final questions = snapshot.data!;

                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/quiz/bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: AppBar(
                      title: Text(
                        "Câu hỏi",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: FontFamily.timenewroman, color: Colors.black),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            try {
                              _stopTimer();
                              final result = questionProvider.submitAnswers(widget.id);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ScoreScreen(result: result,),
                                ),
                              );
                            } catch (e) {
                              // Xử lý lỗi
                              print('Error: $e');
                            }
                            // Handle submit button press
                          },
                          child: Text("Nộp bài"),
                        ),
                      ],
                    ),
                    body: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            child: Container(
                              width: double.infinity,
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF3F4768), width: 3),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Stack(
                                children: [
                                  LayoutBuilder(
                                    builder: (context, constraints) => Container(
                                      width: constraints.maxWidth *
                                          (totalDuration - _remainingTime) /
                                          totalDuration,
                                      decoration: BoxDecoration(
                                        gradient: kPrimaryGradient,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding / 2),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("$_remainingTime sec"),
                                          Image(image: AssetImage("assets/quiz/clock.png")),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            child: Text.rich(
                              TextSpan(
                                text: "Câu hỏi ${_currentPageIndex + 1}",
                                style: TextStyle( color: kSecondaryColor, fontSize: 15, fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: "/${questions.length}",
                                    style: TextStyle( color: kSecondaryColor, fontSize: 18, fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(thickness: 1.5),
                          SizedBox(height: 10),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    questions[_currentPageIndex].content,
                                    style: TextStyle( color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500, fontFamily: FontFamily.lato),
                                  ),
                                  SizedBox(height: 8),
                                  ...List.generate(
                                    questions[_currentPageIndex].options.length,
                                        (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selectedOptionIndex = index;
                                        });
                                        questionProvider.addSelectedOption("${questions[_currentPageIndex].id}", "${questions[_currentPageIndex].options[index].id}");
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: (kSecondaryColor)),
                                          borderRadius: BorderRadius.circular(15),
                                          color: _selectedOptionIndex == index ? kGreenColor.withOpacity(0.1) : Colors.transparent,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${index + 1}.${questions[_currentPageIndex].options[index].content}", // Use optionContent instead of text
                                              style: TextStyle(color: _selectedOptionIndex == index ? kSecondaryColor : Colors.black),
                                            ),
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                border: Border.all(color: _selectedOptionIndex == index ? kGreenColor : kPrimaryColor), // Thêm viền nếu tùy chọn được chọn
                                              ),
                                              child: _selectedOptionIndex == index ? Icon(Icons.check, color: kGreenColor, size: 16) : null, // Hiển thị nút tích nếu tùy chọn được chọn
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding),
                          Align(
                            alignment: Alignment.centerRight,
                            child: _currentPageIndex < questions.length - 1
                                ? ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_currentPageIndex < questions.length - 1) {
                                    _currentPageIndex++;
                                    _selectedOptionIndex = null;
                                  } else {
                                    print("End of questions");
                                  }
                                });
                              },
                              child: Text("Tiếp"),
                            )
                                : Container(), // Empty container to occupy space when button is not shown
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}'); // Handling error case
              } else {
                return CircularProgressIndicator(); // Showing a progress indicator while loading
              }
            },
          );
        },
      ),
    );
  }
}