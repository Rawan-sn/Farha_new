import 'dart:async';
import 'dart:convert';
import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/data_store.dart';
import 'package:farha_app/helper/enums.dart';
import 'package:farha_app/models/web_service_response_model.dart';
import 'package:farha_app/user_interface/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'dart:io' show Platform;
import 'dart:io';

import 'api_constants.dart';

class ApiProvider {
  BuildContext context;

  ApiProvider(this.context);

  Future<bool> _checkIsInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }

  Uri getUri(String target, [Map queryParameters]) {
    if (queryParameters != null) {
      return Uri.http(ApiConstants.authority, target, queryParameters
      as Map<String, dynamic>);
    } else {
      return Uri.http(ApiConstants.authority, target);
    }
  }

  _getHeaders() {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "lang": dataStore.lang,
    };
    if (dataStore.authUser != null) {
     // print("rrrrrrrrrrr");
      headers["Authorization"] = 'Bearer ${dataStore.authUser.token}';
    }

    if (Platform.isAndroid) {
      headers["platform"] = "userandroid";
      headers["device_type"] = "android";
    } else if (Platform.isIOS) {
      headers["platform"] = "userios";
      headers["device_type"] = "ios";
    }
    return headers;
  }

  Future<dynamic> fetchRequest({
    @required Uri uri,
    Map body,
    RequestType type = RequestType.get,
  }) async {
    var response;
    print("uri: $uri");
    try {
      bool isConnected = await _checkIsInternetConnected();
      print("_getHeaders: ${_getHeaders()}");
      if (isConnected) {
        switch (type) {
          case RequestType.get:
            response = await http.get(uri, headers: _getHeaders());
            break;
          case RequestType.post:
            response = await http.post(uri,
                headers: _getHeaders(), body: json.encode(body));
            break;
          case RequestType.put:
            response = await http.put(
              uri,
              headers: _getHeaders(),
              body: json.encode(body),
              encoding: utf8,
            );
            break;
          case RequestType.delete:
            response = await http.delete(uri, headers: _getHeaders());
            break;
          default:
        }
        if (response.statusCode == 200) {
          // If server returns an OK response, parse the JSON.
          var res = WebServiceResponse.fromJson(response.body);
          if (res.status == 200) {
            print("lllllllllllll");
            return res;
          }
          else if (res.status == 401) {
            dataStore.setAuthUser(null).then((_) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen())));
            Fluttertoast.showToast(msg: '${res.message}');
            return null;
          }
          else {
            print("ggggggggggggg");
            Fluttertoast.showToast(msg: '${res.message}');
            return null;
          }
        } else {
          print("If that response was not OK, throw an error.");
          Fluttertoast.showToast(msg: '${response.body}');
          return null;
        }
      } else {
        Fluttertoast.showToast(
            msg: AppLocalizations.of(context).trans("no_connection"));
        return null;
      }
    } catch (e) {
      print("Exception: ${e.toString()}");
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }
}
