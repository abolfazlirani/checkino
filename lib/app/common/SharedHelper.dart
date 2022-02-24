import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  late SharedPreferences prefs;

  static Future<SharedHelper> getInstance() async {
    SharedHelper s = new SharedHelper();
    await s.init();
    return s;
  }

  Future<SharedPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  String getColor() {
    return prefs.getString("maincolor") ?? "#9d4fc1";
  }




  void setColor(String colr) {
    prefs.setString("maincolor", colr);
  }
  void setCDuration(int duration) {
    prefs.setInt("duration", duration);
  }

  int getDuration() {
    return prefs.getInt("duration") ?? 60;
  }  String getIP() {
    return prefs.getString("mainIP") ?? "192.168.88";
  }

  void setIP(String parse) {
    prefs.setString("mainIP", parse);

  }


}
extension HexColor on String {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  Color toColor() {
    if (this.length >3) {
      final buffer = StringBuffer();
      if (this.length == 6 || this.length == 7) buffer.write('ff');
      buffer.write(this.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
    return Colors.white;
  }

/// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).

}
extension HexColor2 on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}