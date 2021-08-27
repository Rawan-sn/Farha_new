import 'dart:io';

import 'package:farha_app/helper/data_store.dart';
import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/material.dart';
import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';
import 'package:http/http.dart' as http;

class ApiUploadImage extends ApiProvider {
  ApiUploadImage(BuildContext context) : super(context);

  Future<WebServiceResponse> upload(var file,String type) async {
    Map<String,dynamic> queryParameters = {
      "image": file,
      "type": type
    };

    final response = await http.get(
        Uri.http(
            ApiConstants.authority, ApiConstants.uploadImage, queryParameters  ),
        headers: _getHeaders());


    if (response.statusCode == 200) {

      return WebServiceResponse.fromJson(response.body);
    }
    return null;
  }

  _getHeaders() {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "multipart/form-data",
      "lang": dataStore.lang,
    };
    if (dataStore.authUser != null) {
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
}
