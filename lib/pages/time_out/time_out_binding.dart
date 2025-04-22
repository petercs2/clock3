import 'package:get/get.dart';

import 'time_out_logic.dart';

class TimeOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimeOutLogic());
  }
}
