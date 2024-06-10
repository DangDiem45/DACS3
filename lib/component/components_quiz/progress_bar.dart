// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Import QuestionProvider
// import 'package:provider/provider.dart';
//
// import '../../constant.dart';
// import '../../data_provider/QuizProvider.dart';
// import '../../model/lecture.dart';
// import '../../screens/quiz/score_screen.dart';
//
//
// class ProgressBar extends StatefulWidget {
//   final int id;
//   const ProgressBar({
//     Key? key, required this.id
//   }) : super(key: key);
//   @override
//   _ProgressBarState createState() => _ProgressBarState();
// }
//
// class _ProgressBarState extends State<ProgressBar> {
//   Timer? _timer;
//   int _remainingTime = 0;
//   late final int totalDuration;
//
//   @override
//   void initState() {
//     super.initState();
//     _calculateTotalDuration();
//   }
//
//   Future<void> _calculateTotalDuration() async {
//     final lectures = await QuizProvider().getLectureBySubjectIdData(widget.id);
//     totalDuration = lectures
//         .map((lecture) => lecture.duration * 60)
//         .reduce((value, element) => value + element);
//     _startTimer();
//   }
//   void _stopTimer(){
//     _timer?.cancel();
//   }
//
//   void _startTimer() {
//     _remainingTime = totalDuration;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         _remainingTime--;
//       });
//       if (_remainingTime <= 0) {
//         _timer?.cancel();
//         _submitQuiz(); // Gọi hàm để submit bài kiểm tra
//       }
//     });
//   }
//
//   Future<void> _submitQuiz() async {
//     try {
//       final result =  QuizProvider().submitAnswers(widget.id);
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => ScoreScreen(id: widget.id, select: QuizProvider().selectedOptions,),
//         ),
//       );
//       print(result);
//     } catch (e) {
//       // Xử lý lỗi
//       print('Error: $e');
//     }
//
//     print("Bài kiểm tra đã được submit!");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_)=> QuizProvider(),
//       child: Consumer<QuizProvider>(
//         builder: (context, quizProvider, child) {
//           return FutureBuilder<List<Lecture>>(
//             future: quizProvider.getLectureBySubjectIdData(widget.id),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 final lectures = snapshot.data!;
//                 var totalDuration = lectures
//                     .map((lecture) => lecture.duration*60)
//                     .reduce((value, element) => value + element);
//                 return Container(
//                   width: double.infinity,
//                   height: 35,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xFF3F4768), width: 3),
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Stack(
//                     children: [
//                       LayoutBuilder(
//                         builder: (context, constraints) => Container(
//                           width: constraints.maxWidth *
//                               (totalDuration - _remainingTime) /
//                               totalDuration,
//                           decoration: BoxDecoration(
//                             gradient: kPrimaryGradient,
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                         ),
//                       ),
//                       Positioned.fill(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: kDefaultPadding / 2),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("$_remainingTime sec"),
//                               Image(image: AssetImage("assets/quiz/clock.png")),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 return CircularProgressIndicator();
//               }
//             },
//           );
//         },
//       ),);
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
// }