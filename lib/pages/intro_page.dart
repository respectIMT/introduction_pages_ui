import 'package:flutter/material.dart';
import 'package:intro_page/pages/home_page.dart';
import 'package:intro_page/utils/Strings.dart';

import '../items/makePage.dart';

class IntroPage extends StatefulWidget {
  static final String id = "intro_page";
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                  image: "assets/images/uzb.jpg",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  image: "assets/images/german.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: "assets/images/russia.jpg",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                  text: Strings.stepSkip),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator()),
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
