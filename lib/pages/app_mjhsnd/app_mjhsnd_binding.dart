import 'package:get/get.dart';

import 'app_mjhsnd_logic.dart';

class AppMjhsndBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
