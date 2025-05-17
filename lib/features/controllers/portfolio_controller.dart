import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/core/data/firebase_remote_service.dart';
import '../models/portfolio_model.dart';

class PortfolioController extends GetxController {
  var isLoading = false.obs;
  var portfolioData = Rx<Portfolio?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading.value = true;
    try {
      FirebaseRemoteService firebaseService = FirebaseRemoteService();
      Portfolio data = firebaseService.getPortfolioData();
      portfolioData.value = data;
    } catch (e) {
      debugPrint("Error fetching portfolio data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
