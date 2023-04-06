import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/onBoard/widget/on_boarding_widget.dart';

PageController indicatorController = PageController();
bool lastPage = false;

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  List<Screens> screens = [
    Screens(
      "onboardOne",
      "always beside you",
      "In food tracker, We present a new vision for\ngood programs by proving moral support to the\nfamily in caring for the allergies facing our\nchildren because they have become very\nwidespread ",
    ),
    Screens(
      "onboardTwo",
      "We are here for you",
      "Program also provide ways to discover if your\nchild suffers from allergies and also discover\nwhat type and methods of caring for them in\naddition to using artificial intelligence so\n that results are 98% correct",
    ),
    Screens(
      "onboardThree",
      "Provide medical support",
      "One of the best and most important features of\nfood tracker is that here we always provide support\nin all cases so that parents feel safe because we are\nnot only a medical program but we are family\nthat always care for your safety",
    ),
  ];

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      controller: indicatorController,
      onPageChanged: (value) {
        setState(() {
          lastPage = (value == 2);
        });
      },
      itemBuilder: (context, index) => OnBoardingWidget(
        title: widget.screens[index].title,
        subTitle: widget.screens[index].subtitle,
        image: widget.screens[index].image,
        onPressed: () {
          lastPage
              ? pushAndRemoveUntil(context, const LoginScreen())
              : indicatorController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
        },
        onTap: () {
          indicatorController.jumpToPage(2);
        },
      ),
      itemCount: widget.screens.length,
    ));
  }
}

class Screens {
  String image;
  String title;
  String subtitle;

  Screens(this.image, this.title, this.subtitle);
}
