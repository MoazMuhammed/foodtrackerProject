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

  /// `UserName`
  String get username {
    return Intl.message(
      'UserName',
      name: 'username',
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

  /// `Licenses`
  String get licenses {
    return Intl.message(
      'Licenses',
      name: 'licenses',
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

  /// `Enter Your UserName`
  String get enterUserName {
    return Intl.message(
      'Enter Your UserName',
      name: 'enterUserName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone`
  String get enterPhone {
    return Intl.message(
      'Enter Your Phone',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Confirm Password`
  String get enterConfirmPassword {
    return Intl.message(
      'Enter Your Confirm Password',
      name: 'enterConfirmPassword',
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

  /// `Allergy Type`
  String get allergyType {
    return Intl.message(
      'Allergy Type',
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

  /// `Normal Level :`
  String get normalLevel {
    return Intl.message(
      'Normal Level :',
      name: 'normalLevel',
      desc: '',
      args: [],
    );
  }

  /// `Danger Level :`
  String get dangerLevel {
    return Intl.message(
      'Danger Level :',
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

  /// `The "Contact Us" functionality is commonly used in applications or websites to provide a means for users to get in touch with the organization or support team. It allows users to send inquiries, provide feedback, report issues, or seek assistance.`
  String get contactUsDescription {
    return Intl.message(
      'The "Contact Us" functionality is commonly used in applications or websites to provide a means for users to get in touch with the organization or support team. It allows users to send inquiries, provide feedback, report issues, or seek assistance.',
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

  /// `LogOut`
  String get logOut {
    return Intl.message(
      'LogOut',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Sorry their is no comments for Now`
  String get noComment {
    return Intl.message(
      'Sorry their is no comments for Now',
      name: 'noComment',
      desc: '',
      args: [],
    );
  }

  /// `only The Admins And Doctors can set a comment`
  String get onlyAdmin {
    return Intl.message(
      'only The Admins And Doctors can set a comment',
      name: 'onlyAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Details :`
  String get details {
    return Intl.message(
      'Details :',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Symptoms and signs :`
  String get symptomsAndSigns {
    return Intl.message(
      'Symptoms and signs :',
      name: 'symptomsAndSigns',
      desc: '',
      args: [],
    );
  }

  /// `Protection :`
  String get protection {
    return Intl.message(
      'Protection :',
      name: 'protection',
      desc: '',
      args: [],
    );
  }

  /// `Enter IGE Total Number`
  String get iGENumber {
    return Intl.message(
      'Enter IGE Total Number',
      name: 'iGENumber',
      desc: '',
      args: [],
    );
  }

  /// `Process completed`
  String get processCompleted {
    return Intl.message(
      'Process completed',
      name: 'processCompleted',
      desc: '',
      args: [],
    );
  }

  /// `IGE Total Results :`
  String get iGEResult {
    return Intl.message(
      'IGE Total Results :',
      name: 'iGEResult',
      desc: '',
      args: [],
    );
  }

  /// `You Are In :`
  String get status {
    return Intl.message(
      'You Are In :',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Warming level :`
  String get warmingLevel {
    return Intl.message(
      'Warming level :',
      name: 'warmingLevel',
      desc: '',
      args: [],
    );
  }

  /// `IGE Total Levels :`
  String get iGETotalLevels {
    return Intl.message(
      'IGE Total Levels :',
      name: 'iGETotalLevels',
      desc: '',
      args: [],
    );
  }

  /// `It may be: allergic disorders - some types of infections - autoimmune diseases.`
  String get warmingLevelDescription {
    return Intl.message(
      'It may be: allergic disorders - some types of infections - autoimmune diseases.',
      name: 'warmingLevelDescription',
      desc: '',
      args: [],
    );
  }

  /// `It is not evidence of a specific disease.`
  String get normalLevelDescription {
    return Intl.message(
      'It is not evidence of a specific disease.',
      name: 'normalLevelDescription',
      desc: '',
      args: [],
    );
  }

  /// `Allergy Classes`
  String get allergyClasses {
    return Intl.message(
      'Allergy Classes',
      name: 'allergyClasses',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Products`
  String get recommendedProducts {
    return Intl.message(
      'Recommended Products',
      name: 'recommendedProducts',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Allergy Product Details`
  String get allergyProductDetails {
    return Intl.message(
      'Allergy Product Details',
      name: 'allergyProductDetails',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Edit Personal Information`
  String get editPersonalInformation {
    return Intl.message(
      'Edit Personal Information',
      name: 'editPersonalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Update Your Picture`
  String get updateourPicture {
    return Intl.message(
      'Update Your Picture',
      name: 'updateourPicture',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Check Cart`
  String get checkCart {
    return Intl.message(
      'Check Cart',
      name: 'checkCart',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Grand Total`
  String get grandTotal {
    return Intl.message(
      'Grand Total',
      name: 'grandTotal',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Owner Name`
  String get ownerName {
    return Intl.message(
      'Owner Name',
      name: 'ownerName',
      desc: '',
      args: [],
    );
  }

  /// `Owner Telephone`
  String get ownerTelephone {
    return Intl.message(
      'Owner Telephone',
      name: 'ownerTelephone',
      desc: '',
      args: [],
    );
  }

  /// `Address of shipment`
  String get addressOfShipment {
    return Intl.message(
      'Address of shipment',
      name: 'addressOfShipment',
      desc: '',
      args: [],
    );
  }

  /// `Date of Delivery`
  String get dateOfDelivery {
    return Intl.message(
      'Date of Delivery',
      name: 'dateOfDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Date of shipment`
  String get dateOfShipment {
    return Intl.message(
      'Date of shipment',
      name: 'dateOfShipment',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been done correctly`
  String get congDes {
    return Intl.message(
      'Your order has been done correctly',
      name: 'congDes',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Show What's in your Mind ….`
  String get postHint {
    return Intl.message(
      'Show What\'s in your Mind ….',
      name: 'postHint',
      desc: '',
      args: [],
    );
  }

  /// `Picture`
  String get pic {
    return Intl.message(
      'Picture',
      name: 'pic',
      desc: '',
      args: [],
    );
  }

  /// `Wheat Allergy`
  String get wheatAllergy {
    return Intl.message(
      'Wheat Allergy',
      name: 'wheatAllergy',
      desc: '',
      args: [],
    );
  }

  /// `Milk Allergy`
  String get milkAllergy {
    return Intl.message(
      'Milk Allergy',
      name: 'milkAllergy',
      desc: '',
      args: [],
    );
  }

  /// `Egg Allergy`
  String get eggAllergy {
    return Intl.message(
      'Egg Allergy',
      name: 'eggAllergy',
      desc: '',
      args: [],
    );
  }

  /// `Nuts Allergy`
  String get nutsAllergy {
    return Intl.message(
      'Nuts Allergy',
      name: 'nutsAllergy',
      desc: '',
      args: [],
    );
  }

  /// `Meat Allergy`
  String get meatAllergy {
    return Intl.message(
      'Meat Allergy',
      name: 'meatAllergy',
      desc: '',
      args: [],
    );
  }

  /// `Fish Allergy`
  String get fishAllergy {
    return Intl.message(
      'Fish Allergy',
      name: 'fishAllergy',
      desc: '',
      args: [],
    );
  }

  /// `To See How To Analysis Food`
  String get howToAnalysisFood {
    return Intl.message(
      'To See How To Analysis Food',
      name: 'howToAnalysisFood',
      desc: '',
      args: [],
    );
  }

  /// `Quick Access`
  String get quickAccess {
    return Intl.message(
      'Quick Access',
      name: 'quickAccess',
      desc: '',
      args: [],
    );
  }

  /// `Item added to cart successfully`
  String get addToCartSuccessfully {
    return Intl.message(
      'Item added to cart successfully',
      name: 'addToCartSuccessfully',
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
