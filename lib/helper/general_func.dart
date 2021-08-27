import 'dart:convert';

import 'dart:io';
import 'package:path/path.dart' as p;

import 'app_constants.dart';

class GeneralFanc {
  static String pathTobase64Image(String path) {
    List<int> imageBytes = File(path).readAsBytesSync();
    return "${base64.encode(imageBytes)}";
  }

  static String pathTobase64Video(String path) {
    List<int> videoBytes = File(path).readAsBytesSync();
    return "data:video/mp4;base64,${base64.encode(videoBytes)}";
  }

  static String pathTobase64Voice(String path) {
    List<int> voiceBytes = File(path).readAsBytesSync();
    return "data:audio/aac;base64,${base64.encode(voiceBytes)}";
  }

  static getNameFromMediaPath(String path) {
    return p.basename(path);
  }
  static String dateformatedWithDay(String strDate) {
    if (strDate == null) return "";
    DateTime date = DateTime.parse(strDate);
    return AppConstants().dateFormat3.format(date.toLocal());
  }

  static String dateformatedFromDate(DateTime date) {
    return AppConstants().dateFormat2.format(date);
  }


}
