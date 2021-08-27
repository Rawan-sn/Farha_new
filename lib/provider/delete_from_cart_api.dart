import 'package:farha_app/helper/enums.dart';
import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/cupertino.dart';

import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';

class ApiDeleteFromCart extends ApiProvider {
  ApiDeleteFromCart(BuildContext context) : super(context);

  Future<WebServiceResponse> deleteFromCart(String cart) async {
    Map<String, dynamic> queryParameters = {
      "cart": cart,
    };
    dynamic response = await fetchRequest(
        uri: getUri(ApiConstants.deleteFromCart+cart, queryParameters),
        type: RequestType.delete);

    return response;
  }
}
