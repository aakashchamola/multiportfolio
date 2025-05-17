import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:multiportfolio/features/models/portfolio_model.dart';
import 'package:multiportfolio/features/models/profile_model.dart';
import 'dart:convert';

class FirebaseRemoteService {
  static final FirebaseRemoteService _instance =
      FirebaseRemoteService._internal();
  late FirebaseRemoteConfig _remoteConfig;

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
        minimumFetchInterval: const Duration(hours: 1),
      ));

      await _remoteConfig.ensureInitialized();
      await fetchData();
    } catch (e) {
      debugPrint("Firebase Initialization Error: $e");
    }
  }

  Future<void> fetchData() async {
    try {
      await _remoteConfig.fetchAndActivate();
      debugPrint("Firebase Remote Config data fetched and activated.");
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }
  }

  Portfolio getPortfolioData() {
    try {
      String data = _remoteConfig.getString('portfolio_data');
      if (data.isNotEmpty) {
        Map<String, dynamic> jsonData = json.decode(data);
        return Portfolio.fromJson(jsonData);
      }
    } catch (e) {
      debugPrint("Error parsing portfolio data: $e");
    }
    // Return empty data if parsing fails
    return Portfolio(
      profile: Profile(
        name: '',
        title: '',
        contact: Contact(address: '', email: '', phone: '', linkedin: ''),
        summary: '',
      ),
      experience: [],
      education: [],
      skills: [],
      certifications: [],
      achievements: [],
      projects: [],
    );
  }
}
