import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/feedbackController.dart';

class FeedbackScreen extends StatelessWidget {
  final FeedbackController _feedbackController = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => SwitchListTile(
                title: Text('Status'),
                value: _feedbackController.status.value,
                onChanged: (bool value) {
                  _feedbackController.status.value = value;
                },
              ),
            ),
            TextField(
              controller: _feedbackController.amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _feedbackController.commentController,
              decoration: InputDecoration(
                labelText: 'Comment',
              ),
            ),
            TextField(
              controller: _feedbackController.timesCalledController,
              decoration: InputDecoration(
                labelText: 'Number of Times Called',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                _feedbackController.submitForm();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
