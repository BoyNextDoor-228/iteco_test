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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Main page`
  String get main_page {
    return Intl.message('Main page', name: 'main_page', desc: '', args: []);
  }

  /// `Products list`
  String get products_list {
    return Intl.message(
      'Products list',
      name: 'products_list',
      desc: '',
      args: [],
    );
  }

  /// `Quit`
  String get quit {
    return Intl.message('Quit', name: 'quit', desc: '', args: []);
  }

  /// `Here goes the main page, which ws made for nothing.\n\nIf you're looking for a page with products list, you probably should look for it in burger menu.\n\nYou can also look at this application with device dark theme turned on`
  String get home_screen_info_text {
    return Intl.message(
      'Here goes the main page, which ws made for nothing.\n\nIf you\'re looking for a page with products list, you probably should look for it in burger menu.\n\nYou can also look at this application with device dark theme turned on',
      name: 'home_screen_info_text',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get greeting_subpage_title {
    return Intl.message(
      'Hello!',
      name: 'greeting_subpage_title',
      desc: '',
      args: [],
    );
  }

  /// `SPLASH!`
  String get splash_subpage_title {
    return Intl.message(
      'SPLASH!',
      name: 'splash_subpage_title',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get page_control_button_back {
    return Intl.message(
      'Back',
      name: 'page_control_button_back',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get page_control_button_forward {
    return Intl.message(
      'Next',
      name: 'page_control_button_forward',
      desc: '',
      args: [],
    );
  }

  /// `Let's roll!`
  String get lets_start_subpage_title {
    return Intl.message(
      'Let\'s roll!',
      name: 'lets_start_subpage_title',
      desc: '',
      args: [],
    );
  }

  /// `Go to application!`
  String get lets_start_subpage_button_text {
    return Intl.message(
      'Go to application!',
      name: 'lets_start_subpage_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Infinite products scroll!`
  String get product_list_demo_subpage_title {
    return Intl.message(
      'Infinite products scroll!',
      name: 'product_list_demo_subpage_title',
      desc: '',
      args: [],
    );
  }

  /// `You're on onborading page, which is required by technical task!\nThis page will be shown once, on application launched for the very first time!\nHave a nice watching!`
  String get greeting_subpage_information {
    return Intl.message(
      'You\'re on onborading page, which is required by technical task!\nThis page will be shown once, on application launched for the very first time!\nHave a nice watching!',
      name: 'greeting_subpage_information',
      desc: '',
      args: [],
    );
  }

  /// `On application launch you could have noticed Splash-screen - it's presence was required by technical task.\nIt was implemented using flutter_splash_screen package.`
  String get splash_subpage_information {
    return Intl.message(
      'On application launch you could have noticed Splash-screen - it\'s presence was required by technical task.\nIt was implemented using flutter_splash_screen package.',
      name: 'splash_subpage_information',
      desc: '',
      args: [],
    );
  }

  /// `It was an onboarding of the test application!`
  String get lets_start_subpage_information {
    return Intl.message(
      'It was an onboarding of the test application!',
      name: 'lets_start_subpage_information',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load products list.`
  String get product_list_loading_error {
    return Intl.message(
      'Failed to load products list.',
      name: 'product_list_loading_error',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get product_list_retry_button_text {
    return Intl.message(
      'Retry',
      name: 'product_list_retry_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Products catalogue is empty, maybe, it will be filled later`
  String get product_list_absence_text {
    return Intl.message(
      'Products catalogue is empty, maybe, it will be filled later',
      name: 'product_list_absence_text',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get empty_product_list_reload_button_text {
    return Intl.message(
      'Retry',
      name: 'empty_product_list_reload_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Feedbacks count: {ratingCount}`
  String feedbacksAmount(Object ratingCount) {
    return Intl.message(
      'Feedbacks count: $ratingCount',
      name: 'feedbacksAmount',
      desc: '',
      args: [ratingCount],
    );
  }

  /// `Не получилось загрузить изображение`
  String get failed_to_load_image {
    return Intl.message(
      'Не получилось загрузить изображение',
      name: 'failed_to_load_image',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
