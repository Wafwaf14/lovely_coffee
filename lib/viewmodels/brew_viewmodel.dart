// lib/viewmodels/brew_viewmodel.dart
import 'package:flutter/material.dart';
import 'dart:async';

class BrewViewModel extends ChangeNotifier {
  int _timerSeconds = 0;
  int _selectedTimerPreset = 0;
  double _coffeeAmount = 15;
  double _waterAmount = 250;
  int _cups = 1;
  Timer? _timer;
  bool _isTimerRunning = false;
  
  // Getters
  int get timerSeconds => _timerSeconds;
  int get selectedTimerPreset => _selectedTimerPreset;
  double get coffeeAmount => _coffeeAmount;
  double get waterAmount => _waterAmount;
  int get cups => _cups;
  bool get isTimerRunning => _isTimerRunning;
  
  String get timerDisplay {
    final minutes = _timerSeconds ~/ 60;
    final seconds = _timerSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
  
  double get ratio => _waterAmount / _coffeeAmount;
  
  // Timer methods
  void setTimerPreset(int seconds) {
    _selectedTimerPreset = seconds;
    _timerSeconds = seconds;
    notifyListeners();
  }
  
  void startTimer() {
    if (_timerSeconds > 0 && !_isTimerRunning) {
      _isTimerRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_timerSeconds > 0) {
          _timerSeconds--;
          notifyListeners();
        } else {
          stopTimer();
        }
      });
      notifyListeners();
    }
  }
  
  void stopTimer() {
    _timer?.cancel();
    _isTimerRunning = false;
    notifyListeners();
  }
  
  void resetTimer() {
    stopTimer();
    _timerSeconds = _selectedTimerPreset;
    notifyListeners();
  }
  
  // Ratio calculator methods
  void setCups(int cups) {
    _cups = cups;
    _calculateRatio();
  }
  
  void _calculateRatio() {
    _coffeeAmount = 15.0 * _cups;
    _waterAmount = 250.0 * _cups;
    notifyListeners();
  }
  
  void updateCoffeeAmount(double amount) {
    _coffeeAmount = amount;
    _waterAmount = amount * 16.67; // 1:16.67 ratio
    notifyListeners();
  }
  
  void updateWaterAmount(double amount) {
    _waterAmount = amount;
    _coffeeAmount = amount / 16.67;
    notifyListeners();
  }
  
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}