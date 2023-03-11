import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/AI/view/ai_screen.dart';
import 'package:foodtracker/features/Home/view/home_screen.dart';
import 'package:foodtracker/features/category/view/category_screen.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int index = 0;
  List<Widget> listScreens= [
    HomeScreen(),
    CategoryScreen(),
    AIScreen(),
    AIScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: listScreens[index],

      bottomNavigationBar: bottomNavBar(),
      endDrawer: DrawerWidget(name: "name"),

    );
  }
  Widget bottomNavBar() {

    return BottomNavigationBar(
      showUnselectedLabels: true,
      selectedItemColor: AppColors.malibu,
      unselectedItemColor: Colors.black,
showSelectedLabels: true,

      onTap: (value) {
        index = value;
        setState(() {});
      },
      currentIndex: index,
      items:  [
        BottomNavigationBarItem(
            label:"Home",
            icon: AppSVG(assetName: 'home',color: index==0? AppColors.malibu:AppColors.black,)
        ),
        BottomNavigationBarItem(
            label:"Category",
            icon: AppSVG(assetName: 'category',color: index==1? AppColors.malibu:AppColors.black,)
        ),
        BottomNavigationBarItem(
            label:"Ai",
            icon: AppSVG(assetName: 'aib',color: index==2? AppColors.malibu:AppColors.black,)
        ),
        BottomNavigationBarItem(
            label:"cart",

            icon: AppSVG(assetName: 'cart',color: index==3? AppColors.malibu:AppColors.black,)
        ),


      ],


    );
  }

}

