import 'package:get/get.dart';

class SettingsController extends GetxController {
  var username = 'User'.obs;
  var email = 'user@example.com'.obs;
  var notificationsEnabled = false.obs;
  var darkModeEnabled = false.obs;

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
  }
}
