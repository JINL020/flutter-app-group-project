import 'package:flutter/widgets.dart';

//gives me the size of the phone screen
class PhoneSize {
  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
