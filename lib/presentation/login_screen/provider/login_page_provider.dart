import 'package:flutter/material.dart';
import 'package:ahmet_s_application3/presentation/main_page_screen/models/main_page_model.dart';

import '../models/login_page_model.dart';

class LoginPageProvider extends ChangeNotifier {
  TextEditingController editTextController = TextEditingController();

  LoginPageModel loginPageModelObj = LoginPageModel();

  @override
  void dispose() {
    super.dispose();
    editTextController.dispose();
  }
}
