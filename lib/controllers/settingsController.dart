import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themeService.dart';

class SettingsController extends GetxController {
  var username = 'User'.obs;
  var email = 'user@example.com'.obs;
  var notificationsEnabled = false.obs;
  var darkModeEnabled = (ThemeService().getThemeMode() == ThemeMode.dark).obs;

  void updateUsername(String newUsername) {
    username.value = newUsername;
  }

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  void toggleNotifications() {
    notificationsEnabled.toggle();
  }

  void toggleDarkMode() {
    darkModeEnabled.toggle();
    ThemeService().changeTheme();
  }
}
