import 'dart:io';

import 'package:flutter/material.dart';

class GlobalValues {
  static ValueNotifier isValidating = ValueNotifier(false);
  static ValueNotifier themeApp = ValueNotifier(ThemeData.light());
  static ValueNotifier<File?> userImage = ValueNotifier<File?>(null);

  static ValueNotifier updateList = ValueNotifier(false);
}
