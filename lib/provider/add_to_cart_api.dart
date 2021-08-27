import 'package:farha_app/helper/enums.dart';
import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/cupertino.dart';

import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';

class ApiAddToCart extends ApiProvider {
  ApiAddToCart(BuildContext context) : super(context);

  Future<WebServiceResponse> create(var body) async {

    dynamic response = await fetchRequest(
        uri: getUri(ApiConstants.addToCart,body), type: RequestType.post);

    return response;
  }
}
