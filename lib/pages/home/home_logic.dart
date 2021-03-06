/// Generated by Flutter GetX Starter on 2022-02-16 21:02
import 'dart:async';
import 'dart:io';

import 'package:checkino/app/common/SharedHelper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:win_toast/win_toast.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final state = HomeState();

  var  isConnected=false.obs;
  var  protect=false.obs;
  Toast? toast;
  var duration=60.obs;
  var mainApi = "192.168.1.1".obs;
  late SharedHelper sharedHelper;
  Timer? _timer;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
     sharedHelper= await SharedHelper.getInstance();
    _getDurationFromShredHelper();
    _getDurationFromShredHelper();
    _getIPFromShredHelper();

  }

  _getDurationFromShredHelper()async{
    duration = sharedHelper.getDuration().obs;
    update();
  }  _getIPFromShredHelper()async{
    mainApi = sharedHelper.getIP().obs;
    update();
  }

  setDuration(int du)async{
    sharedHelper.setCDuration(du);
    duration= du.obs;
    update();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  createToast()async {
    var mes = await WinToast.instance().initialize(
        appName: 'Checkino',
        productName: 'Checkino',


        companyName: 'abo');
    String subtitle = tr("notif_des");
    String subtitle2 = tr("notif_des2");
    toast = await  WinToast.instance().showToast(
        type: ToastType.text02, title:subtitle ,subtitle:subtitle2
     ,actions: [tr("home_protect_stop")]
  );

  toast!.eventStream.forEach((element) {

    if(element.toString().contains("ActivatedEvent{actionIndex: 0}")) {
        pressButton();
    }
  });
  }

  void pressButton() {
    if(protect.value){
      _stopProtect();
    }else{
      _startProtect();
    }
    protect(!protect.value);

    update();
  }

  _startProtect(){
    _checkVpnConnection();
    _timer = Timer.periodic(Duration(seconds: duration.value), (timer) {
      _checkVpnConnection();
    });
  }

  void setIP(String parse) {
    sharedHelper.setIP(parse);
    mainApi= parse.obs;
    update();
    if(protect.value){

    protect(!protect.value);
    }


  }

  void _checkVpnConnection() async{
    isConnected =(await CheckVpnConnection.isVpnActive(mainApi.value)).obs;
    if(!isConnected.value){
      createToast();
    }
    update();
  }

  void _stopProtect() {

    _timer!.cancel();
    isConnected(false);
    update();
  }
}
class CheckVpnConnection {

  ///Returns true if device has VPN connection
  static Future<bool> isVpnActive(String ip) async {
    bool isVpnActive=false;
    List<NetworkInterface> interfaces = await NetworkInterface.list(
        includeLoopback: false, type: InternetAddressType.any);
   interfaces.forEach((element ) {
    if(element.addresses.elementAt(0).address.contains(ip)){
      isVpnActive =true;
    }
   });
    return isVpnActive;
  }
}