import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/models/create_model/add_to_cart_model.dart';
import 'package:farha_app/models/create_model/beauty_center_create_model.dart';
import 'package:farha_app/provider/create_beauty_api.dart';
import 'package:farha_app/user_interface/widgets/general_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AddToCartBloc {
  AddToCartModel model = new AddToCartModel();

  bool _checkIsValid(BuildContext context) {

    if ((model.type ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_type"));
      return false;
    }
    if ((model.bookingData ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_bookingData"));
      return false;
    }
    if ((model.notes ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_type"));
      return false;
    }
    if ((model.serviceId ?? "").isEmpty ) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_serviceId"));
      return false;
    }

    return true;
  }

  create(context) {
    if (_checkIsValid(context)) {
      ProgressDialog progressDialog = GeneralWidget.progressDialog(context);
      progressDialog.show().then((value) {
        ApiCreateBeauty(context).create(model.toMap()).then((res) {
          progressDialog.hide();
          if (res != null) {
            Fluttertoast.showToast(msg: "success");
            Navigator.pop(context);
          }
        });
      });
    }
  }

}
