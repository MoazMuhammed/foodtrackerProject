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

  /// `let's Get Started`
  String get letsGetStarted {
    return Intl.message(
      'let\'s Get Started',
      name: 'letsGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `always beside you`
  String get onBoardTitleOne {
    return Intl.message(
      'always beside you',
      name: 'onBoardTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `In food tracker, We present a new vision for\ngood programs by proving moral support to the\nfamily in caring for the allergies facing our\nchildren because they have become very\nwidespread `
  String get onBoardDescriptionOne {
    return Intl.message(
      'In food tracker, We present a new vision for\ngood programs by proving moral support to the\nfamily in caring for the allergies facing our\nchildren because they have become very\nwidespread ',
      name: 'onBoardDescriptionOne',
      desc: '',
      args: [],
    );
  }

  /// `We are here for you`
  String get onBoardTitleTwo {
    return Intl.message(
      'We are here for you',
      name: 'onBoardTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Program also provide ways to discover if your\nchild suffers from allergies and also discover\nwhat type and methods of caring for them in\naddition to using artificial intelligence so\n that results are 98% correct`
  String get onBoardDescriptionTwo {
    return Intl.message(
      'Program also provide ways to discover if your\nchild suffers from allergies and also discover\nwhat type and methods of caring for them in\naddition to using artificial intelligence so\n that results are 98% correct',
      name: 'onBoardDescriptionTwo',
      desc: '',
      args: [],
    );
  }

  /// `Provide medical support`
  String get onBoardTitleThree {
    return Intl.message(
      'Provide medical support',
      name: 'onBoardTitleThree',
      desc: '',
      args: [],
    );
  }

  /// `One of the best and most important features of\nfood tracker is that here we always provide support\nin all cases so that parents feel safe because we are\nnot only a medical program but we are family\nthat always care for your safety`
  String get onBoardDescriptionThree {
    return Intl.message(
      'One of the best and most important features of\nfood tracker is that here we always provide support\nin all cases so that parents feel safe because we are\nnot only a medical program but we are family\nthat always care for your safety',
      name: 'onBoardDescriptionThree',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get allergy {
    return Intl.message(
      'Category',
      name: 'allergy',
      desc: '',
      args: [],
    );
  }

  /// `FA Scanner`
  String get faScanner {
    return Intl.message(
      'FA Scanner',
      name: 'faScanner',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get cartAllergy {
    return Intl.message(
      'Product',
      name: 'cartAllergy',
      desc: '',
      args: [],
    );
  }

  /// `Allergy type`
  String get allergyType {
    return Intl.message(
      'Allergy type',
      name: 'allergyType',
      desc: '',
      args: [],
    );
  }

  /// `Choose Service Of Process`
  String get chooseService {
    return Intl.message(
      'Choose Service Of Process',
      name: 'chooseService',
      desc: '',
      args: [],
    );
  }

  /// `Photo Analysis`
  String get photoAnalysis {
    return Intl.message(
      'Photo Analysis',
      name: 'photoAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `to get the type of allergy by analysis the photo using artificial intelligence.`
  String get photoAnalysisNote {
    return Intl.message(
      'to get the type of allergy by analysis the photo using artificial intelligence.',
      name: 'photoAnalysisNote',
      desc: '',
      args: [],
    );
  }

  /// `Medical Analysis`
  String get medicalAnalysis {
    return Intl.message(
      'Medical Analysis',
      name: 'medicalAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `For get the result from medical reports like IGE`
  String get medicalAnalysisNote {
    return Intl.message(
      'For get the result from medical reports like IGE',
      name: 'medicalAnalysisNote',
      desc: '',
      args: [],
    );
  }

  /// `Choose Type`
  String get chooseType {
    return Intl.message(
      'Choose Type',
      name: 'chooseType',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Check Data`
  String get checkData {
    return Intl.message(
      'Check Data',
      name: 'checkData',
      desc: '',
      args: [],
    );
  }

  /// `Medical Analyzes Are A Feature Provided By The Program So That The User Or Any Person Can View And Interpret The Results Of The Analyzes Without The Need For A Doctor`
  String get medicalAnalysisDescription {
    return Intl.message(
      'Medical Analyzes Are A Feature Provided By The Program So That The User Or Any Person Can View And Interpret The Results Of The Analyzes Without The Need For A Doctor',
      name: 'medicalAnalysisDescription',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `This result is not 100% correct. In the event that the symptoms were very serious, you should go to the nearest doctor or hospital.`
  String get warningDescription {
    return Intl.message(
      'This result is not 100% correct. In the event that the symptoms were very serious, you should go to the nearest doctor or hospital.',
      name: 'warningDescription',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Enter IGE Total Number`
  String get enterIge {
    return Intl.message(
      'Enter IGE Total Number',
      name: 'enterIge',
      desc: '',
      args: [],
    );
  }

  /// `Process Complete`
  String get processComplete {
    return Intl.message(
      'Process Complete',
      name: 'processComplete',
      desc: '',
      args: [],
    );
  }

  /// `IGE Total Results :`
  String get igeResult {
    return Intl.message(
      'IGE Total Results :',
      name: 'igeResult',
      desc: '',
      args: [],
    );
  }

  /// `You Are In :`
  String get youAreIn {
    return Intl.message(
      'You Are In :',
      name: 'youAreIn',
      desc: '',
      args: [],
    );
  }

  /// `Warning Level`
  String get warningLevel {
    return Intl.message(
      'Warning Level',
      name: 'warningLevel',
      desc: '',
      args: [],
    );
  }

  /// `It is not evidence of a specific disease.`
  String get warningLevelNote {
    return Intl.message(
      'It is not evidence of a specific disease.',
      name: 'warningLevelNote',
      desc: '',
      args: [],
    );
  }

  /// `Normal Level`
  String get normalLevel {
    return Intl.message(
      'Normal Level',
      name: 'normalLevel',
      desc: '',
      args: [],
    );
  }

  /// `Danger Level`
  String get dangerLevel {
    return Intl.message(
      'Danger Level',
      name: 'dangerLevel',
      desc: '',
      args: [],
    );
  }

  /// `It may be: allergic disorders - some types of infections - autoimmune diseases.`
  String get DangerLevelNote {
    return Intl.message(
      'It may be: allergic disorders - some types of infections - autoimmune diseases.',
      name: 'DangerLevelNote',
      desc: '',
      args: [],
    );
  }

  /// `Create Post`
  String get createPost {
    return Intl.message(
      'Create Post',
      name: 'createPost',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Show What's in your Mind ….`
  String get post {
    return Intl.message(
      'Show What\'s in your Mind ….',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get photo {
    return Intl.message(
      'Photo',
      name: 'photo',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Talk To Our Team`
  String get contactUsTitle {
    return Intl.message(
      'Talk To Our Team',
      name: 'contactUsTitle',
      desc: '',
      args: [],
    );
  }

  /// `It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged. It Was Popularised In The 1960S With The Release`
  String get contactUsDescription {
    return Intl.message(
      'It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged. It Was Popularised In The 1960S With The Release',
      name: 'contactUsDescription',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Your Message`
  String get yourMessage {
    return Intl.message(
      'Your Message',
      name: 'yourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Write Your Message Here`
  String get yourMessageNote {
    return Intl.message(
      'Write Your Message Here',
      name: 'yourMessageNote',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message(
      'Credit Card',
      name: 'creditCard',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvv {
    return Intl.message(
      'CVV',
      name: 'cvv',
      desc: '',
      args: [],
    );
  }

  /// `Expired Date`
  String get expiredDate {
    return Intl.message(
      'Expired Date',
      name: 'expiredDate',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comment {
    return Intl.message(
      'Comments',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment for People`
  String get addComment {
    return Intl.message(
      'Add Comment for People',
      name: 'addComment',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder`
  String get cardHolder {
    return Intl.message(
      'Card Holder',
      name: 'cardHolder',
      desc: '',
      args: [],
    );
  }

  /// `Validate`
  String get validate {
    return Intl.message(
      'Validate',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// `Warning not to share bank account data and codes with any other parties.`
  String get creditCardWarn {
    return Intl.message(
      'Warning not to share bank account data and codes with any other parties.',
      name: 'creditCardWarn',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenter {
    return Intl.message(
      'Help Center',
      name: 'helpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Follow US`
  String get followUS {
    return Intl.message(
      'Follow US',
      name: 'followUS',
      desc: '',
      args: [],
    );
  }

  /// `How Can I Help You?`
  String get helpCenterTitle {
    return Intl.message(
      'How Can I Help You?',
      name: 'helpCenterTitle',
      desc: '',
      args: [],
    );
  }

  /// `We are always here to help, and if you have a problem using the food tracker program, please contact us through either of these two methods.`
  String get helpCenterDescription {
    return Intl.message(
      'We are always here to help, and if you have a problem using the food tracker program, please contact us through either of these two methods.',
      name: 'helpCenterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Terms Of Service`
  String get termsAndCondition {
    return Intl.message(
      'Terms Of Service',
      name: 'termsAndCondition',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get introduction {
    return Intl.message(
      'Introduction',
      name: 'introduction',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our terms and conditions ("Terms"). These Terms are important and affect your legal rights, so please read them carefully.`
  String get introductionDescription {
    return Intl.message(
      'Welcome to our terms and conditions ("Terms"). These Terms are important and affect your legal rights, so please read them carefully.',
      name: 'introductionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Agreement To Terms`
  String get agreementToTerms {
    return Intl.message(
      'Agreement To Terms',
      name: 'agreementToTerms',
      desc: '',
      args: [],
    );
  }

  /// `By accessing or using our Services, you agree to be bound by these Terms. If you do not agree to these Terms, you may not access or use the Services.`
  String get agreementToTermsDescription {
    return Intl.message(
      'By accessing or using our Services, you agree to be bound by these Terms. If you do not agree to these Terms, you may not access or use the Services.',
      name: 'agreementToTermsDescription',
      desc: '',
      args: [],
    );
  }

  /// `We reserve the right to update or modify these Terms at any time without prior notice. Your use of the Services following any such modification constitutes your agreement to be bound by the modified Terms.`
  String get updateToTermsDescription {
    return Intl.message(
      'We reserve the right to update or modify these Terms at any time without prior notice. Your use of the Services following any such modification constitutes your agreement to be bound by the modified Terms.',
      name: 'updateToTermsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Update To Terms`
  String get updateToTerms {
    return Intl.message(
      'Update To Terms',
      name: 'updateToTerms',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
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
