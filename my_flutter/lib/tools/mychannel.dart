import 'package:flutter/services.dart';

class BaseVcChannel {
  static const baseVcChannel = MethodChannel('BaseControllerChannel');
  back() {
    baseVcChannel.invokeListMethod("back");
  }
}

class MyChannel {
  //  const baseChannel = BaseVcChannel();
}
