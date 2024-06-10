import 'package:dacs3_1/common/entities/course.dart';
import 'package:dacs3_1/common/utils/app_colors.dart';
import 'package:dacs3_1/common/utils/constants.dart';
import 'package:dacs3_1/screens/details/course_details.dart';
import 'package:dacs3_1/screens/search/controller/courses_search_controller.dart';
import 'package:dacs3_1/screens/search/widget/app_search_bar.dart';
import 'package:dacs3_1/screens/search/widget/course_search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constant.dart';
import '../../../data_provider/course_data_provider.dart';
import '../../../model/course.dart';
import '../../../model/course_category.dart';
import '../../home/widget/course_item1.dart';

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = ref.watch(coursesSearchControllerProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: appBgColor,
            pinned: true,
            title: getAppBar(),
          ),
          SliverToBoxAdapter(
            child: AppSearchBar(
              searchFunc: (search) {
                ref.watch(coursesSearchControllerProvider.notifier).searchData(search);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
                child: switch (searchProvider){
                  AsyncData(:final value) => value!.isEmpty
                      ? CircularProgressIndicator()
                      : CourseSearchWidget(value: value),
                  AsyncError(:final error) => Text('Error $error'),
                  _ => const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                }
            ),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.only(top: 10, left: 10), // Tạo khoảng cách ở đây
          //   sliver: SliverToBoxAdapter(
          //     child: getCategories(),
          //   ),
          // ),
          // getCourses(),
        ],
      ),
    );
  }

  getAppBar() {
    return Center(
      child: Container(
        child: Row(
          children: [
            Text(
              "Tìm kiếm",
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  getSearchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
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
                        offset: Offset(0, 0))
                  ]),
              child: const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    hintText: "Tìm kiếm",
                    contentPadding: EdgeInsets.symmetric(vertical: 3),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    )),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              "assets/icons/filter.svg",
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  getCategories() {
    return SizedBox(
      height: 25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: CourseCategory.values.length,
          itemBuilder: (context, index) {
            CourseCategory courseCategory = CourseCategory.values[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade800),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    courseCategory.title,
                    style: const TextStyle(
                        fontSize: 10, color: Colors.black),
                  ),
                ),
              ),
            );
          }),
    );
  }

  getCourses() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        childAspectRatio: 0.95, // Tùy chỉnh tỷ lệ chiều rộng và chiều cao của mỗi phần tử
        mainAxisSpacing: 10, // Khoảng cách dọc giữa các phần tử
        crossAxisSpacing: 10, // Khoảng cách ngang giữa các phần tử
        children: CourseDataProvider.courseList.map((course) {
          return CourseItem1(course: course);
        }).toList(),
      ),
    );
  }
}