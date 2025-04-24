import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  TextEditingController urlController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  int currentIndex = 0;
  int selectedColorIndex = 0;
  int selectedEyeShapeIndex = 0;
  int selectedLogoIndex = 0;
  int pngSvgJpgIndex = 0;

  AppProvider() {
    urlController.addListener(() {
      notifyListeners();
    });
  }

  void setCurrentIndex(int index){
    currentIndex = index;
    notifyListeners();
  }

  void setSelectedColor(int index){
    selectedColorIndex = index;
    notifyListeners();
  }

  void setSelectedEyeShape(index){
    selectedEyeShapeIndex = index;
    notifyListeners();
  }

  void setSelectedLogoIndex(int index){
    selectedLogoIndex = index;
    notifyListeners();
  }

  void setPngSvgJpgIndex(int index){
    pngSvgJpgIndex = index;
    notifyListeners();
  }
}
