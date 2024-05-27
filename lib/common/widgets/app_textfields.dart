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
            width: 330,
            height: 40,
            decoration: appBoxDecorationTextField(),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: appImage(imagePath: iconName),
                ),
                Container(
                  width: 280,
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