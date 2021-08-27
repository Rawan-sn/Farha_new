import 'package:farha_app/helper/enums.dart';
import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/cupertino.dart';

import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';

class ApiUpdateProfile extends ApiProvider {
  ApiUpdateProfile(BuildContext context) : super(context);

  Future<WebServiceResponse> getUpdateProfile(var body) async {
    dynamic response = await fetchRequest(uri: getUri(ApiConstants.getProfile),body:body ,type: RequestType.put);
    //print(response);
    return response;
  }
}
