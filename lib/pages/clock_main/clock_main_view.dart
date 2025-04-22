import 'package:color_clock/main.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'clock_main_logic.dart';

class ClockMainPage extends StatefulWidget {
  const ClockMainPage({Key? key}) : super(key: key);

  @override
  State<ClockMainPage> createState() => _ClockMainPageState();
}

class _ClockMainPageState extends State<ClockMainPage> {
  ClockMainLogic controller = Get.find();

  void checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.toNamed('/Apptimeout');
    }
  }

  @override
  void initState() {
    // TODO: implement initState\
    checkNetwork();
    super.initState();
  }

  Widget _item(int index) {
    final titles = ['Font color setting', 'Program Settings'];
    return Container(
      width: double.infinity,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 25,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    )
        .decorated(
            color: const Color(0xffeaeaea),
            borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      if (index == 0) {
        Get.toNamed('/ClockTextColorSettingPage')?.then((_) {
          controller.startTimer();
        });
      } else {
        Get.toNamed('/AppSettingPage')?.then((_) {
          controller.startTimer();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: controller.bgColor.value,
          padding: const EdgeInsets.all(20),
          child: SafeArea(
              child: <Widget>[
            <Widget>[
              Obx(() {
                return Text(
                  controller.weekDayStr.value,
                  style: TextStyle(
                      fontSize: 21,
                      color: controller.textColor.value,
                      fontFamily: timeFamily),
                );
              }),
              <Widget>[
                Obx(() {
                  return Container(
                    height: 120,
                    child: Text(
                      controller.hmStr.value,
                      style: TextStyle(
                          fontSize: 140,
                          height: 1,
                          color: controller.textColor.value,
                          fontFamily: timeFamily),
                    ),
                  );
                }),
                <Widget>[
                  Obx(() {
                    return Text(
                      controller.apmStr.value,
                      style: TextStyle(
                          fontSize: 43,
                          color: controller.textColor.value,
                          fontFamily: timeFamily),
                    );
                  }),
                  Obx(() {
                    return Text(
                      controller.secondStr.value,
                      style: TextStyle(
                          fontSize: 36,
                          color: controller.textColor.value,
                          fontFamily: timeFamily),
                    );
                  }),
                ]
                    .toColumn(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start)
                    .marginOnly(left: 10)
              ].toRow(crossAxisAlignment: CrossAxisAlignment.center)
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            Obx(() {
              return Text(
                controller.hmdStr.value,
                style: TextStyle(
                    fontSize: 38,
                    color: controller.textColor.value,
                    fontFamily: timeFamily),
              );
            }),
            const SizedBox(
              height: 200,
            ),
            <Widget>[_item(0), _item(1)]
                .toColumn(mainAxisAlignment: MainAxisAlignment.end)
          ].toColumn(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start)),
        );
      }),
    );
  }
}
