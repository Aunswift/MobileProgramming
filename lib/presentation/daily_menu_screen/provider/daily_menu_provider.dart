import 'package:flutter/material.dart';
import 'package:ahmet_s_application3/presentation/daily_menu_screen/models/daily_menu_model.dart';

/// A provider class for the DailyMenuScreen.
///
/// This provider manages the state of the DailyMenuScreen, including the
/// current dailyMenuModelObj
class DailyMenuProvider extends ChangeNotifier {
  DailyMenuModel dailyMenuModelObj = DailyMenuModel();

  @override
  void dispose() {
    super.dispose();
  }
}
