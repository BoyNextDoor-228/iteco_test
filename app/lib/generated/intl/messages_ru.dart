// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(ratingCount) => "Кол-во отзывов: ${ratingCount}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "empty_product_list_reload_button_text":
            MessageLookupByLibrary.simpleMessage("Повторить попытку"),
        "feedbacksAmount": m0,
        "greeting_subpage_information": MessageLookupByLibrary.simpleMessage(
          "Вы попали на страницу онбординга, требуемую техническим заданием!\nЭта страница будет демонстрироваться единожды при первом запуске приложения!\nПриятного просмотра!",
        ),
        "greeting_subpage_title":
            MessageLookupByLibrary.simpleMessage("Привет!"),
        "home_screen_info_text": MessageLookupByLibrary.simpleMessage(
          "Тут находится домашняя страница, которая была сделана просто так.\n\nЕсли ищите страницу со списком продуктов, то, возможно, Вам стоит заглянуть в бургер-меню.\n\nА ещё можно посмотреть на приложение, если включить на устройстве тёмный режим",
        ),
        "lets_start_subpage_button_text": MessageLookupByLibrary.simpleMessage(
          "Отправиться в приложение!",
        ),
        "lets_start_subpage_information": MessageLookupByLibrary.simpleMessage(
          "Это был онбординг тестового приложения!",
        ),
        "lets_start_subpage_title": MessageLookupByLibrary.simpleMessage(
          "Поехали!",
        ),
        "main_page": MessageLookupByLibrary.simpleMessage("Главная страница"),
        "page_control_button_back":
            MessageLookupByLibrary.simpleMessage("Назад"),
        "page_control_button_forward": MessageLookupByLibrary.simpleMessage(
          "Далее",
        ),
        "product_list_absence_text": MessageLookupByLibrary.simpleMessage(
          "Каталог продуктов пуст, возможно, он будет пополнен позже",
        ),
        "product_list_demo_subpage_title": MessageLookupByLibrary.simpleMessage(
          "Бесконечный скролл продуктов!",
        ),
        "product_list_loading_error": MessageLookupByLibrary.simpleMessage(
          "Не получилось загрузить список продуктов.",
        ),
        "product_list_retry_button_text": MessageLookupByLibrary.simpleMessage(
          "Повторить попытку",
        ),
        "products_list":
            MessageLookupByLibrary.simpleMessage("Список продуктов"),
        "quit": MessageLookupByLibrary.simpleMessage("Выход"),
        "splash_subpage_information": MessageLookupByLibrary.simpleMessage(
          "При запуске приложения Вы могли заметить Splash-screen - его наличие требовалось техническим заданием.\nРеализован он с помощью пакета flutter_splash_screen.",
        ),
        "splash_subpage_title": MessageLookupByLibrary.simpleMessage("SPLASH!"),
      };
}
