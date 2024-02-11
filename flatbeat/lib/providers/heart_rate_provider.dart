import 'package:flutter_riverpod/flutter_riverpod.dart';

final heartRateProvider =
    StateNotifierProvider<HeartRateNotifier, double>((ref) {
  return HeartRateNotifier();
});

class HeartRateNotifier extends StateNotifier<double> {
  HeartRateNotifier() : super(60);

  void updateHeartRate(double newRate) {
    if (state != newRate) {
      state = newRate;
    }
  }
}
