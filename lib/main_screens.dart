import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/internet/internet_cubit.dart';
import 'package:foodtracker/core/cubits/main/main_cubit.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/internet_disconnected_widget.dart';
import 'package:foodtracker/features/AI/view/ai_screen.dart';
import 'package:foodtracker/features/Home/view/home_screen.dart';
import 'package:foodtracker/features/category/view/category_screen.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';
import 'package:foodtracker/generated/l10n.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  MainCubit cubit = MainCubit();

  int index = 0;
  List<Widget> listScreens = [
    HomeScreen(),
    CategoryScreen(),
    AIScreen(),
    AIScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkConnectivity();
  }

  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    safePrint(result.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state is ConnectedState) {
                return SafeArea(
                  child: Scaffold(
                    body: RefreshIndicator(
                        onRefresh: () async {
                          initState();
                        },
                        child: cubit.screens[cubit.index]),
                    bottomNavigationBar: bottomNavBar(),
                    endDrawer: DrawerWidget(name: "name"),
                  ),
                );
              } else if (state is NotConnectedState) {
                InternetDisconnectedWidget();
              }
              return InternetDisconnectedWidget();
            },
          );
        },
      ),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade200
          : Colors.grey.shade800,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Theme.of(context).brightness == Brightness.light
          ? Colors.black
          : Colors.white,
      onTap: (value) {
        cubit.index = value;
        setState(() {});
      },
      currentIndex: cubit.index,
      items: [
        BottomNavigationBarItem(
            label: '${S().home}',
            icon: AppSVG(
              assetName: 'home',
              color: cubit.index == 0
                  ? AppColors.primary
                  : Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
            )),
        BottomNavigationBarItem(
            label: '${S().allergy}',
            icon: AppSVG(
              assetName: 'category',
              color: cubit.index == 1
                  ? AppColors.primary
                  : Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
            )),
        BottomNavigationBarItem(
            label: '${S().faScanner}',
            icon: AppSVG(
              assetName: 'faScanner',
              color: cubit.index == 2
                  ? AppColors.primary
                  : Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
            )),
        BottomNavigationBarItem(
            label: '${S().cartAllergy}',
            icon: AppSVG(
              assetName: 'cart',
              color: cubit.index == 3
                  ? AppColors.primary
                  : Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
            )),
      ],
    );
  }
}
