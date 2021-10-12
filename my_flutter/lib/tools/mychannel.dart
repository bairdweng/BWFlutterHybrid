import 'package:flutter/services.dart';

class MyChannel {
  const MyChannel();
  static const baseVcChannel = MethodChannel('BaseControllerChannel');
  static back() {
    baseVcChannel.invokeListMethod("back");
  }
}
