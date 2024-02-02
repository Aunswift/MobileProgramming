import 'package:flutter/material.dart';
import 'package:ahmet_s_application3/presentation/main_page_screen/models/main_page_model.dart';

class MainPageProvider extends ChangeNotifier {
  TextEditingController editTextController = TextEditingController();

  MainPageModel mainPageModelObj = MainPageModel();

  @override
  void dispose() {
    super.dispose();
    editTextController.dispose();
  }
}
