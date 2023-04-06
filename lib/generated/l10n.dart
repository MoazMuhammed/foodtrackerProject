// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy Your Journey`
  String get enjoy {
    return Intl.message(
      'Enjoy Your Journey',
      name: 'enjoy',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get enterEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your password`
  String get enterPassword {
    return Intl.message(
      'Enter Your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetPasswordLogin {
    return Intl.message(
      'Forget password?',
      name: 'forgetPasswordLogin',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an Account?`
  String get haveAcc {
    return Intl.message(
      'Do not have an Account?',
      name: 'haveAcc',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPassword {
    return Intl.message(
      'Forget password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your New password Have Successful\nSaved`
  String get passwordSaved {
    return Intl.message(
      'Your New password Have Successful\nSaved',
      name: 'passwordSaved',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation`
  String get congratulation {
    return Intl.message(
      'Congratulation',
      name: 'congratulation',
      desc: '',
      args: [],
    );
  }

  /// `Go to Home`
  String get goToHome {
    return Intl.message(
      'Go to Home',
      name: 'goToHome',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your New Password`
  String get enterNewPassword {
    return Intl.message(
      'Please Enter Your New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 4 digit code that\nhave been send to email`
  String get otp {
    return Intl.message(
      'Please enter the 4 digit code that\nhave been send to email',
      name: 'otp',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email To Receive The code`
  String get enterEmailToReceiveCode {
    return Intl.message(
      'Please Enter Your Email To Receive The code',
      name: 'enterEmailToReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get sendCode {
    return Intl.message(
      'Send code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
