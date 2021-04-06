import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppData extends ChangeNotifier {
  var box = Hive.box('AppData');
  int _occupancy = 0;
  double _energyRate = 0.0;

  int get occupancy => _occupancy;
  double get energyRate => _energyRate;
  double get energyConsumption => _energyRate * _occupancy;

  void assignAppData() {
    _occupancy = box.get('occupancy', defaultValue: 0);
    _energyRate = box.get('energyRate', defaultValue: 0.0);
    // notifyListeners();
  }

  void handleOccupancyAddition() {
    _occupancy += 1;
    notifyListeners();
  }

  void handleOccupancySubtraction() {
    if (_occupancy > 0) {
      _occupancy -= 1;
    }
    notifyListeners();
  }

  void handleEnergyRateAddition() {
    _energyRate += 0.25;
    notifyListeners();
  }

  void handleEnergyRateSubtraction() {
    if (_energyRate > 0.0) {
      _energyRate -= 0.25;
    }
    notifyListeners();
  }

  void handleSaveButton() {
    box.put('occupancy', _occupancy);
    box.put('energyRate', _energyRate);
  }
}
