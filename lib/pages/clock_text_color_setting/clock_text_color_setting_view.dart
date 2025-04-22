import 'package:color_clock/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'clock_text_color_setting_logic.dart';

class ClockTextColorSettingPage extends GetView<ClockTextColorSettingLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Font color setting',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<ClockTextColorSettingLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemCount: colorList.length,
                    itemBuilder: (_, index) {
                      return LayoutBuilder(builder: (_, max) {
                        return <Widget>[
                          Container().decorated(
                              color: colorList[index],
                              borderRadius:
                                  BorderRadius.circular(max.maxHeight / 2)),
                          Visibility(
                              visible: controller.type == index,
                              child:const Icon(
                                Icons.check_circle,
                                size: 25,
                                color: Colors.white,
                              ))
                        ].toStack(alignment: Alignment.center).gestures(onTap: () async {
                          controller.type = index;
                          controller.update();
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setInt('type', index);
                        });
                      });
                    }),
              ).decorated(
                  color: const Color(0xffeaeaea),
                  borderRadius: BorderRadius.circular(10))
            ].toColumn(),
          );
        }).marginAll(20)),
      ),
    );
  }
}
