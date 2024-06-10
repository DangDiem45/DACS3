//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
//
// import '../../constant.dart';
// import '../../data_provider/lecture_data.dart';
// import '../../model/lecture.dart';
// import '../../model/lecture_category.dart';
//
// class LectureDetail extends StatefulWidget {
//   const LectureDetail({super.key, required this.lecture});
//   final Lecture lecture;
//
//   @override
//   State<LectureDetail> createState() => _LectureDetailState();
// }
//
// class _LectureDetailState extends State<LectureDetail> {
//   final lectureList = LectureData.lectureList;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: appBgColor,
//             pinned: true,
//             title: getAppBar(),
//           ),
//           SliverPadding(
//             padding: EdgeInsets.only(top: 10, left: 10),
//             sliver: SliverToBoxAdapter(
//               child: getCategories(),
//             ),
//           ),
//           getLecture()
//         ],
//       ),
//     );
//   }
//   Widget getLecture(){
//     return SliverPadding(
//       padding: EdgeInsets.only(left: 3, top: 1),
//       sliver: SliverToBoxAdapter(
//         child: ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: widget.lecture.sections.length,
//           itemBuilder: (context, index) {
//             return getMyCourse(widget.lecture, index, context);
//           },
//         ),
//       ),
//     );
//   }
//   Widget getMyCourse(Lecture lecture, int index, BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(
//           lecture.sections[index].title,
//           maxLines: 2,
//           style: TextStyle(fontSize: 15, color: Colors.blue.shade800),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               lecture.sections[index].description,
//               style: TextStyle(fontSize: 10,color: Colors.grey.shade500),
//             ),
//             const SizedBox(height: 10,),
//             Row(
//               children: [
//                 getAttribute(Icons.access_time, lecture.sections[index].duration, Colors.grey),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 getAttribute(Icons.question_answer, lecture.sections[index].question, Colors.grey),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget getAttribute(IconData icon, String info, Color color){
//     var greyTextStyle = const TextStyle(fontSize: 10, color: Colors.grey);
//     return Row(
//       children: [
//         Icon(
//           icon,
//           size: 15,
//           color: color,),
//         SizedBox(
//           width: 5,
//         ),
//         Text(info,
//           style: greyTextStyle,
//         )
//       ],
//     );
//   }
//
//   Widget getAppBar() {
//     return Center(
//       child: Container(
//         child: Row(
//           children: [
//             Text(
//               widget.lecture.title,
//               style: TextStyle(
//                 color: textColor,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 20,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget getCategories() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Text(
//             "Năm",
//             style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey.shade800
//             ),
//
//           ),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         SizedBox(
//           height: 25,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: LectureCategory.values.length,
//             itemBuilder: (context, index) {
//               LectureCategory courseCategory = LectureCategory.values[index];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 child: Container(
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.white,
//                     border: Border.all(color: Colors.grey.shade800),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Text(
//                       courseCategory.title,
//                       style: const TextStyle(fontSize: 10, color: Colors.black),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }