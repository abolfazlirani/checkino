import 'package:checkino/app/common/SharedHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {



  bool isDarkMode = true;
 ThemeData theme = ThemeData(
   brightness: Brightness.dark,
   primaryColor: Color(0xff011A39),
   accentColor: Color(0xff1D5BFA),
   fontFamily: "sahel",
   disabledColor: Color(0xff9d4fc1),
 );

 @override
  void onInit() {
    // TODO: implement onInit
   _getShared();
    super.onInit();
  }
  void toggleDarkMode(Color s) async{
    SharedHelper sharedHelper = await SharedHelper.getInstance();

    sharedHelper.setColor(s.toHex());
    theme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: "sahel",

      primaryColor: Color(0xff011A39),
      accentColor: Color(0xff1D5BFA),
      disabledColor:s,
    );
    Get.changeTheme(theme);
    update();
  }

  void _getShared() async{
    SharedHelper sharedHelper = await SharedHelper.getInstance();
    theme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xff011A39),
      accentColor: Color(0xff1D5BFA),
      fontFamily: "sahel",

      disabledColor:sharedHelper.getColor().toColor(),
    );
    Get.changeTheme(theme);
    update();
  }
}
