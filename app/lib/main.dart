import 'package:flutter/material.dart';

import 'config/environment.dart';
import 'iteco_test_app.dart';

void main() {
  Environment.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ItecoTestApp());
}
