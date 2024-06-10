//
// import 'package:flutter/material.dart';
//
// import '../../../arguments/lecture_arguments.dart';
// import '../../../common/utils/route_names.dart';
// import '../../../model/lecture.dart';
//
// class LectureItem extends StatelessWidget {
//   const LectureItem({super.key, required this.lecture});
//
//   final Lecture lecture;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, RouteNames.lectureDetails, arguments: LectureArgument(lecture));
//       },
//       child: SizedBox(
//         width: 100,
//         height: 120,
//         child: Card(
//           color: Color.fromARGB(255, 255, 255, 255),
//           elevation: 2.0,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0)
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Image.asset(lecture.thumbnailUrl, width: 70),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     lecture.title,
//                     style: const TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }