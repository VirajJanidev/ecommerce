
import 'package:get/get.dart';

import '../screen/bottomnavigation/bottomnav_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/splash/splas_screen.dart';

class AppRoute{
  static String splash="/";
  static String home="/home";
  static String login="/login";
  static String bottomNavScreen="/bottomNavScreen";

  static List<GetPage> screens=[
    GetPage(name: splash, page: () => SplasScreen(),),
    GetPage(name: home, page: () => HomeScreen(),),
    GetPage(name: home, page: () => HomeScreen(),),
    GetPage(name: bottomNavScreen, page: () => BottomNavScreen(),),
  ];
}