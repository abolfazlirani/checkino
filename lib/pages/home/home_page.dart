/// Generated by Flutter GetX Starter on 2022-02-16 21:02
import 'dart:io';

import 'package:checkino/app/common/ThemeController.dart';
import 'package:checkino/app/pages/home/home_setting_dialog.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../main.dart';
import 'home_logic.dart';
import 'home_state.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeLogic logic2 = Get.put(HomeLogic());
  final HomeState state = Get
      .find<HomeLogic>()
      .state;

  List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.lightBlueAccent,
    Colors.pink,
  ];

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (tmeloj) {
          return GetBuilder<HomeLogic>(builder: (logic) {
            return Scaffold(

              backgroundColor: Get.theme.primaryColor,

              body: Center(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      child: Image.asset(
                        "assets/image/homeBack.png", fit: BoxFit.cover,),
                    ),
                    Column(
                      children: [
                        WindowTitleBar(),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text("splash_title", style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),).tr()
                                        ],
                                      ),
                                      Text(
                                        tr("home_toconnected") +
                                            logic.mainApi.value,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                      Obx(() {
                                        return Text(
                                          logic
                                              .isConnected
                                              .value
                                              ? "home_connected"
                                              : "home_notconnected",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15),
                                        ).tr();
                                      })
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: GetBuilder<HomeLogic>(
                                      builder: (logic) {
                                        return Container(

                                          child: GestureDetector(
                                            onTap: () {

                                            },
                                            child: AnimatedContainer(
                                              duration: Duration(
                                                  milliseconds: 300
                                              ),
                                              width: 150,
                                              decoration: BoxDecoration(
                                                color: logic.isConnected.value
                                                    ? tmeloj.theme.disabledColor
                                                    : Color(0xff011A39),

                                                shape: BoxShape.circle,

                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons
                                                      .power_settings_new_outlined,
                                                ),
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: !logic.isConnected
                                                      .value ? tmeloj
                                                      .theme
                                                      .disabledColor : tmeloj
                                                      .theme
                                                      .disabledColor
                                                      .withOpacity(0.5),
                                                  width: 8),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: tmeloj.theme
                                                        .disabledColor
                                                        .withOpacity(0.3),
                                                    blurRadius: 19,
                                                    spreadRadius: 5,
                                                    offset: Offset(0, 0)
                                                )
                                              ]
                                          ),
                                          padding: EdgeInsets.all(2),
                                        );
                                      })),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        GetBuilder<HomeLogic>(builder: (logic) {
                                          return AnimatedContainer(
                                            duration: Duration(
                                                milliseconds: 500),
                                            width: 250,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: logic.protect.value
                                                    ? tmeloj.theme
                                                    .disabledColor
                                                    : Colors
                                                    .transparent,
                                                border: Border.all(
                                                    color: tmeloj.theme
                                                        .disabledColor),
                                                borderRadius: BorderRadius
                                                    .circular(5)
                                            ),
                                            child: MaterialButton(
                                              hoverColor: !logic
                                                  .protect
                                                  .value
                                                  ? tmeloj.theme.disabledColor
                                                  .withOpacity(
                                                  0.5) : Colors.white
                                                  .withOpacity(
                                                  0.1),
                                              onPressed: () {
                                                logic.pressButton();
                                               ;
                                              },
                                              child: Center(
                                                child: Text(
                                                  !logic
                                                      .protect
                                                      .value
                                                      ? "home_protect_start"
                                                      : "home_protect_stop",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w400,
                                                      fontSize: 15),
                                                ).tr(),
                                              ),
                                            ),
                                          );
                                        }),

                                        Container(
                                            width: 250,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                CustomPopupMenu(
                                                  child: Container(
                                                    padding: EdgeInsets.all(10),

                                                    child: Icon(Icons.language,
                                                      color: tmeloj.theme
                                                          .disabledColor,),
                                                  ),
                                                  menuBuilder: _buildLongPressMenu,
                                                  barrierColor: Colors
                                                      .transparent,
                                                  pressType: PressType
                                                      .singleClick,
                                                ),
                                                IconButton(onPressed: () {
                                                  showCustomDialog(context);
                                                },
                                                  icon: Icon(Icons.settings),
                                                  color: tmeloj.theme
                                                      .disabledColor,),
                                                IconButton(onPressed: () {
                                                  showCustomDialog3(context);
                                                },
                                                  icon: Icon(
                                                      Icons.info_outline),
                                                  color: tmeloj.theme
                                                      .disabledColor,),
                                              ],
                                            ))
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            );
          });
        });
  }

  Widget _buildLongPressMenu() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
          width: 150,
          color: const Color(0xFF4C4C4C),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: menuItems
                .asMap()
                .entries
                .map((e) {
              return InkWell(
                onTap: () {
                  EasyLocalization.of(context)!.setLocale(e.value.locale).then((
                      value) {
                    Get.updateLocale(e.value.locale);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(4),

                  child: Column(
                    children: [
                      Container(
                          width: 30,
                          child: Image.asset("assets/image/${e.value
                              .assetsIcon}.png")),
                      Text(e.value.title, maxLines: 1, style: TextStyle(
                          fontSize: 12),)
                    ],
                  ),
                ),
              );
            }).toList(),
          )
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return HomeSettingDialog(context);
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


  List<ItemModel> menuItems = [
    ItemModel("English", "us", Locale("en")),
    ItemModel("فارسی", "ir", Locale("fa")),
  ];
  void showCustomDialog3(BuildContext context) async {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 230,
            width: 350,
            child: Material(
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text("About",style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Text("Checkino - Check Running Proxy App",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Developer : Abolfazl irani",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.grey),)), Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: (){
                              Get.back();
                              _launchURL("https://instagram.com/abo_pv");
                            }, child: Text("Instagram",style:  TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.grey),)),
                  Text(" - ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.grey),),
                            TextButton(onPressed: (){
                              Get.back();
                              _launchURL("https://github.com/abolfazlirani/Checkino");
                            }, child: Text("Github",style:  TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.grey),)),


                          ],
                        )),
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
                          Get.back();

                        },
                        child: Center(
                          child: Text(
                            "about_close",
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
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(color: Get.theme.primaryColor,
                borderRadius: BorderRadius.circular(5)),
          ),
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
  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}

class ItemModel {
  String title;
  String assetsIcon;
  Locale locale;

  ItemModel(this.title, this.assetsIcon, this.locale);
}