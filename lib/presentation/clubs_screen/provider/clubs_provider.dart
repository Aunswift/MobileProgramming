import 'package:flutter/material.dart';
import 'package:ahmet_s_application3/core/app_export.dart';
import 'package:ahmet_s_application3/presentation/clubs_screen/models/clubs_model.dart';

/// A provider class for the ClubsScreen.
///
/// This provider manages the state of the ClubsScreen, including the
/// current clubsModelObj
class ClubsProvider extends ChangeNotifier {
  ClubsModel clubsModelObj = ClubsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
