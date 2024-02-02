import 'package:flutter/material.dart';
import 'package:ahmet_s_application3/core/app_export.dart';
import 'package:ahmet_s_application3/presentation/academic_calendar_screen/models/academic_calendar_screen.dart';

/// A provider class for the ToDosScreen.
///
/// This provider manages the state of the ToDosScreen, including the
/// current toDosModelObj
class AcademicCalendarProvider extends ChangeNotifier {
  AcademicCalendarModel academicCalendarObj = AcademicCalendarModel();

  @override
  void dispose() {
    super.dispose();
  }
}
