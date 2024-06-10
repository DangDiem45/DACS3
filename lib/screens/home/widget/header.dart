import 'package:flutter/material.dart';

import '../../../themes/font_family.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: const Icon(Icons.menu),
                    onTap: () {},
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Cloud',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.dancing,
                                color: Colors.blue,
                              ),
                            ),
                            TextSpan(
                              text: 'mate',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.dancing,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}