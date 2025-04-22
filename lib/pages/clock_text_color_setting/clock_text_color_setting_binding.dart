import 'package:get/get.dart';

import 'clock_text_color_setting_logic.dart';

class ClockTextColorSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClockTextColorSettingLogic());
  }
}
