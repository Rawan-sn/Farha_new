import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/material.dart';

import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';

class ApiMyCart extends ApiProvider {
  ApiMyCart(BuildContext context) : super(context);

  Future<WebServiceResponse> getCart() async {


    dynamic response = await fetchRequest(
        uri: getUri(ApiConstants.myCart));
    return response;
  }
}
