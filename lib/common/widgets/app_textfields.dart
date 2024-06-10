// import 'package:dacs3_1/common/widgets/text_widgets.dart';
// import 'package:flutter/material.dart';
//
// import 'app_shadow.dart';
// import 'image_widgets.dart';
//
// Widget appTextField({
//   TextEditingController? controller,
//   String text="",
//   String iconName="",
//   String hintText = "Type in your info",
//   bool obscureText = false,
//   void Function(String value)? func}){
//   return Container(
//     // margin: const EdgeInsets.all(8.0),
//     padding:
//     const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.deepPurple.withOpacity(0.2)
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // text14Normal(text: text),
//          Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(left: 15.0, bottom: 15.0),
//                       child: appImage(imagePath: iconName)
//                 ),
//                 Container(
//                   width: 250,
//                   height: 20,
//                   margin: EdgeInsets.only(left: 15.0, bottom: 15.0),
//                   child:  TextField(
//                       controller: controller,
//                       onChanged: (value)=>func!(value),
//                       keyboardType: TextInputType.multiline,
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(5.0),
//                           hintText: hintText,
//                           border: const OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.transparent
//                               )
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.transparent
//                               )
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.transparent
//                               )
//                           ),
//                           disabledBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Colors.transparent
//                               )
//                           )
//                       ),
//                       maxLines: 1,
//                       autocorrect: false,
//                       obscureText: obscureText,
//                     ),
//                   ),
//
//               ],
//             )
//       ],
//     ),
//   );
// }

import 'package:dacs3_1/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import 'app_shadow.dart';
import 'image_widgets.dart';

Widget appTextField({
  TextEditingController? controller,
  String text="",
  String iconName="",
  String hintText = "Type in your info",
  bool obscureText = false,
  void Function(String value)? func}){
  return Container(
    padding: EdgeInsets.only(left: 25, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        Container(
            width: 400,
            height: 50,
            decoration: appBoxDecorationTextField(),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: appImage(imagePath: iconName),
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: TextField(
                    controller: controller,
                    onChanged: (value)=>func!(value),
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 5, top: 3),
                        hintText: hintText,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            )
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            )
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            )
                        ),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            )
                        )
                    ),
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: obscureText,
                  ),
                )
              ],
            )
        )
      ],
    ),
  );
}