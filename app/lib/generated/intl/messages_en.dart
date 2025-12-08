// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(ratingCount) => "Feedbacks count: ${ratingCount}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "empty_product_list_reload_button_text":
            MessageLookupByLibrary.simpleMessage("Retry"),
        "failed_to_load_image": MessageLookupByLibrary.simpleMessage(
          "Не получилось загрузить изображение",
        ),
        "feedbacksAmount": m0,
        "greeting_subpage_information": MessageLookupByLibrary.simpleMessage(
          "You\'re on onborading page, which is required by technical task!\nThis page will be shown once, on application launched for the very first time!\nHave a nice watching!",
        ),
        "greeting_subpage_title":
            MessageLookupByLibrary.simpleMessage("Hello!"),
        "home_screen_info_text": MessageLookupByLibrary.simpleMessage(
          "Here goes the main page, which ws made for nothing.\n\nIf you\'re looking for a page with products list, you probably should look for it in burger menu.\n\nYou can also look at this application with device dark theme turned on",
        ),
        "lets_start_subpage_button_text": MessageLookupByLibrary.simpleMessage(
          "Go to application!",
        ),
        "lets_start_subpage_information": MessageLookupByLibrary.simpleMessage(
          "It was an onboarding of the test application!",
        ),
        "lets_start_subpage_title": MessageLookupByLibrary.simpleMessage(
          "Let\'s roll!",
        ),
        "main_page": MessageLookupByLibrary.simpleMessage("Main page"),
        "page_control_button_back":
            MessageLookupByLibrary.simpleMessage("Back"),
        "page_control_button_forward":
            MessageLookupByLibrary.simpleMessage("Next"),
        "product_list_absence_text": MessageLookupByLibrary.simpleMessage(
          "Products catalogue is empty, maybe, it will be filled later",
        ),
        "product_list_demo_subpage_title": MessageLookupByLibrary.simpleMessage(
          "Infinite products scroll!",
        ),
        "product_list_loading_error": MessageLookupByLibrary.simpleMessage(
          "Failed to load products list.",
        ),
        "product_list_retry_button_text": MessageLookupByLibrary.simpleMessage(
          "Retry",
        ),
        "products_list": MessageLookupByLibrary.simpleMessage("Products list"),
        "quit": MessageLookupByLibrary.simpleMessage("Quit"),
        "splash_subpage_information": MessageLookupByLibrary.simpleMessage(
          "On application launch you could have noticed Splash-screen - it\'s presence was required by technical task.\nIt was implemented using flutter_splash_screen package.",
        ),
        "splash_subpage_title": MessageLookupByLibrary.simpleMessage("SPLASH!"),
      };
}
