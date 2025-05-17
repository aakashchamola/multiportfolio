import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:multiportfolio/features/models/portfolio_model.dart';
import 'package:multiportfolio/features/models/profile_model.dart';
import 'dart:convert';

class FirebaseRemoteService {
  static final FirebaseRemoteService _instance =
      FirebaseRemoteService._internal();
  late FirebaseRemoteConfig _remoteConfig;

  final ValueNotifier<Portfolio> portfolioNotifier = ValueNotifier<Portfolio>(
    Portfolio(
      profile: Profile(
        name: '',
        title: '',
        image: '',
        contact: Contact(
            address: '', email: '', phone: '', linkedin: '', github: ''),
        summary: '',
      ),
      experience: [],
      education: [],
      skills: [],
      certifications: [],
      achievements: [],
      projects: [],
      title: '',
      message: '',
    ),
  );

  factory FirebaseRemoteService() {
    return _instance;
  }

  FirebaseRemoteService._internal() {
    _remoteConfig = FirebaseRemoteConfig.instance;
  }

  Future<void> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 10), // For testing
      ));

      await _remoteConfig.ensureInitialized();
      await fetchData(); // Fetch data immediately after initialization
    } catch (e) {
      debugPrint("Firebase Initialization Error: $e");
    }
  }

  Future<void> fetchData() async {
    try {
      await _remoteConfig.fetchAndActivate();
      String data = _remoteConfig.getString('portfolio');
      if (data.isNotEmpty) {
        Map<String, dynamic> jsonData = json.decode(data);
        Portfolio portfolio = Portfolio.fromJson(jsonData);
        portfolioNotifier.value = portfolio;
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }
  }

  ValueNotifier<Portfolio> getPortfolioNotifier() {
    return portfolioNotifier;
  }
}
