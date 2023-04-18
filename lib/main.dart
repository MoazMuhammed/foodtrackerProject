import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/cubits/internet/internet_cubit.dart';
import 'package:foodtracker/core/cubits/language/language_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/styles/theme_provider.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_bar_home.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';
import 'package:foodtracker/features/splash/splash_screen.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyShared.init();
  MyShared.putBoolean(key: MySharedKeys.isDoctor, value: false);
  await MyDio.init();
  runApp(ChangeNotifierProvider<ThemeProvider>(
      create: (_) =>
      ThemeProvider()
        ..initialize(),
      child: Phoenix(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      InternetCubit()
        ..checkConnection(),
      child: BlocProvider(
          create: (context) => LanguageCubit(),
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return ResponsiveSizer(
                builder: (context, orientation, screenType) {
                  return Consumer<ThemeProvider>(
                    builder: (context, provider, child) {
                      return MaterialApp(
                        key: ValueKey(MyShared.getCurrentLanguage()),
                        debugShowCheckedModeBanner: false,
                        locale: Locale(MyShared.getCurrentLanguage()),
                        supportedLocales: S.delegate.supportedLocales,
                        localizationsDelegates: const [
                          S.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                        ],
                        theme: ThemeData(fontFamily: 'SegoeUI',),
                        darkTheme: ThemeData.dark(),
                        themeMode: provider.themeMode,
                        home: const SplashScreen(),
                        builder: EasyLoading.init(),
                      );
                    },
                  );
                },
              );
            },
          ),
      ),
    );
  }
}
