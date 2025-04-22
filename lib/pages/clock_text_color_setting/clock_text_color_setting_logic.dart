import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockTextColorSettingLogic extends GetxController {

  int type = 0;

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    type = prefs.getInt('type') ?? 0;
    update();
    super.onInit();
  }

}
