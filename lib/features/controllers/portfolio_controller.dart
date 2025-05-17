import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/core/data/firebase_remote_service.dart';
import '../models/portfolio_model.dart';

class PortfolioController extends GetxController {
  var isLoading = false.obs;
  var portfolioData = Rx<Portfolio?>(null);
  FirebaseRemoteService firebaseService = FirebaseRemoteService();
  @override
  void onInit() {
    super.onInit();
    fetchData();
    firebaseService.initialize();
    listenForDataUpdates();
  }

  void refreshData() {
    firebaseService.fetchData();
  }

  void listenForDataUpdates() {
    firebaseService.getPortfolioNotifier().addListener(() {
      portfolioData.value = firebaseService.getPortfolioNotifier().value;
    });
  }

  void fetchData() async {
    isLoading.value = true;
    try {
      Portfolio data = firebaseService.getPortfolioNotifier().value;
      portfolioData.value = data;
    } catch (e) {
      debugPrint("Error fetching portfolio data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
