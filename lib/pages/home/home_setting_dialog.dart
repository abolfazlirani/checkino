import 'dart:io';

import 'package:checkino/app/common/ThemeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

import 'home_logic.dart';

class HomeSettingDialog extends StatefulWidget {

  BuildContext context;

  HomeSettingDialog(this.context);

  @override
  State<HomeSettingDialog> createState() => _HomeSettingDialogState();
}

class _HomeSettingDialogState extends State<HomeSettingDialog> {
  dynamic _selecetedColor;

  List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.lightBlueAccent,
    Colors.pink,
  ];

  final HomeLogic logic = Get.put(HomeLogic());

  TextEditingController _selecetedIP = new TextEditingController();
  TextEditingController _selecetedDuration = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selecetedColor = Get.find<ThemeController>().theme.disabledColor;

  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: GetBuilder<HomeLogic>(builder: (logic) {
        _selecetedIP.text = logic.mainApi.value;
        _selecetedDuration.text = logic.duration.value.toString();
        return Container(
          height: 290,
          width: 350,
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                Align(child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(tr('settting_title')))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 1,
                        child: Text(tr('settting_ip'))),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(left: 19),

                        padding: EdgeInsets.symmetric(horizontal: 6),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Get.find<ThemeController>().theme.disabledColor),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: TextField(
                              controller: _selecetedIP,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      showCustomDialog2(_selecetedIP);
                                    }, icon: Icon(
                                    Icons.link_outlined,
                                  ),)
                              )

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(flex:1,child: Text(tr('settting_thene'))),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(left: 19),
                          child: Row(
                            children: _colors
                                .asMap()
                                .entries
                                .map((e) {
                              return InkWell(
                                onTap: () {

                                  _selecetedColor = e.value;
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  width: 30,
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: e.value,
                                      borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.white,width: _selecetedColor.value==e.value.value?3:0)
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex:1,child: Text(tr('duration_title'))),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(left: 19),

                        padding: EdgeInsets.symmetric(horizontal: 6),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Get.find<ThemeController>().theme.disabledColor),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: TextField(
                              controller: _selecetedDuration,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      showCustomDialog3(_selecetedDuration);
                                    }, icon: Icon(
                                    Icons.link_outlined,
                                  ),)
                              )

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      color:  Get.find<ThemeController>().theme
                          .disabledColor ,
                      border: Border.all(
                          color: Get.find<ThemeController>().theme
                              .disabledColor),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: MaterialButton(
                    hoverColor:Colors.white.withOpacity(
                        0.1),
                    onPressed: () {
                      pressButton();

                    },
                    child: Center(
                      child: Text(
                        "settting_save",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ).tr(),
                    ),
                  ),
                )
              ],
            ),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Get.theme.primaryColor,
              borderRadius: BorderRadius.circular(5)),
        );
      }),
    );
  }

  void showCustomDialog2(TextEditingController textEditingController) async {
    List<NetworkInterface> interfaces = await NetworkInterface.list(
        includeLoopback: false, type: InternetAddressType.any);
    showGeneralDialog(
      context: widget.context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: GetBuilder<HomeLogic>(builder: (logic) {
            return Container(
              height: 250,
              width: 350,
              child: Material(
                color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: interfaces
                        .asMap()
                        .entries
                        .map((e) {
                      return Container(
                        width: MediaQuery
                            .of(widget.context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Get.theme.disabledColor)
                        ),
                        margin: EdgeInsets.symmetric(vertical: 6),
                        height: 40,
                        child: MaterialButton(
                            onPressed: () {
                              textEditingController.text = e.value.addresses
                                  .elementAt(0)
                                  .address;
                              Get.back();
                            },
                            child: Text(" ${e.value.name} - ${e.value.addresses
                                .elementAt(0)
                                .address} ")),
                      );
                    }).toList(),
                  ),
                ),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.circular(5)),
            );
          }),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(0, 1), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  void showCustomDialog3(dynamic duration) async {
   Map<String,int> _durations = {
     "30 " + tr("duration_second"):30,
     "45 " + tr("duration_second"):45,
     "1 " + tr("duration_min"):60,
     "3 " + tr("duration_min"):180,
     "5 " + tr("duration_min"):300,
     "7 " + tr("duration_min"):420
   };
    showGeneralDialog(
      context: widget.context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: GetBuilder<HomeLogic>(builder: (logic) {
            return Container(
              height: 250,
              width: 350,
              child: Material(
                color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: _durations
                        .entries
                        .map((e) {
                      return Container(
                        width: MediaQuery
                            .of(widget.context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Get.theme.disabledColor)
                        ),
                        margin: EdgeInsets.symmetric(vertical: 6),
                        height: 40,
                        child: MaterialButton(
                            onPressed: () {
                              duration.text =e.value.toString()
                              ;
                              Get.back();
                            },
                            child: Text(" ${e.key} ")),
                      );
                    }).toList(),
                  ),
                ),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.circular(5)),
            );
          }),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(0, 1), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  void pressButton() {
   if (_selecetedDuration.text!= logic.duration.value.toString()) {
      logic.setDuration(int.parse(_selecetedDuration.text.toString()));
    }
    if (_selecetedIP.text!= logic.mainApi.value) {
    logic.setIP(_selecetedIP.text.toString());
    }
    if (_selecetedColor.value!= Get.find<ThemeController>().theme.disabledColor.value) {
      Get.find<ThemeController>().toggleDarkMode(_selecetedColor);
    }
    Get.back();
  }
}
