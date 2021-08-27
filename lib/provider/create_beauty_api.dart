import 'package:farha_app/helper/enums.dart';
import 'package:farha_app/models/web_service_response_model.dart';
import 'package:flutter/cupertino.dart';

import 'base_provider/api_constants.dart';
import 'base_provider/api_provider.dart';

class ApiCreateBeauty extends ApiProvider {
  ApiCreateBeauty(BuildContext context) : super(context);

  Future<WebServiceResponse> create(var body) async {

    dynamic response = await fetchRequest(
        uri: getUri(ApiConstants.createBeautyCenter,body), type: RequestType.post);

    return response;
  }
}
