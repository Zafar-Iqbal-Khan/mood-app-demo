import 'dart:developer';

import 'package:get/get.dart';

import '../service/api_service.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var isDataLoading = false.obs;

  getUserData() async {
    isDataLoading.value = true;
    http.Response response = await getCustomersData();
    if (response.statusCode == 200) {
      // feed the data to the model
      isDataLoading.value = false;
    } else {
      log("Something went wrong");
    }
  }
}
