import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/cupertino.dart';

import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';

class ApiProfile extends ApiProvider {
  ApiProfile(BuildContext context) : super(context);

  Future<WebServiceResponse> getProfile() async {
    dynamic response = await fetchRequest(uri: getUri(ApiConstants.getProfile));
    print(response);
    return response;
  }
}
