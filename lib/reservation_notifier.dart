import 'package:flutter/material.dart';

class ReservationNotifier extends ChangeNotifier {
  Map<String, int> _reservationNumbers = {};
  final int _averageWaitingTimePerReservation = 5;

  int getReservationNumber(String restaurantId) {
    return _reservationNumbers[restaurantId] ?? 0;
  }

  int getEstimatedWaitingTime(String restaurantId) {
    return _reservationNumbers[restaurantId] != null ? _reservationNumbers[restaurantId]! * _averageWaitingTimePerReservation : 0;
  }

  void makeReservation(String restaurantId) {
    if (!_reservationNumbers.containsKey(restaurantId)) {
      _reservationNumbers[restaurantId] = 0;
    }
    _reservationNumbers[restaurantId] = _reservationNumbers[restaurantId]! + 1;
    notifyListeners();
  }

  bool hasAnyReservations() {
    return _reservationNumbers.values.any((count) => count > 0);
  }
  // Checks if there are reservations for a specific restaurant
  bool hasReservations(String restaurantId) {
    return _reservationNumbers.containsKey(restaurantId) && _reservationNumbers[restaurantId]! > 0;
  }
}
