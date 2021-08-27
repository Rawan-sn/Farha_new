import 'package:farha_app/helper/enums.dart';
import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/material.dart';

import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';

class ApiLogin extends ApiProvider {
  ApiLogin(BuildContext context) : super(context);

  Future<WebServiceResponse> login(String email, String password) async {
    Map body = {
      "password": password,
      "email": email,
    };
    print(body);

    dynamic response = await fetchRequest(
        uri: getUri(ApiConstants.login), body: body, type: RequestType.post);

    return response;
  }
}
