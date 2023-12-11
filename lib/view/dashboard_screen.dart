// lib/view/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leads_management/config.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../controllers/dashboardController.dart';
import '../reuseableWidgets/custom_list_tile_leaderboard.dart';
import '../reuseableWidgets/custom_progress_bar.dart';

class DashboardScreen extends StatelessWidget {
  final ValueNotifier<double> valueNotifier = ValueNotifier(60);
  final ValueNotifier<double> valueNotifier2 = ValueNotifier(60);

  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    valueNotifier.value = 45.0;
    valueNotifier2.value = 75.0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome Zoz',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Let's see your analytics",
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 34),
            Text(
              "Your Analytics,",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SimpleCircularProgressBar(
                            size: 100,
                            valueNotifier: valueNotifier2,
                            startAngle: 0,
                            progressColors: const [UiConfig.colorSec],
                            progressStrokeWidth: 15,
                            backColor:Colors.grey,
                            backStrokeWidth: 15,
                            animationDuration: 3,
                            mergeMode: true,
                            onGetText: (double value) {
                              return Text(
                                '${value.toInt()}%',
                                style: TextStyle(fontSize: 32),
                              );
                            },
                          ),
                          SizedBox(height: 16,),
                          Text("Lost Leads",style: TextStyle(fontSize: 22,),),
                        ],
                      ),
                      Column(
                        children: [
                          SimpleCircularProgressBar(
                            size: 100,
                            valueNotifier: valueNotifier,
                            startAngle: 0,
                            progressColors: const [UiConfig.niceGreen],
                            progressStrokeWidth: 15,
                            backColor: Colors.grey,
                            backStrokeWidth: 15,
                            animationDuration: 3,
                            mergeMode: true,
                            onGetText: (double value) {
                              return Text(
                                '${value.toInt()}%',
                                style: TextStyle(fontSize: 32),
                              );
                            },
                          ),
                          SizedBox(height: 16,),
                          Text("Target",style: TextStyle(fontSize: 22,),),                        ],
                      ),


                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Your Standings,",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                itemCount: dashboardController.leaderboardsData.length,
                itemBuilder: (context, index) {
                  var leaderboardItem =
                  dashboardController.leaderboardsData[index];
                  return CustomListTileLeaderBoard(
                    startIcon: leaderboardItem['startIcon'],
                    genderIcon: leaderboardItem['genderIcon'],
                    name: leaderboardItem['name'],
                    points: leaderboardItem['score'].toString(),
                    endIcon: leaderboardItem['endIcon'], startIconColor: leaderboardItem['startIconColor'], genderIconColor: leaderboardItem['genderIconColor'], endIconColor: leaderboardItem['endIconColor'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
