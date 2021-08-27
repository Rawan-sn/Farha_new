import 'package:farha_app/helper/enums.dart';
import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/cupertino.dart';

import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';

class ApiRegister extends ApiProvider {
  ApiRegister(BuildContext context) : super(context);

  Future<WebServiceResponse> register(map) async {

    dynamic response = await fetchRequest(
        uri: getUri(ApiConstants.register,map), type: RequestType.post);

    return response;
  }
}
