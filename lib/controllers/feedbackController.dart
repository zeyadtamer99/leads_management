import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  var status = false.obs;
  var amountController = TextEditingController();
  var commentController = TextEditingController();
  var timesCalledController = TextEditingController();

  void submitForm() {
    print('Status: ${status.value ? 'Active' : 'Inactive'}');
    print('Amount: ${amountController.text}');
    print('Comment: ${commentController.text}');
    print('Number of Times Called: ${timesCalledController.text}');
  }
}