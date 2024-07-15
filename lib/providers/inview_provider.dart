import 'package:flutter/material.dart';

class InViewProvider extends ChangeNotifier {
  int _inViewIndex = 0;

  int get inViewIndex => _inViewIndex;

  void setInViewVisible(index) async {
    _inViewIndex = index;
    await Future.delayed(const Duration(milliseconds: 500));
    notifyListeners();
  }
}
