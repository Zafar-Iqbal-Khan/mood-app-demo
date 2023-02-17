import 'dart:developer';

import 'package:get/get.dart';

import '../model/model.dart';
import '../service/api_service.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var isDataLoading = false.obs;

  @override
  onInit() async {
    await getUserData();
    super.onInit();
  }

  MoodModel? moodModel;
  List<double> emoji_point = [];
  List<String> created_at = [];
  getUserData() async {
    isDataLoading.value = true;
    http.Response response = await getCustomersData();
    if (response.statusCode == 200) {
      moodModel = moodModelFromJson(response.body);
    } else {
      log("Something went wrong");
    }
  }

  setData() {
    for (var element in moodModel!.moodalytics!) {
      emoji_point.add(element.emojiPoint!.toDouble());
      created_at.add(element.createdAt.toString());
    }
    isDataLoading.value = false;
  }
}
