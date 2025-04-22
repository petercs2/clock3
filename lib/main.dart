import 'package:color_clock/pages/app_setting/app_setting_binding.dart';
import 'package:color_clock/pages/app_setting/app_setting_view.dart';
import 'package:color_clock/pages/clock_main/clock_main_binding.dart';
import 'package:color_clock/pages/clock_main/clock_main_view.dart';
import 'package:color_clock/pages/clock_text_color_setting/clock_text_color_setting_binding.dart';
import 'package:color_clock/pages/clock_text_color_setting/clock_text_color_setting_view.dart';
import 'package:color_clock/pages/time_out/time_out_binding.dart';
import 'package:color_clock/pages/time_out/time_out_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.black;
List<Color> colorList = const [
  Color(0xffff0000),
  Color(0xffff9300),
  Color(0xffffd800),
  Color(0xff0aff00),
  Color(0xff00d8ff),
  Color(0xff0045ff),
  Color(0xffce00ff),
  Color(0xff8b8b8b),
  Color(0xff1ed595),
  Color(0xffffffff),
  Color(0xff000000),
  Color(0xffffc60a),
];

const String timeFamily = 'Ticking Timebomb BB';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? type = prefs.getInt('type');
  if (type == null) {
    await prefs.setInt('type', 10);
    await prefs.setBool('dark', false);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Sun,
      initialRoute: '/ClockMainPage',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Sun = [
  GetPage(name: '/ClockMainPage', page: () => const ClockMainPage(), binding: ClockMainBinding()),
  GetPage(name: '/ClockTextColorSettingPage', page: () => ClockTextColorSettingPage(), binding: ClockTextColorSettingBinding()),
  GetPage(name: '/AppSettingPage', page: () => const AppSettingPage(), binding: AppSettingBinding()),
  GetPage(name: '/Apptimeout', page: () => const TimeOutView(), binding: TimeOutBinding()),
];