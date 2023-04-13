import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/onBoard/widget/on_boarding_widget.dart';
import 'package:foodtracker/generated/l10n.dart';

PageController indicatorController = PageController();
bool lastPage = false;

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  List<Screens> screens = [
    Screens(
      "onboardOne",
      "${S().onBoardTitleOne}",
      "${S().onBoardDescriptionOne}",
    ),
    Screens(
      "onboardTwo",
      "${S().onBoardTitleTwo}",
      "${S().onBoardDescriptionTwo}",
    ),
    Screens(
      "onboardThree",
      "${S().onBoardTitleThree}",
      "${S().onBoardDescriptionThree}",
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
