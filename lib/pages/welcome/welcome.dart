import 'package:dacs3_1/pages/welcome/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 15),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/reading.png",
                      title: "Chào mừng bạn đến với ADIN STUDY",
                      subTitle: "Quên đi tài lệu giấy khô khan, bạn có thể vừa xem vừa học.",
                      index: 1,context: context
                    ),
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/man.png",
                      title: "Kết nối với mọi người",
                      subTitle: "Luôn giữ liên lạc với gia sư và bạn bè của bạn. Hãy kết nối cùng nhau.",
                      index: 2,context: context
                    ),
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/boy.png",
                      title: "Ứng dụng đem đến cho bạn sự hứng thú khi học tập.",
                      subTitle: "Bất cứ đâu, bất cứ lúc nào. Thời gian là tùy theo ý bạn. Vì vậy, hãy học ở bất cứ đâu bạn có thể.",
                      index: 3,context: context
                    ),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: currentPage.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}