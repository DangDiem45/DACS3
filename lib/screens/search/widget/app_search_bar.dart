import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSearchBar extends StatelessWidget {
  AppSearchBar({super.key, this.func, this.searchFunc});
  final VoidCallback? func;
  void Function(String value)? searchFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          appTextFieldOnly(func: searchFunc),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10),

            ),
            child: SvgPicture.asset("assets/icons/filter.svg", color: Colors.white,),
          )
        ],
      ),
    );
  }
}
Widget appTextFieldOnly({
  TextEditingController? controller,
  String hintText = "Tìm kiếm",
  void Function(String value)? func,
  bool obscureText = false
}){
  return Expanded(
    child: Container(
      height: 40,
      // padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black87.withOpacity(.05),
                spreadRadius: .5,
                blurRadius: .5,
                offset: Offset(0,0)
            )
          ]
      ),
      child: TextField(
        controller: controller,
        onChanged: (value) => func!(value),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey,),
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: 3),
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            )
        ),
      ),
    ),
  );
}
