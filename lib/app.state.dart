import 'package:flutter/material.dart';
import 'package:simplenoteapp/types/notate.type.dart';

class AppState extends ChangeNotifier {
  List<Notate> notates = [];

  void addNotate(Notate notate) {
    notates.add(notate);
    notifyListeners();
  }
}
