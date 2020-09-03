import 'package:flutter/material.dart';

class ProviderInfo with ChangeNotifier {
  bool _escalones = false;

  get escalones {
    return _escalones;
  }

  set escalones(bool bandera) {
    this._escalones = bandera;

    notifyListeners();
  }
}
