import 'dart:async';

import 'package:color_clock/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockMainLogic extends GetxController {

  var hmdStr = ''.obs;
  var weekDayStr = ''.obs;
  var apmStr = ''.obs;
  var hmStr = ''.obs;
  var secondStr = ''.obs;
  var bgColor = Colors.white.obs;
  var textColor = Colors.black.obs;

  Timer? _timer;

  void startTimer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final type = prefs.getInt('type') ?? 10;
    final dark = prefs.getBool('dark') ?? true;
    textColor.value = colorList[type];
    bgColor.value = dark ? Colors.black : Colors.white;
    getData();
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getData();
    });
  }

  void getData() {
    final now = DateTime.now();
    hmdStr.value = DateFormat('MM/dd/yyyy').format(now);
    weekDayStr.value = DateFormat('EEEE').format(now);
    apmStr.value = DateFormat('a').format(now).toUpperCase();
    hmStr.value = DateFormat('hh:mm').format(now);
    secondStr.value = DateFormat(':ss').format(now);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
  }

}
