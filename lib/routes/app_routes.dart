import 'package:flutter/material.dart';
import 'package:ahmet_s_application3/presentation/main_page_screen/main_page_screen.dart';
import 'package:ahmet_s_application3/presentation/clubs_screen/clubs_screen.dart';
import 'package:ahmet_s_application3/presentation/daily_menu_screen/daily_menu_screen.dart';
import 'package:ahmet_s_application3/presentation/academic_calendar_screen/academic_calendar_screen.dart';
import 'package:ahmet_s_application3/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String mainPageScreen = '/main_page_screen';

  static const String bookedPageScreen = '/booked_page';

  static const String clubsScreen = '/clubs_screen';

  static const String dailyMenuScreen = '/daily_menu_screen';

  static const String AcademicCalendarScreen = '/academic_calendar_screen';

  static const String loginScreen= '/login_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String signInScreen = '/sign_in_screen';

  static const String adminPanel = '/admin_panel';

  static const String postList = '/post_list_page';

  static Map<String, WidgetBuilder> get routes => {
        mainPageScreen: MainPageScreen.builder,
        clubsScreen: ClubsScreen.builder,
        dailyMenuScreen: DailyMenuScreen.builder,
        AcademicCalendarScreen: AcademicCalendarPage.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: MainPageScreen.builder,
      };
}
