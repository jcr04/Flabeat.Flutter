import 'package:flutter/material.dart';

class HeartRateProvider with ChangeNotifier {
  double _currentHeartRate = 60;

  double get currentHeartRate => _currentHeartRate;

  void updateHeartRate(double newRate) {
    if (_currentHeartRate != newRate) {
      _currentHeartRate = newRate;
      notifyListeners();
    }
  }
}
