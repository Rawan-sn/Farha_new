import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/material.dart';

import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';

class ApiService extends ApiProvider {
  ApiService(BuildContext context) : super(context);

  Future<WebServiceResponse> getService(String type, int perPage) async {
    var queryParameters = {
      "type": "$type",
      "per-page": "$perPage",
    };
    print(queryParameters);

    dynamic response = await fetchRequest(
        uri: getUri(ApiConstants.getService, queryParameters));
    return response;
  }
}
