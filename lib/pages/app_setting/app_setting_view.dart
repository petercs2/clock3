import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'app_setting_logic.dart';

class AppSettingPage extends GetView<AppSettingLogic> {
  const AppSettingPage({super.key});

  Widget _item(int index, BuildContext context) {
    final titles = ['Black background', 'About us'];
    return Container(
      width: double.infinity,
      height: 53,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        index == 0
            ? Obx(() {
                return Switch(
                    value: controller.dark.value,
                    activeTrackColor: Colors.green,
                    onChanged: (v) async {
                      controller.dark.value = v;
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('dark', v);
                    });
              })
            : const Text("1.0")
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    )
        .decorated(
            color: const Color(0xffeaeaea),
            borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Program Settings',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[_item(0, context), _item(1, context)].toColumn(),
        ).marginAll(20)),
      ),
    );
  }
}
