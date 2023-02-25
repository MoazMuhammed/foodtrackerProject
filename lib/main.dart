import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodtracker/core/cubits/language/language_cubit.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/features/splash/splash_screen.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyShared.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return ResponsiveSizer(
            builder: (context, orientation, screenType) {
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
                theme: ThemeData(fontFamily: 'SegoeUI'),
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
