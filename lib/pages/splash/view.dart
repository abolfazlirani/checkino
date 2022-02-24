import 'package:checkino/app/common/ThemeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../main.dart';
import 'logic.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) {
      _visible=true;
      setState(() {

      });
    });
    Future.delayed(Duration(seconds: 2)).then((value) {

      Get.offAndToNamed("/home");
    });
  }
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SplashLogic>();
    final state = Get.find<SplashLogic>().state;

    return Scaffold(
      backgroundColor: Get.theme.accentColor,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/image/splashbg.png",fit: BoxFit.cover,),
          ),
          WindowTitleBar(),
          AnimatedOpacity(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 100,
                      child: Image.asset("assets/image/splashlogo.png"),
                    ),
                    Text("splash_title".tr,style: TextStyle(color: Get.theme.disabledColor,fontSize: 19,fontWeight: FontWeight.bold,letterSpacing: 2),)
                  ],
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 30,
    margin: EdgeInsets.only(bottom: 40),
    height: 30,
    child: CircularProgressIndicator(
      color: Get.find<ThemeController>().theme.disabledColor,
    ),
    ))]),
    );
  }
}
