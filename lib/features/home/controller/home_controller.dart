import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final emailController = TextEditingController();
  final height1Controller = TextEditingController();
  final height2Controller = TextEditingController();

  RxBool isClicked = false.obs;
  RxDouble maxValue1 = 40.0.obs;
  RxDouble sliderValue1 = 1.0.obs;

  RxDouble maxValue2 = 40.0.obs;
  RxDouble sliderValue2 = 1.0.obs;

  RxDouble maxValue3 = 40.0.obs;
  RxDouble sliderValue3 = 1.0.obs;

  RxInt selectedMenu = 0.obs;
  void selectMenu(int menuIndex) {
    selectedMenu.value = menuIndex;
  }

  RxInt radioSelectedValue = 0.obs;

  void updateSelectedValue(int value) {
    radioSelectedValue.value = value;
  }

  RxInt selectedValueDropButton = 0.obs;

  void selectValueDropButton(int menuIndex) {
    selectedValueDropButton.value = menuIndex;
  }
}