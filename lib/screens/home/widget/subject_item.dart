
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../model/subjects.dart';

class SubjectItem extends StatelessWidget {
  SubjectItem({Key? key, required this.subject,
  }) : super(key: key);

  final Subject subject;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: SizedBox(
        width: 100,
        height: 120,
        child: Card(
          color: Color.fromARGB(255, 255, 255, 255),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(subject.imageUrl, width: 70),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    subject.name,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






// import 'package:dacs3/data_provider/subject_provider.dart';
// import 'package:dacs3/screens/home/widget/lecture_list.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dacs3/data_provider/QuizProvider.dart';
// import 'package:provider/provider.dart';
//
// import '../../../model/subjects.dart';
//
// class SubjectItem extends StatelessWidget {
//   SubjectItem({Key? key, required this.subject,
//   }) : super(key: key);
//
//   final Subject subject;
//
//
//   @override
//   Widget build(BuildContext context) {
//     // return
//     // ChangeNotifierProvider(
//     //   create: (_)=> QuizProvider(),
//     //   child: Consumer<QuizProvider>(
//     //         builder: (context, quizProvider, child) {
//     // return FutureBuilder<List<Subject>>(
//     //     // future: quizProvider.getSubjectData(),
//     //   future: quizProvider.getSubjectData(),
//     //     builder: (context, snapshot)
//     // {
//     //   if (snapshot.hasData) {
//     //     // final subjects = snapshot.data!;
//     return ListView.builder(
//         itemBuilder: (context, index) {
//           // return InkWell(
//           //   onTap: () {
//           //     quizProvider.setSelectedSubjectId(subject.id);
//           //     Navigator.push(
//           //         context,
//           //         MaterialPageRoute(
//           //           builder: (BuildContext context) => LectureList(),
//           //         ));
//           //   },
//           child: SizedBox(
//             width: 100,
//             height: 120,
//             child: Card(
//               color: Color.fromARGB(255, 255, 255, 255),
//               elevation: 2.0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0)
//               ),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Image.asset(subject.image_url, width: 70),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Text(
//                         subject.name,
//                         style: const TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             //   ),
//             // );
//             // },
//           );
//           //   } else if (snapshot.hasError) {
//           //     return Text('Error: ${snapshot.error}');
//           //   } else {
//           //     return CircularProgressIndicator();
//           //   }
//           // }
//           // );
//         }
//     );
//
//     // );
//   }
// }
//
//
//
//
//
//
