import 'dart:math';



extension DoubleExtensions on double {
  String customRound(int places) {
    num mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod).toStringAsFixed(places);
  }
}

extension StringExtensions on String {
  String customRound(int places) {
    num mod = pow(10.0, places);
    return ((double.parse(this) * mod).round().toDouble() / mod)
        .toStringAsFixed(places);
  }

  String reformatTime() {
    return "${substring(0, 2)}:${substring(2, 4)}";
  }

 // String tr() {
  //  if (LanguageCubit.language == null) return this;
    //return LanguageCubit.language[MyShared.getCurrentLanguage()][this] ?? this;
  //}
}
